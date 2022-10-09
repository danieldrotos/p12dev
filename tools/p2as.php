<?php
  
  $debugging= true;
  //$debugging= false;
  error_reporting(E_ALL);
  ini_set("display_errors", "On");
  $aw= 12;
  $expand= false;
  $view_hex= false;

  $lnr= 1;
  $addr= 0;
  $mem= array();
  $syms= array();
  
  if (isset($argv[0]))
  {
    $fin= '';
    for ($i=1; $i<$argc; $i++)
    {
      if ($argv[$i] == "-h")
      {
	$_REQUEST['submit']= "View hex";
	//echo "HEX!\n";
	$view_hex= true;
      }
      else if ($argv[$i] == "-m")
      {
	$i++;
	$aw= $argv[$i];
	$expand= true;
      }
      else
      {
	$_REQUEST['submit']= "";
	$fin= $argv[$i];
      }
    }
    if ($fin=='')
    {
      echo "asm file missing\n";
      exit(1);
    }
    $src= file_get_contents($fin);
  }
  else
  {
    if ($_REQUEST['submit'] == "Download verilog file")
    {
      header("Content-Type: application/octet-stream");
      header('Content-Disposition: attachment; filename="mem.v"');
      $debugging= false;
    }
    else
      echo "<pre>";
    $src= $_REQUEST['src'];
  }

  
  $conds= array(
    "AL" => 0,
      "EQ" => 0x1000000,
      "ZS" => 0x1000000,
      "Z1" => 0x1000000,
      "Z" => 0x1000000,
      "NE" => 0x2000000,
      "ZC" => 0x2000000,
      "Z0" => 0x2000000,
      "NZ" => 0x2000000,
      "CS" => 0x3000000,
      "HS" => 0x3000000,
      "CC" => 0x4000000,
      "LO" => 0x4000000,
      "MI" => 0x5000000,
      "NS" => 0x5000000,
      "SS" => 0x5000000,
      "PL" => 0x6000000,
      "NC" => 0x6000000,
      "SC" => 0x6000000,
      "VS" => 0x7000000,
      "OS" => 0x7000000,
      "VC" => 0x8000000,
      "OC" => 0x8000000,
      "HI" => 0x9000000,
      "LS" => 0xa000000,
      "GE" => 0xb000000,
      "LT" => 0xc000000,
      "GT" => 0xd000000,
      "LE" => 0xe000000
  );

  $insts= array(
    "DB" => array("icode"=>0, "params"=>array(
      "n_"=>array("icode"=>0,"placements"=>array("u8"))
    )),
      "DW" => array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("u16"))
      )),
      "DD" => array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("u32"))
      )),
      "NOP" => array("icode"=>0x00000000, "params"=>array(
        "_"=>array()
      )),
      "MOV" => array("icode"=>0x00000000, "params"=>array(
	"rr_"=>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
      )),
      "SED" => array("icode"=>0x00000000, "params"=>array(
	"rr_"=>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
      )),
      "MVL" => array("icode"=>0x00000000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","u16"))
      )),
      "MVH" => array("icode"=>0x00000000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","h16"))
      )),
      "MVZL" => array("icode"=>0x00000000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","zl16"))
      )),
      "MVS" => array("icode"=>0x00000000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","s16"))
      ))
  );

  function arri($a, $idx)
  {
    if (empty($a))
      return '';
    if (!is_array($a))
      return '';
    if (!isset($a[$idx]))
      return '';
    return $a[$idx];
  }

  

  function debug($x)
  {
    global $debugging;
    
    if ($debugging === true)
      echo ";;debug;; $x\n";
  }

  function is_cond($W)
  {
    global $conds;
    debug("is_cond($W);");
    if (!isset($conds[$W]))
      return false;
    $cond= $conds[$W];
    return $cond;
  }

  function is_inst($W)
  {
    global $insts;
    debug("is_inst($W);");
    if (!isset($insts[$W]))
    {
      //debug(";is_inst($W); not inst");
      return false;
    }
    $inst= $insts[$W];
    return $inst;
  }

  function is_label($w)
  {
    if ($w[strlen($w)-1] == ":")
      return substr($w, 0, strlen($w)-1);
    return false;
  }
  
  function is_reg($w)
  {
    $W= strtoupper($w);
    $W= preg_replace("/[+*-]/", "", $W);
    if ($W == "PC")
      $r= 15;
    else if ($W == "LR")
    $r= 14;
    else if ($W == "SP")
    $r= 13;
    else if (preg_match("/^R[0-9][0-9]*/", $W))
    {
      $w= substr($w, 1);
      $r= intval($w,0);
      return($r);
    }
    return false;
  }

  function mk_symbol($name, $value, $constant= false)
  {
    global $syms, $lnr;
    $sym= array(
      "name" => $name,
	"value" => $value,
	"line" => $lnr,
	"const" => $constant
    );
    $syms[$name]= $sym;
    return $sym;
  }

  

  function proc_line($l)
  {
    global $insts, $mem, $syms, $lnr, $addr;
    $org= $l;
    $icode= 0;
    $label= false;
    if (($w= strtok($l, " \t")) === false)
    {
      debug("proc_line; no words found in line $lnr");
      return;
    }
    $prew= "";
    $par_sep= " \t,[]():;";
    $inst= false;
    $error= false;
    $ok= false;
    while ($w !== false)
    {
      $W= strtoupper($w);
      debug("proc_line; w=$w");
      if (($n= is_label($w)) !== false)
      {
	debug("proc_line; found label=$n at addr=$addr");
        $label= mk_symbol($n, $addr);
        $ok= true;
      }
      else if (($cond= is_cond($W)) !== false)
      {
        debug("proc_line; COND= ".sprintf("%08x",$cond));
        $icode= $icode | $cond;
        debug("proc_line; ICODE= ".sprintf("%08x",$icode));
      }
      
      else if (($W == "=") || ($W == "EQU"))
      {
	$w= strtok(" \t");
	$val= intval($w,0);
	debug("proc_line; EQU w=$w val=$val");
	mk_symbol($prew, $val, $W=="=");
	debug("proc_line; SYMBOL $prew=$val");
	$ok= true;
	return;
      }

      else if ($W == "ORG")
      {
        $w= strtok(" \t");
        $addr= intval($w,0);
        debug("proc_line; addr=$addr");
        $ok= true;
	return;
      }

      else if ($W == "DB")
      {
	$orgw= $w;
        $w= strtok(" \t,");
	while ($w !== false)
	{
	  debug("Process param of DB: $w");
	  $params= array();
	  $params[]= $w;
	  $mem[$addr]= array(
	    "icode"=>0,
	      "label"=>$label,
	      "src"=>$orgw." ".$w,
	      "error"=>$error,
	      "inst"=>$insts["DB"],
	      "pattern"=>"n_",
	      "address"=>$addr,
	      "params"=>$params
	  );
	  debug( sprintf("mem[%04x] Added DB $w",$addr) );
	  $addr++;
	  $w= strtok(",");
	}
	return;
      }
      
      else if (($inst= is_inst($W)) !== false)
      {
	debug("proc_line; INST= ".sprintf("%08x",$inst["icode"]));
	$mem[$addr]= array(
          "icode"=>$icode,
            "label"=>$label,
            "src"=>$org,
            "error"=>$error,
	    "inst"=>$inst
        );
        $o= sprintf("%04x %08x", $addr, $icode);
        debug($o);
	$ok= true;
	break;
      }

      $prew= $w;
      $w= strtok($par_sep);
    }
    if ($inst === false)
      return;
    // continue with parameters
    $prew= $w;
    $w= strtok($par_sep);
    $pattern= "";
    $params= array();
    while ($w != false)
    {
      $W= strtoupper($w);
      if (($r= is_reg($W)) !== false)
      {
	$pattern.= "r";
	$params[]= $r;
      }
      else
      {
	$pattern.= "n";
	$params[]= $w;
      }
      $prew= $w;
      $w= strtok($par_sep);
    }
    $pattern.= "_";
    debug("param pattern=$pattern");
    $mem[$addr]["pattern"]= $pattern;
    $mem[$addr]["params"]= $params;
    $mem[$addr]["address"]= $addr;
    $addr++;
  }

  function param_value($p)
  {
    global $syms;
    if (empty($p))
      return 0;
    if (preg_match("/^0[xX][0-9a-fA-F]+/",$p) ||
      is_numeric($p))
    return intval($p, 0);
    $s= arri($syms,$p);
    if (!empty($s) && is_array($s))
      return $s["value"];
    return 0;
  }
  
  function proc_params($icode, $pattern, $allowed_params, $used_params)
  {
    // Allowed
    /* Array
       (
       [icode] => 0
       [placements] => Array
       (
       [0] => d
       [1] => u16
       )
       )
     */
    // Used
    /* Array
       (
       [0] => 6
       [1] => port
       )
     */
    $c= $icode;
    if (count($allowed_params)==0)
      return $icode;
    $icode|= $allowed_params["icode"];
    debug( sprintf("Pattern fixed %08x -> icode= %08x",$c,$icode) );
    foreach ($used_params as $i => $up)
    {
      $pt= $pattern[$i];
      if ($pt=="_")
	break;
      $pl= $allowed_params["placements"][$i];
      $pv= param_value($up);
      debug("Param placing: {$pt}: {$up}={$pv} as {$pl}");
      $c= $icode;
      if ($pl == "rd")
      {
	$pv&= 0xf;
	$pv<<= 20;
	$icode|= $pv;
      }
      else if ($pl == "ra")
      {
	$pv&= 0xf;
	$pv<<= 16;
	$icode|= $pv;
      }
      else if ($pl == "rb")
      {
	$pv&= 0xf;
	$pv<<= 8;
	$icode|= $pv;
      }
      else if ($pl == "u8")
      {
	$pv&= 0xff;
	$icode|= $pv;
      }
      else if ($pl == "u16")
      {
	$pv&= 0xffff;
	$icode|= $pv;
      }
      else if ($pl == "s16")
      {
	$pv&= 0xffff;
	if ($pv & 0x8000)
	  $pv|= 0xffff0000;
	$icode= $pv;
      }
      else if ($pl == "u32")
      {
	$icode= $pv;
      }
      else if ($pl == "h16")
      {
	$pv&= 0xffff;
	$pv<<= 16;
	$icode|= $pv;
      }
      else if ($pl == "zl16")
      {
	$pv&= 0xffff;
	$icode= $pv;
      }
      debug( sprintf("Param placed %08x -> icode= %08x",$c,$icode) );
    }
    return $icode;
  }
  
  // Load source file and do PHASE 1
  
  $lsep= "\r\n";
  $l= strtok($src, $lsep);
  while ($l !== false)
  {
    $lines[$lnr]= $l;
    $l= strtok($lsep);
    $lnr++;
  }
  $nuof_lines= $lnr;
  debug("$nuof_lines lines buffered");
  $addr= 0;
  $mem[$addr]= 0;
  $addr= 1;
  for ($lnr= 1; $lnr < $nuof_lines; $lnr++)
  {
    $l= trim($lines[$lnr]);
    $l= preg_replace("/;.*$/", "", $l);
    debug("\n");
    debug("line[$lnr]: $l");
    proc_line($l);
  }

  debug("\n\n");

  $abc=10;
  $s='$abc/2';
  $r=eval("return $s ;");
  debug("abc=$abc r=$r\n");

  $hex= '';
  debug("SYMBOLS");
  //debug ("syms[0]= ${syms[0]}");
  $hex.= "//; SYMBOLS\n";
  if (!empty($syms))
  {
    foreach ($syms as $k => $s)
    {
      if ($s['const'] == true)
	$c= '=';
      else
	$c= ';';
      $o= sprintf("//%s %08x", $c, $s["value"])." $k";
      $hex.= $o."\n";
      debug($o);
    }
  }


  // PAHSE 2
  
  debug(";  PHASE 2\n");
  foreach ($mem as $a => $m)
  {
    //echo "a=$a, m=".print_r($m,true)."\n";
    if (!is_array($m))
      continue;
    debug(print_r($m,true));
    if (is_array(arri($m,"inst")) &&
      is_array(arri($m,"params")) &&
      !empty($m["pattern"]))
    {
      debug("mem[{$m['address']}] is an instruction: {$m['src']}");
      $pat= arri($m,"pattern");
      $ip= arri($m["inst"]["params"],$pat);
      //debug("Looking $pat in array ".print_r($m["inst"]["params"],true));
      //debug("ip=".print_r($ip,true));
      if (!is_array($ip))
      {
	debug("Used pattern ($pat) does not match to any allowed");
      }
      else
      {
	debug("Used pattern matches to an allowed one: $pat");
	$m['icode']= proc_params($m["icode"], $pat, $ip, $m["params"]);
      }
    }
    debug( sprintf("Code of mem[%04x] is ready: %08x\n\n",$a,$m['icode']) );
  }
  debug("; PHASE 2 done");

  $hex.= "//; CODE\n";
  $p= -1;
  foreach ($mem as $a => $m)
  {
    if (!is_array($m))
      continue;
  }

  echo $hex;
  
?>
