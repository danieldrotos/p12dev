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
      "EQ" => 0x10000000,
      "ZS" => 0x10000000,
      "Z1" => 0x10000000,
      "Z"  => 0x10000000,
      "NE" => 0x20000000,
      "ZC" => 0x20000000,
      "Z0" => 0x20000000,
      "NZ" => 0x20000000,
      "CS" => 0x30000000,
      "HS" => 0x30000000,
      "C1" => 0x30000000,
      "C"  => 0x30000000,
      "CC" => 0x40000000,
      "LO" => 0x40000000,
      "C0" => 0x40000000,
      "NC" => 0x40000000,
      "MI" => 0x50000000,
      "NS" => 0x50000000,
      "SS" => 0x50000000,
      "S1" => 0x50000000,
      "S " => 0x50000000,
      "PL" => 0x60000000,
      "NS" => 0x60000000,
      "SC" => 0x60000000,
      "S0" => 0x60000000,
      "VS" => 0x70000000,
      "OS" => 0x70000000,
      "V1" => 0x70000000,
      "O1" => 0x70000000,
      "V"  => 0x70000000,
      "O"  => 0x70000000,
      "VC" => 0x80000000,
      "OC" => 0x80000000,
      "NV" => 0x80000000,
      "NO" => 0x80000000,
      "HI" => 0x90000000,
      "LS" => 0xa0000000,
      "GE" => 0xb0000000,
      "LT" => 0xc0000000,
      "GT" => 0xd0000000,
      "LE" => 0xe0000000
  );

  $insts= array(
    // data placers
    "DB"  =>array("icode"=>0, "params"=>array(
      "n_"=>array("icode"=>0,"placements"=>array("#8"))
    )),
      "DW"  =>array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      "DD"  =>array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#32"))
      )),
      // Macro insts
      // NOP= mov r0,r0
      "NOP" =>array("icode"=>0x00000000, "params"=>array(
        "_"=>array()
      )),
      // JMP= mvzl r15,u16
      "JMP" =>array("icode"=>0x01f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // JZ= z1 mvzl r15,u16
      "JZ" =>array("icode"=>0x11f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // JNZ= z0 mvzl r15,u16
      "JNZ" =>array("icode"=>0x21f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // JP= mov r15,rb
      "JP"  =>array("icode"=>0x00f00000, "params"=>array(
        "r_"=>array("icode"=>0,"placements"=>array("rb"))
      )),
      // RET= mov r15,r14
      "RET"  =>array("icode"=>0x00f00e00, "params"=>array(
        "_"=>array()
      )),
      // PUSH= st rd,*r13,0
      "PUSH"=>array("icode"=>0x0d0d0000, "params"=>array(
        "r_"=>array("icode"=>0,"placements"=>array("rd"))
      )),
      // POP= ld rd,*r13,0
      "POP"=>array("icode"=>0x0f0d0000, "params"=>array(
        "r_"=>array("icode"=>0,"placements"=>array("rd"))
      )),
      // INC= add rd,#1
      "INC"  =>array("icode"=>0x01040001, "params"=>array(
        "r_"=>array("icode"=>0,"placements"=>array("rd"))
      )),
      // DEC= add rd,#-1
      "DEC"  =>array("icode"=>0x0104ffff, "params"=>array(
        "r_"=>array("icode"=>0,"placements"=>array("rd"))
      )),
      // LDL0= mvzl rd,#
      "LDL0" =>array("icode"=>0x00020000, "params"=>array(
        "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // LDL= mvl rd,#
      "LDL"  =>array("icode"=>0x00000000, "params"=>array(
        "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // LDH= mvh rd,#
      "LDH"  =>array("icode"=>0x00010000, "params"=>array(
        "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // 000: 000 0 ALU R  000 1 ALU #
      // ALU R only
      "MOV"  =>array("icode"=>0x00000000, "params"=>array(
	"rr_"=>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
      )),
      "SED"  =>array("icode"=>0x00030000, "params"=>array(
	"rr_"=>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
      )),
      // ALU # only
      "MVL"  =>array("icode"=>0x00000000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "MVH"  =>array("icode"=>0x00010000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "MVZL" =>array("icode"=>0x00020000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "MVS"  =>array("icode"=>0x00030000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // ALU R/# common
      "ADD"    =>array("icode"=>0x00040000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "ADC"    =>array("icode"=>0x00050000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "SUB"    =>array("icode"=>0x00060000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "SBB"    =>array("icode"=>0x00070000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "CMP"    =>array("icode"=>0x00080000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "MUL"    =>array("icode"=>0x00090000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "PLUS"   =>array("icode"=>0x000a0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "TEST"   =>array("icode"=>0x000c0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "OR"     =>array("icode"=>0x000d0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "XOR"    =>array("icode"=>0x000e0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "AND"    =>array("icode"=>0x000f0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // 001 ALU 1op
      "ZEB"   =>array("icode"=>0x02000000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb"))
      )),
      "ZEW"   =>array("icode"=>0x02010000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SEB"   =>array("icode"=>0x02020000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SEW"   =>array("icode"=>0x02030000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "NOT"   =>array("icode"=>0x02040000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "NEG"   =>array("icode"=>0x02050000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "ROR"   =>array("icode"=>0x02060000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "ROL"   =>array("icode"=>0x02070000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SHL"   =>array("icode"=>0x02080000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SHR"   =>array("icode"=>0x02090000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SHA"   =>array("icode"=>0x020a0000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SZ"   =>array("icode"=>0x020b0000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SEC"   =>array("icode"=>0x020c0000, "params"=>array(
	"_"  =>array()
      )),
      "CLC"   =>array("icode"=>0x020d0000, "params"=>array(
	"_"  =>array()
      )),
      "GETF"   =>array("icode"=>0x020e0000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SETF"   =>array("icode"=>0x020f0000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      // 010 CALL
      "CALL"  =>array("icode"=>0x04000000, "params"=>array(
	"rn_" =>array("icode"=>0x01000000,"placements"=>array("rd","#20")),
	"n_"  =>array("icode"=>0x00000000,"placements"=>array("#24"))
      )),
      // 011 -
      // 1x0 W ST
      "ST"      =>array("icode"=>0x08000000, "params"=>array(
	"rrr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb")),
	  "rrn_"=>array("icode"=>0x04000000,"placements"=>array("rd","ra","#16")),
	"rr_"   =>array("icode"=>0x04000000,"placements"=>array("rd","ra"))
      )),
      // 1x1 W LD
      "LD"      =>array("icode"=>0x0a000000, "params"=>array(
	"rrr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb")),
	  "rrn_"=>array("icode"=>0x04000000,"placements"=>array("rd","ra","#16")),
	"rr_"   =>array("icode"=>0x04000000,"placements"=>array("rd","ra"))
      )),
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

  /**
   * parse_string parses a string and returns an array of the parsed elements.
   * This is an all-or-none function, and will return NULL if it cannot completely
   * parse the string.
   * @param string $string The OID to parse.
   * @return array|NULL A list of OID elements, or null if error parsing.
   */
  function parse_string($string)
  {
    $result = array();
    while (true)
    {
      $matches = array();
      //$match_count = preg_match('/^(?:((?:[^\\\\\\. "]|(?:\\\\.))+)|(?:"((?:[^\\\\"]|(?:\\\\.))+)"))((?:[\\. ])|$)/', $string, $matches);
      $match_count = preg_match('/^(?:((?:[^\\\\\\, "]|(?:\\\\.))+)|(?:"((?:[^\\\\"]|(?:\\\\.))+)"))((?:[\\, ])|$)/', $string, $matches);
      if (null !== $match_count && $match_count > 0)
      {
        // [1] = unquoted, [2] = quoted
        $value = strlen($matches[1]) > 0 ? $matches[1] : $matches[2];
	
        $result[] = stripcslashes($value);
	
        // Are we expecting any more parts?
        if (strlen($matches[3]) > 0)
        {
          // I do this (vs keeping track of offset) to use ^ in regex
          $string = substr($string, strlen($matches[0]));
        }
        else
        {
          return $result;
        }
      }
      else
      {
        // All or nothing
        return null;
      }
    } // while
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
    debug("Check if $w/$W is a reg?");
    $W= preg_replace('/[+*-]/', "", $W);
    debug("Check if $w/$W is a reg?");
    if ($W == "PC")
    {  $r= 15; debug("pc=15"); }
    else if ($W == "LR")
    { $r= 14;; debug("lr=14"); }
    else if ($W == "SP")
    { $r= 13; debug("sp=13"); }
    else if (preg_match("/^R[0-9][0-9]*/", $W))
    {
      $w= substr($W, 1);
      $r= intval($w,0);
      debug("Match as a reg: w=$w r=$r");
      return($r);
    }
    else
      return false;
    return $r;
  }

  function is_w($W)
  {
    if (empty($W))
      return false;
    if (preg_match('/^[+]/',$W) ||
      preg_match('/^[*]/',$W) ||
      preg_match('/^[-]/',$W) ||
      preg_match('/[+]$/',$W) ||
      preg_match('/[-]$/',$W))
    return true;
  }

  function is_u($W)
  {
    if (empty($W))
      return false;
    if (preg_match('/^[+]/',$W) ||
      preg_match('/[+]$/',$W))
    return true;
  }

  function is_p($W)
  {
    if (empty($W))
      return false;
    if (preg_match('/^[+]/',$W) ||
      preg_match('/^[-]/',$W))
    return true;
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

      else if ($W == "DS")
      {
	$x= 0 + strtok(" \t,");
	$addr+= $x;
	debug(";proc_line; addr=$addr");
	$ok= true;
	return;
      }
      
      else if (preg_match('/^D[BWD]$/', $W))
      {
	$orgw= $w;
	$pl= preg_replace("/^.*[dD][bBwWdD][ \t]+/", "", $l);
	debug("Param part of line: $pl");
	if (!empty($pl) && ($pl[0]=="\""))
	{
	  $a= parse_string($pl);
	  $s= $a[0];
	  debug("Parsed string: \"{$s}\"");
	  for ($i= 0; $i<strlen($s); $i++)
	  {
	    $params= array();
	    $params[]= $pv= ord($s[$i]);
	    $mem[$addr]= array(
	      "icode"=>0,
		"label"=>$label,
		"src"=>$orgw." $pv",
		"error"=>$error,
		"inst"=>$insts[$W],
		"pattern"=>"n_",
		"address"=>$addr,
		"params"=>$params
	    );
	    debug( sprintf("mem[%04x] Added char DB $pv",$addr) );
	    $addr++;
	  }
	  $params= array();
	  $params[]= 0;
	  $mem[$addr]= array(
	    "icode"=>0,
	      "label"=>$label,
	      "src"=>$orgw,
	      "error"=>$error,
	      "inst"=>$insts[$W],
	      "pattern"=>"n_",
	      "address"=>$addr,
	      "params"=>$params
	  );
	  debug( sprintf("mem[%04x] Added string 0",$addr) );
	  $addr++;
	  return ;
	}
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
	      "inst"=>$insts[$W],
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
	debug("proc_line; INST= ".sprintf("%08x",$icode|$inst["icode"]));
	$mem[$addr]= array(
          "icode"=>$icode|$inst['icode'],
            "label"=>$label,
            "src"=>$org,
            "error"=>$error,
	    "inst"=>$inst
        );
        $o= sprintf("%04x %08x", $addr, $inst['icode']);
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
    while ($w !== false)
    {
      $W= strtoupper($w);
      debug("Parameter word: $w $W");
      $r= is_reg($W);
      debug("is_reg? r=$r");
      if ($r !== false)
      {
	$pattern.= "r";
	$params[]= $r;
	if (is_w($W))
	{
	  $mem[$addr]['icode']|= 0x01000000;
	  debug( sprintf("Set W bit: %08x",$mem[$addr]['icode']) );
	}
	if (is_u($W))
	{
	  $mem[$addr]['icode']|= 0x00008000;
	  debug( sprintf("Set U bit: %08x",$mem[$addr]['icode']) );
	}
	if (is_p($W))
	{
	  $mem[$addr]['icode']|= 0x00004000;
	  debug( sprintf("Set P bit: %08x",$mem[$addr]['icode']) );
	}
	debug("Parameter value: $r");
      }
      else
      {
	$pattern.= "n";
	$params[]= $w;
	debug("Parameter value: $w");
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
    if ($p[0] == "'")
    {
      $c= substr($p,1,1);
      $v= ord($c);
      return $v;
    }
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
	$icode&= 0xff0fffff;
	$icode|= $pv;
      }
      else if ($pl == "ra")
      {
	$pv&= 0xf;
	$pv<<= 16;
	$icode&= 0xfff0ffff;
	$icode|= $pv;
      }
      else if ($pl == "rb")
      {
	$pv&= 0xf;
	$pv<<= 8;
	$icode&= 0xfffff0ff;
	$icode|= $pv;
      }
      else if ($pl == "#8")
      {
	$pv&= 0xff;
	$icode&= 0xffffff00;
	$icode|= $pv;
      }
      else if ($pl == "#16")
      {
	$pv&= 0xffff;
	$icode&= 0xffff0000;
	$icode|= $pv;
      }
      else if ($pl == "#20")
      {
	$pv&= 0xfffff;
	$icode&= 0xfff00000;
	$icode|= $pv;
      }
      else if ($pl == "#24")
      {
	$pv&= 0xffffff;
	$icode&= 0xff000000;
	$icode|= $pv;
      }
      else if ($pl == "#32")
      {
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
  //$addr= 0;
  //$mem[$addr]= 0;
  //$addr= 1;
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


  // PAHSE 2
  
  debug(";  PHASE 2\n");
  foreach ($mem as $a => $m)
  {
    //echo "a=$a, m=".print_r($m,true)."\n";
    if (!is_array($m))
      continue;
    //debug(print_r($m,true));
    if (is_array(arri($m,"inst")) &&
      is_array(arri($m,"params")) &&
      !empty($m["pattern"]))
    {
      debug( sprintf("mem[%x] is an instruction: %08x %s",$m['address'],$m['icode'],$m['src']) );
      //echo print_r($m,true);
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
    $mem[$a]= $m;
  }
  debug("; PHASE 2 done");

  
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


  $hex.= "//; CODE\n";
  $p= -1;
  foreach ($mem as $a => $m)
  {
    if (!is_array($m))
      continue;
    //echo print_r($m,true);
    if ($a != $p+1)
    {
      $p++;
      while ($p < $a)
      {
        debug( $o= sprintf("%08x ;%04x", 0, $p) );
        $hex.= $o."\n";
        $p++;
      }
    }
    $p= $a;
    $m['icode']&= 0xffffffff;
    if ($m['icode'] !== false)
    {
      debug( $o= sprintf("%08x //;%04x %s", $m['icode'], $a, $m["src"]) );
      $hex.= $o."\n";
      if ($m["error"] != false)
      {
        $o= "; ERROR: ".$m['error'];
        debug($o, "red");
        $hex.= $o."\n";
      }
    }
    else if ($m['error'] !== false)
    {
      $o= sprintf("; ERROR: %s in \"%s\"", $m['error'], $m['src']);
      debug($o, "red");
      $hex.= "; ".$o."\n";
    }
    else
      debug(";ph3; what?");
  }

  echo $hex;
  
?>
