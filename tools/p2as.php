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
    "NOP" => array(
      "value"=>0x00000000,
	"params"=>"",
	"style"=>false),
      "MOV" => array(
	"value"=>0x00000000,
	  "params"=>"DB",
	  "style"=>false)
  );
  
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

  function is_sym($w)
  {
    if ($w[strlen($w)-1] == ":")
      return substr($w, 0, strlen($w)-1);
    return false;
  }
  
  function w2reg($w)
  {
    $W= strtoupper($w);
    if ($W == "PC")
      $r= 15;
    else if ($W == "LR")
    $r= 14;
    else if ($W == "SP")
    $r= 13;
    else
    {
      if ($W[0] == 'R')
      {
	$w= substr($w, 1);
        $W= substr($W, 1);
      }
      $r= intval($w,0);
    }
    return $r;
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
  }

  

  function proc_line($l)
  {
    global $mem, $syms, $lnr, $addr;
    $org= $l;
    $icode= 0;
    $sym= false;
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
      debug("proc_line; w=$w");
      if (($n= is_sym($w)) !== false)
      {
	debug("proc_line; found label=$n at addr=$addr");
        mk_symbol($n, $addr);
        $ok= true;
      }
      else
      {
	$W= strtoupper($w);
	if (($cond= is_cond($W)) !== false)
	{
          debug("proc_line; COND= ".sprintf("%08x",$cond));
          $icode= $icode | $cond;
          debug("proc_line; ICODE= ".sprintf("%08x",$icode));
	}
	if (($inst= is_inst($W)) !== false)
	{
	  debug("proc_line; INST= ".sprintf("%08x",$inst["value"])." params=${inst['params']}");
	}
      }
      
      $prew= $w;
      $w= strtok($par_sep);
    }
    
  }


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


?>
