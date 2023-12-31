#!/usr/bin/php
<?php

$debugging= false;
$DevDeb= false;
$ddf= false;
error_reporting(E_ALL);
ini_set("display_errors", "On");

$lnr= 1;
$addr= 0;
$mem= array();
$syms= array();
$obj_name= '';
$lst_name= '';
$lst= false;
$proc= "P1";
$proc_set= false;
$segs= array();
$segment= false;
$insts= array();
$conds= array();
$first_fin= '';
$src= '';
$fina= array();
$conly= false;
$keep= false;
$out_type= "exe"; // "obj" // "lib"

if (isset($argv[0]))
{
    $fin= '';
    // process program arguments
    for ($i=1; $i<$argc; $i++)
    {
        if ($argv[$i] == "-o")
        {
            $i++;
            $obj_name= $argv[$i];
        }
        else if ($argv[$i] == "-l")
        {
            $debugging= true;
        }
        else if ($argv[$i] == "-dd")
        {
            $DevDeb= true;
        }
        else if ($argv[$i] == "-c")
        {
            $conly= true;
        }
        else if ($argv[$i] == "-k")
        {
            $keep= true;
        }
        else
        {
            $_REQUEST['submit']= "";
            $fin= $argv[$i];
            if ($first_fin == '')
                $first_fin= $fin;
            if (!file_exists($fin))
            {
                echo "Error: Input file ($fin) does not exists\n";
                exit(4);
            }
            $fina[]= $fin;
            //$src.= "\n";
            //$src.= file_get_contents($fin);
        }
    }
    // now arguments are processed
    
    if ($first_fin=='')
    {
        echo "Error: No source file specified\n";
        exit(1);
    }
    if ($obj_name == '')
    {
        $p= strrpos($first_fin, ".");
        if ($p === false)
        {
            echo "Error: Can not convert source filename to obj filename\n";
            exit(2);
        }
        $obj_name= substr($first_fin, 0, $p).($conly?".p2o":".p2h");
    }
    if ($debugging)
    {
        $p= strrpos($first_fin, ".");
        if ($p === false)
        {
            echo "Error: Can not convert source filename to list filename\n";
            exit(5);
        }
        $lst_name= substr($first_fin, 0, $p).".lst";
        $lst= fopen($lst_name, "w");
    }
    if ($DevDeb)
    {
        $p= strrpos($first_fin, ".");
        if ($p === false)
        {
            echo "Error: Can not convert source filename to devdeb filename\n";
            exit(6);
        }
        $ddf_name= substr($first_fin, 0, $p).".log";
        $ddf= fopen($ddf_name, "w");
    }
    $fext= pathinfo($obj_name, PATHINFO_EXTENSION);
    if ($conly)
    {
        if ($fext == "p2o")
            $out_type= "obj";
        else if ($fext == "p2l")
            $out_type= "lib";
    }
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


  
$conds1= array(
    "ALL" => 0,
    "AL" => 0,
    "S0" => 0x10000000,
    "S1" => 0x30000000,
    "C0" => 0x50000000,
    "C1" => 0x70000000,
    "Z0" => 0x90000000,
    "Z1" => 0xb0000000,
    "O0" => 0xd0000000,
    "O1" => 0xf0000000,
    
    "Z"  => 0xb0000000,
    "NZ" => 0x90000000
);


$conds2= array(
    "AL" => 0,
    "EQ" => 0x10000000,
    "ZS" => 0x10000000,
    "Z1" => 0x10000000,
    "Z"  => 0x10000000,
    "F"  => 0x10000000,
    "NE" => 0x20000000,
    "ZC" => 0x20000000,
    "Z0" => 0x20000000,
    "NZ" => 0x20000000,
    "T"  => 0x20000000,
    "CS" => 0x30000000,
    "HS" => 0x30000000,
    "C1" => 0x30000000,
    "C"  => 0x30000000,
    "UGE"=> 0x30000000,
    "CC" => 0x40000000,
    "LO" => 0x40000000,
    "C0" => 0x40000000,
    "NC" => 0x40000000,
    "ULT"=> 0x40000000,
    "MI" => 0x50000000,
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
    "V0" => 0x80000000,
    "O0" => 0x80000000,
    "NV" => 0x80000000,
    "NO" => 0x80000000,
    "HI" => 0x90000000,
    "UGT"=> 0x90000000,
    "LS" => 0xa0000000,
    "ULE"=> 0xa0000000,
    "GE" => 0xb0000000,
    "SGE"=> 0xb0000000,
    "LT" => 0xc0000000,
    "SLT"=> 0xc0000000,
    "GT" => 0xd0000000,
    "SGT"=> 0xd0000000,
    "LE" => 0xe0000000,
    "SLE"=> 0xe0000000
);


  $insts1= array(
    "DB"  =>array("icode"=>0, "params"=>array(
      "n_"=>array("icode"=>0,"placements"=>array("d8"))
    )),
      "DW"  =>array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("d16"))
      )),
      "DD"  =>array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("d32"))
      )),
      "NOP"=> array("icode"=>0x00000000, "params"=>array(
	"rrr_"  =>array("icode"=>0,"placements"=>array("rd","ra","rb1")),
	  "rr_" =>array("icode"=>0,"placements"=>array("rda","rb1")),
	  "r_"  =>array("icode"=>0,"placements"=>array("rd")),
	  "_"   =>array()
      )),
      "LD"    =>array("icode"=>0x01000000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra"))
      )),
      "ST"    =>array("icode"=>0x02000000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra"))
      )),
      "MOV"   =>array("icode"=>0x03000000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra"))
      )),
      "LDL0"  =>array("icode"=>0x04000000, "params"=>array(
	"rn_" =>array("icode"=>0x00000000,"placements"=>array("rd","#16"))
      )),
      "LDL"   =>array("icode"=>0x05000000, "params"=>array(
	"rn_" =>array("icode"=>0x00000000,"placements"=>array("rd","#16"))
      )),
      "LDH"   =>array("icode"=>0x06000000, "params"=>array(
	"rn_" =>array("icode"=>0x00000000,"placements"=>array("rd","h16"))
      )),
      "CALL"  =>array("icode"=>0x08000000, "params"=>array(
	"n_"  =>array("icode"=>0x00000000,"placements"=>array("#27"))
      )),
      "ADD"    =>array("icode"=>0x07000000|(0<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "ADC"    =>array("icode"=>0x07000000|(1<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "SUB"    =>array("icode"=>0x07000000|(2<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "SBB"    =>array("icode"=>0x07000000|(3<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "INC"    =>array("icode"=>0x07000000|(4<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "DEC"    =>array("icode"=>0x07000000|(5<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "AND"    =>array("icode"=>0x07000000|(6<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "OR"     =>array("icode"=>0x07000000|(7<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "XOR"    =>array("icode"=>0x07000000|(8<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "SHL"    =>array("icode"=>0x07000000|(9<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "SHR"    =>array("icode"=>0x07000000|(10<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "ROL"    =>array("icode"=>0x07000000|(11<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "ROR"    =>array("icode"=>0x07000000|(12<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "MUL"    =>array("icode"=>0x07000000|(13<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      //"DIV"    =>array("icode"=>0x07000000|(14<<7), "params"=>array(
      //"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
      //  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      //)),
      "CMP"    =>array("icode"=>0x07000000|(15<<7), "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","ra","rb1")),
	  "rr_"=>array("icode"=>0x00000000,"placements"=>array("rda","rb1"))
      )),
      "SHA"    =>array("icode"=>0x07000000|(16<<7), "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","ra")),
	  "r_" =>array("icode"=>0x00000000,"placements"=>array("rda"))
      )),
      "SETC"   =>array("icode"=>0x07000000|(17<<7), "params"=>array(
	"_"    =>array()
      )),
      "CLRC"   =>array("icode"=>0x07000000|(18<<7), "params"=>array(
	"_"    =>array()
      )),
      "JMP"  =>array("icode"=>0x04f00000, "params"=>array(
	"n_" =>array("icode"=>0x00000000,"placements"=>array("#16"))
      )),
      "JZ"   =>array("icode"=>0xb4f00000, "params"=>array(
	"n_" =>array("icode"=>0x00000000,"placements"=>array("#16"))
      )),
      "JNZ"  =>array("icode"=>0x94f00000, "params"=>array(
	"n_" =>array("icode"=>0x00000000,"placements"=>array("#16"))
      )),
      "RET"  =>array("icode"=>0x03fe0000, "params"=>array(
	"_" =>array()
      )),
      "PUSH" =>array("icode"=>0x020d0000, "params"=>array(
	"r_" =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "POP"  =>array("icode"=>0x010d0000, "params"=>array(
	"r_" =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
  );
  
  $insts2= array(
    // data placers
    "DB"  =>array("icode"=>0, "params"=>array(
      "n_"=>array("icode"=>0,"placements"=>array("d8"))
    )),
      "DW"  =>array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("d16"))
      )),
      "DD"  =>array("icode"=>0, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("d32"))
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
      // FALSE= z1 mvzl r15,u16
      "FALSE" =>array("icode"=>0x11f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // JNZ= z0 mvzl r15,u16
      "JNZ" =>array("icode"=>0x21f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // TRUE= z0 mvzl r15,u16
      "TRUE" =>array("icode"=>0x21f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // JC= c1 mvzl r15,u16
      "JC" =>array("icode"=>0x31f20000, "params"=>array(
        "n_"=>array("icode"=>0,"placements"=>array("#16"))
      )),
      // JNC= c0 mvzl r15,u16
      "JNC" =>array("icode"=>0x41f20000, "params"=>array(
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
        "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","h16"))
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
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","h16"))
      )),
      "MVZL" =>array("icode"=>0x00020000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "MVS"  =>array("icode"=>0x00030000, "params"=>array(
	"rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // ALU R/# common
      "ADD"    =>array("icode"=>0x00040000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "ADC"    =>array("icode"=>0x00050000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "SUB"    =>array("icode"=>0x00060000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "SBB"    =>array("icode"=>0x00070000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "CMP"    =>array("icode"=>0x00080000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "MUL"    =>array("icode"=>0x00090000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "PLUS"   =>array("icode"=>0x000a0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "BTST"   =>array("icode"=>0x000b0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "TEST"   =>array("icode"=>0x000c0000, "params"=>array(
	"rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "OR"     =>array("icode"=>0x000d0000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "XOR"    =>array("icode"=>0x000e0000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      "AND"    =>array("icode"=>0x000f0000, "params"=>array(
	"rrr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_","rb")),
	  "rr_"  =>array("icode"=>0x00000000,"placements"=>array("rd","rb")),
	  "rn_"=>array("icode"=>0x01000000,"placements"=>array("rd","#16"))
      )),
      // 001 ALU 1op
      "ZEB"   =>array("icode"=>0x02000000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
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
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_")),
	  "r_"=>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "ROL"   =>array("icode"=>0x02070000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_")),
	  "r_"=>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SHL"   =>array("icode"=>0x02080000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_")),
	  "r_"=>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SHR"   =>array("icode"=>0x02090000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_")),
	  "r_"=>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SHA"   =>array("icode"=>0x020a0000, "params"=>array(
	"rr_" =>array("icode"=>0x00000000,"placements"=>array("rd","_")),
	  "r_"=>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SZ"   =>array("icode"=>0x020b0000, "params"=>array(
	"r_" =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SEC"  =>array("icode"=>0x020c0000, "params"=>array(
	"_"  =>array()
      )),
      "CLC"  =>array("icode"=>0x020d0000, "params"=>array(
	"_"  =>array()
      )),
      "GETF"  =>array("icode"=>0x020e0000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      "SETF"  =>array("icode"=>0x020f0000, "params"=>array(
	"r_"  =>array("icode"=>0x00000000,"placements"=>array("rd"))
      )),
      // 010 CALL
      "CALL"  =>array("icode"=>0x04000000, "params"=>array(
	"rn_" =>array("icode"=>0x01000000,"placements"=>array("rd","#20")),
	  "n_"=>array("icode"=>0x00000000,"placements"=>array("#24"))
      )),
      // 011 -
      // 1x0 W ST
      "ST"      =>array("icode"=>0x00000000, "params"=>array(
	"rrr_"  =>array("icode"=>0x08000000,"placements"=>array("rd","ra","rb")),
	  "rrn_"=>array("icode"=>0x0c000000,"placements"=>array("rd","ra","#16")),
	  "rr_" =>array("icode"=>0x0c000000,"placements"=>array("rd","ra")),
	  // EXT 011L
	  "rn_" =>array("icode"=>0x06000000,"placements"=>array("rd","#16")),
	  "nr_" =>array("icode"=>0x06000000,"placements"=>array("#16","rd")),
      )),
      // 1x1 W LD
      "LD"      =>array("icode"=>0x02000000, "params"=>array(
	"rrr_"  =>array("icode"=>0x0a000000,"placements"=>array("rd","ra","rb")),
	  "rrn_"=>array("icode"=>0x0e000000,"placements"=>array("rd","ra","#16")),
	  "rr_" =>array("icode"=>0x0e000000,"placements"=>array("rd","ra")),
	  // EXT 011L
	  "rn_" =>array("icode"=>0x07000000,"placements"=>array("rd","#16"))
      )),
  );

$conds= $conds1;
$insts= $insts1;
  

function arri($a, $idx)
{
    if (empty($a))         return '';
    if (!is_array($a))     return '';
    if (!isset($a[$idx]))  return '';
    return $a[$idx];
}


function debug($x)
{
    global $debugging, $lst;
    if ($debugging === true && $lst !== false)
        fwrite($lst, ";; $x\n");
}

function devdeb($x)
{
    global $DevDeb, $ddf;
    if ($DevDeb && $ddf !== false)
        fwrite($ddf, $x);
}

function ddie($error_msg, $exit_code= 1, $f= false, $l= false)
{
    global $error, $fin, $lnr;
    if ($f === false) $f= $fin;
    if ($l === false) $l= $lnr;
    $error= "{$fin}:{$lnr}: {$error_msg}";
    debug("Error: $error");
    echo $error."\n";
    exit($exit_code);
}


function startof($str, $word)
{
    $p= strpos($str, $word);
    if ($p === false)
        return false;
    if ($p != 0)
        return false;
    return true;
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

function my_parse_string($s)
{
    $r= array();
    $i= 0;
    if (strlen($s)==0) return $r;
    if ($s[0]=='"') $i= 1;
    for (;($i<strlen($s)) && (ord($s[$i])!=0) && ($s[$i]!="\"");$i++)
    {
        $ch= $s[$i];
        $c= ord($ch);
        //echo "s[{$i}]={$c} {$ch}\n";
        if ($ch=="\\")
        {
            $i++;
            $ch= $s[$i];
            $c= ord($ch);
            //echo "s[{$i}]={$c} {$ch}\n";
            if ($c==0) break;
            if ($ch=="\"") $r[]= "\"";
            if ($ch=="a") $r[]= chr(7);
            if ($ch=="b") $r[]= chr(8);
            if ($ch=="e") $r[]= chr(0x1b);
            if ($ch=="f") $r[]= chr(0xc);
            if ($ch=="n") $r[]= chr(0xa);
            if ($ch=="r") $r[]= chr(0xd);
            if ($ch=="0") $r[]= chr(0);
            if ($ch=="t") $r[]= "\t";
            if ($ch=="v") $r[]= "\v";
            if ($ch=="\\") $r[]= "\\";
            if ($ch=="\'") $r[]= "\'";
            if ($ch=="?") $r[]= "?";
        }
        else
            $r[]= $ch;
    }
    return $r;
}
  

function is_cond($W)
{
    global $conds, $proc;
    debug("is_cond($W); ".count($conds)." $proc");
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
    global $commas;
    $commas= 0;
    $w= trim($w);
    $l= strlen($w);
    if ($l<2)
        return false;
    if ($w[$l-1] == ":")
    {
        while ($w[$l-1] == ":")
        {
            $commas++;
            $w= substr($w, 0, -1);
            $l= strlen($w);
        }
        return $w;
    }
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
    return false;
}

function is_u($W)
{
    if (empty($W))
        return false;
    if (preg_match('/^[+]/',$W) ||
        preg_match('/[+]$/',$W))
        return true;
    return false;
}

function is_p($W)
{
    if (empty($W))
        return false;
    if (preg_match('/^[+]/',$W) ||
        preg_match('/^[-]/',$W))
        return true;
    return false;
}


function new_symbol($name, $value, $type)
{
    global $fin, $lnr;
    return array(
        'type'  => $type,
        'name'  => $name,
        'value' => $value,
        'fin'   => $fin,
        'lnr'   => $lnr,
        'segid' => '',
        'owner' => '',
        'defined'=> true,
        'extern'=> false,
    );
}


function mk_symbol($name, $value, $type= "S")
{
    global $syms, $fin, $lnr, $segment;
    $skey= arri($segment,'id').$name;
    $s= arri($syms, /*$name*/$skey);
    if (is_array($s))
    {
        ddie("Redefinition of symbol $name", 9);
    }
    $sym= new_symbol($name, $value, $type);
    $sym['segid']= arri($segment, 'id');
    $sym['owner']= arri($segment, 'id');
    $syms[$skey]= $sym;
    debug("Symbol {$name} created at {$skey}");
    return $sym;
}


function symbol_to_table(&$sym, $skey)
{
    global $syms, $fin, $lnr;
    $s= arri($syms, $skey);
    if (is_array($s))
        ddie("Symbol {$sym['name']} already recorded");
    $syms[$skey]= $sym;    
}


function mk_symbol_exist($name, $type)
{
    global $syms;
    $s= arri($syms, $name);
    if ($s == '')
    {
        $s= new_symbol($name, 0, $type);
        symbol_to_table($s, $name);
        $syms[$name]['defined']= false;
    }
}


function set_symbol($name, $value, $segid= false)
{
    global $syms, $fin, $lnr, $segment;
    $skey= $name;
    $s= arri($syms, $skey);
    if (!is_array($s))
        ddie("Set value of unknown symbol {$name}");
    $s= &$syms[$skey];
    $s['value']= $value;
    $s['fin']= $fin;
    $s['lnr']= $lnr;
    if ($segid !== false)
    {
        debug("Set segid=$segid by set_symbol $name");
        $s['segid']= $segid;
    }
    $s['defined']= true;       
    debug("Set symbol[$skey]=".print_r($s,true));
}

function make_sym_global($w)
{
    global $syms, $segment, $lnr, $fin, $error;
    $sl= arri($syms, arri($segment,'id').$w);
    $sg= arri($syms, $w);
    if (!is_array($sl) && !is_array($sg))
        ddie("Symbol unknown to be exported ($w)");
    if (is_array($sg) && !is_array($sl))
    {
        debug("symbol $w is already exported");
        return; // alreay global
    }
    if (is_array($sg) && is_array($sl) && !$sg['extern'])
        ddie("Redefinition of global symbol ($w)");
    debug("Exporting symbol \"$w\"");
    $sl['segid']= false;
    unset($syms[arri($segment,'id').$w]);
    unset($syms[$w]);
    $syms[$w]= $sl;
    //debug("sl=".print_r($sl,true));
}


function find_local($name)
{
    global $syms;
    foreach ($syms as $s)
    {
        if (($s['name'] == $name) && ($s['segid'] != ''))
            return true;
    }
    return false;
}


function find_global($name)
{
    global $syms;
    $s= arri($syms, $name);
    if (($s != '') &&
        (($s['segid'] == '') || ($s['segid'] === false)))
        return true;
    return false;
}


function find_extern($name)
{
    global $syms;
    $s= arri($syms, $name);
    if (($s != '') &&
        ($s['extern'] == true))
        return true;
    return false;
}


function mk_mem($addr, $icode=0, $error= false)
{
    global $mem, $fin, $lnr, $segment;
    $m= arri($mem, $addr);
    if ($m !== '')
    {
        if ($mem[$addr]['icode']==0)
            $mem[$addr]['icode']= $icode;
        return;
    }
    $mem[$addr]= array();
    $m= &$mem[$addr];
    $m['error']= $error;
    $m['icode']= $icode;
    $m['fin']= $fin;
    $m['lnr']= $lnr;
    $m['address']= $addr;
    $m['cell_type']= "C";
    $m['reloc']= array();
    $m['labels']= array();
    $m['tags']= array();
    $m['segid']= arri($segment,'id');
    $m['src']= '';
    $m['immediate']= array();
    $m['skip']= 0;
    $m['params']= array();
}


/*
 * Phase 1, process asm input line
 ***************************************************************************
 */

function proc_asm_line($l)
{
    global $fin, $conds, $insts, $mem, $syms, $lnr, $addr;
    global $conds1, $conds2, $insts1, $insts2, $proc;
    global $segs, $segment, $commas;
    $org= $l;
    $icode= 0;
    $label= false;
    $cond= false;
    if (($w= strtok($l, " \t")) === false)
    {
        debug("proc_asm_line; no words found in line $lnr");
        return;
    }
    if (($w!==false) && ($w[0]==';'))
        return;
    $prew= "";
    $par_sep= " \t,[]():";
    $inst= false;
    $error= false;
    $ok= false;
    while ($w !== false)
    {
        $W= strtoupper($w);
        debug("proc_asm_line; w=$w");
        
        if (($n= is_label($w)) !== false)
        {
            $xaddr= sprintf("%x", $addr);
            debug("proc_asm_line; found label=$n at addr=$xaddr");
            mk_mem($addr);
            if ($commas > 1)
            {
                $label= mk_symbol($n, $addr, "L");
                $mem[$addr]['tags'][$n]= $n;
                make_sym_global($n);
            }
            else
            {
                if (find_extern($n))
                    ddie("Extern symbol $n reused localy");
                $label= mk_symbol($n, $addr, "L");
                $mem[$addr]['tags'][$n]= $n;
                debug("$n still be local");
            }
            $ok= true;
        }
        
        else if (($cond= is_cond($W)) !== false)
        {
            debug("proc_asm_line; COND= ".sprintf("%08x",$cond));
            $icode= $icode | $cond;
            debug("proc_asm_line; ICODE= ".sprintf("%08x",$icode));
        }
        
        else if (($W == ".PROC") || 
                 ($W == "PROC") ||
                 ($W == "CPU") ||
                 ($W == ".CPU"))
        {
            $w= strtok(" \t");
            if (($w!==false) && ($w[0]==';'))
                return;
            $W= strtoupper($w);
            $p1= strpos("P1", $W);
            $p2= strpos("P2", $W);
            if (($p1===false) && ($p2===false))
                ddie("Unknown processor type");
            if ($p1!==false)
            {
                $conds= $conds1;
                $insts= $insts1;
                $proc= "P1";
                debug("Use Processor p1516");
            }
            if ($p2!==false)
            {
                $conds= $conds2;
                $insts= $insts2;
                $proc= "P2";
                debug("Use Processor p2223");
            }
            $ok= true;
            return;
        }
      
        else if (($W == "==") || ($W == "=") ||
                 ($W == "EQU") || ($W == ".EQU"))
        {
            if ($prew == '')
                ddie("Label missing for assignment");
            $w= strtok(" \t");
            if (($w!==false) && ($w[0]==';'))
                return;
            $val= intval($w,0);
            debug("proc_asm_line; EQU W=$W w=$w val=$val");
            mk_symbol($prew, $val, (($W=="=")||($W=="=="))?"=":"S");
            if ($W=="==")
                make_sym_global($prew);
            else
                debug("$prew still be local (W=$W)");
            debug("proc_asm_line; SYMBOL $prew=$val");
            $ok= true;
            return;
        }

        else if (($W == ".GLOBAL") || ($W == ".EXPORT") ||
                 ($W == "GLOBAL") || ($W == "EXPORT"))
        {
            $w= strtok(" \t");
            if (($w!==false) && ($w[0]==';'))
                return;
            if ($w=='')
                ddie("Symbol missing to be exported ($w)");
            make_sym_global($w);
            return;
        }

        else if (($W == ".EXTERN") || ($W == "EXTERN"))
        {
            $w= strtok(" \t");
            if (($w!==false) && ($w[0]==';'))
                return;
            if ($w=='')
                ddie("Symbol missing to be exported ($w)");
            if (find_local($w))
                ddie("Local symbol $w can not be extern");
            debug("Make symbol $w exist...");
            $seg= $segment;
            $segment= false;
            mk_symbol_exist($w, "X");
            $syms[$w]['extern']= true;
            $segment= $seg;
            return;
        }
        
        else if (($W == "ORG") || ($W == ".ORG"))
        {
            $w= strtok(" \t");
            if (($w!==false) && ($w[0]==';'))
                return;
            $addr= intval($w,0);
            debug(sprintf("proc_asm_line; addr=%x",$addr));
            $ok= true;
            return;
        }
        
        else if (($W == "DS") || ($W == ".DS") ||
                 ($W == ".SPACE") || ($W == ".SKIP"))
        {
            $w= strtok(" \t,");
            if (($w!==false) && ($w[0]==';'))
                return;
            $x= 0 + intval($w,0);
            mk_mem($addr);
            $mem[$addr]['src']= $org;
            $mem[$addr]['skip']= $x;
            $addr+= $x;
            debug(sprintf("proc_asm_line; addr=%x",$addr));
            $ok= true;
            return;
        }
        
        else if (preg_match('/^D[BWD]$/', $W) ||
                 preg_match('/^\.D[BWD]$/', $W))
        {
            if ($w[0] == ".")
            {
                $w= substr($w, 1);
                $W= strtoupper($w);
            }
            $orgw= $w;
            $pl= preg_replace("/^.*[dD][bBwWdD][ \t]+/", "", $l);
            debug("Param part of line: '$pl'");
            if (!empty($pl) && ($pl[0]=="\""))
            {
                debug("Parsing string...");
                $a= my_parse_string($pl);
                foreach ($a as $i=>$ch)
                {
                    $params= array();
                    $params[]= $pv= ord($ch);
                    mk_mem($addr);
                    $mem[$addr]['src']= $orgw."\t$pv";
                    $mem[$addr]['inst']= $insts[$W];
                    $mem[$addr]['pattern']= "n_";
                    $mem[$addr]['params']= $params;
                    debug( sprintf("mem[%x] Added char DB $pv",$addr) );
                    $addr++;
                }
                $params= array();
                $params[]= 0;
                mk_mem($addr);
                $mem[$addr]['src']= $orgw;
                $mem[$addr]['inst']= $insts[$W];
                $mem[$addr]['pattern']= "n_";
                $mem[$addr]['params']= $params;
                debug( sprintf("mem[%x] Added string 0",$addr) );
                $addr++;
                return ;
            }
            $w= trim(strtok(" \t,"));
            if (($w!==false) && ($w[0]==';'))
                return;
            while (($w !== false) && ($w!=""))
            {
                debug("Process param of DB: \"$w\"");
                $params= array();
                $params[]= $w;
                mk_mem($addr);
                $mem[$addr]['src']= $orgw."\t".$w;
                $mem[$addr]['inst']= $insts[$W];
                $mem[$addr]['pattern']= "n_";
                $mem[$addr]['params']= $params;
                debug( sprintf("mem[%x] Added DB $w",$addr) );
                $addr++;
                $w= trim(strtok(" \t,"));
                if (($w!==false) && ($w!="") && ($w[0]==';'))
                    return;
            }
            return;
        }

        else if (($W == "SECTION") || ($W == ".SECTION") ||
                 startof($W, "SEG") || startof($W, ".SEG"))
        {
            $w= trim(strtok(" \t,"));
            if (($w === false) ||
                (($w!==false) && ($w!="") && ($w[0]==';') ||
                 ($w!==false) && ($w=="")
                )
            )
                ddie("Section name is missing");
            $pnr= 1;
            while (($w !== false) && ($w!=""))
            {
                $W= strtoupper($w);
                if ($pnr == 1)
                {
                    foreach ($segs as $i => $s)
                    {
                        if ($s['name']==$w)
                            ddie("Segment already exists ({$w}, defined at {$s['fin']}:{$s['lnr']})");
                    }
                    $segment= array(
                        "name"=>$w,
                        "id"=> "S".bin2hex(random_bytes(6)),
                        "start"=>$addr,
                        "noload"=>false,
                        "abs"=>false,
                        "fin"=>$fin,
                        "lnr"=>$lnr
                    );
                }
                else if ($W == "NOLOAD")
                {
                    $segment["noload"]= true;
                }
                else if ($W == "ABS")
                {
                    $segment["abs"]= true;
                }
                else
                    ddie("Unknown segment option ({$w})");
                $w= strtok(" \t,");
                if (($w!==false) && ($w!="") && ($w[0]==';'))
                    break;
                $pnr++;
            }
            $segs[$segment['id']]= $segment;
            debug("Segment started: {$segment['name']},{$segment['id']}");
            return;
        }

        else if (($W == "ENDS") || ($W == ".ENDS"))
      {
	    if ($segment!==false)
              debug("Finish segment: {$segment['name']},{$segment['id']}");
            $segment= false;
            return;
        }
        
        else if (($inst= is_inst($W)) !== false)
        {
            $icode= $icode | $inst['icode'];
            debug("proc_asm_line; INST= ".sprintf("%08x",$icode)." in segment ".print_r($segment,true));
            mk_mem($addr, $icode);
            $mem[$addr]['src']= $org;
            $mem[$addr]['inst']= $inst;
            $o= sprintf("%05x %08x (%s)", $addr, $icode, $mem[$addr]['segid']);
            debug($o);
            debug("");
            $ok= true;
            break;
        }
        
        $prew= $w;
        $w= strtok($par_sep);
        if (($w!==false) && ($w[0]==';'))
            return;
    }
    debug(sprintf("first word precessed, addr=%x",$addr));
    if (($prew != '') && ($ok === false))
        ddie("Unknown instruction ($w)");
    if ($inst === false)
    {
        debug("Instructionless line");
        return;
    }
    // continue with parameters
    debug("Continue with params");
    $prew= $w;
    $w= strtok($par_sep);
    $now= false;
    if (($w!==false) && ($w[0]==';'))
    {
        $w= false;
        $now= true;
    }
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
        if ($now)
            $w= false;
        else
            $w= strtok($par_sep);
        if (($w!==false) && ($w[0]==';'))
            break;
    }
    $pattern.= "_";
    debug("param pattern=$pattern");
    $mem[$addr]['pattern']= $pattern;
    $mem[$addr]['params']= $params;
    debug(sprintf("mem[%x] is ready", $addr));
    $addr++;
    debug(sprintf("new addr=%x", $addr));

    if (!$ok)
        ddie("Unrecognizable token $w");
    
}


/*
 * Phase 1, process p2h input line
 ***************************************************************************
 */

$last_code_at= false;

function last_ok($error)
{
    global $last_code_at, $fin, $lnr, $mem;
    $ok= true;
    $last= false;
    if ($last_code_at === false)
        $ok= false;
    else if (($last= arri($mem, $last_code_at)) == '')
        $ok= false;
    if (!$ok)
        ddie($error);
    return $last;
}

function proc_p2h_line($l)
{
    global $fin, $conds, $insts, $mem, $syms, $lnr, $addr, $last_code_at;
    global $conds1, $conds2, $insts1, $insts2, $proc;
    global $segs, $segment, $commas;
    $org= $l;
    $icode= 0;
    $label= false;
    $cond= false;
    if (($w1= strtok($l, " \t")) === false)
    {
        debug("proc_p2h_line; no words found in line $lnr");
        return;
    }
    if (($w1!==false) && ($w1[0]==';'))
        return;
    $w2= strtok(" \t");
    $W1= strtoupper($w1);
    $W2= strtoupper($w2);
    debug("proc_p2h_line; w1=$w1 w2=$w2 last_code_at=$last_code_at");
    
    if ($W1 == "//U")
    {
        // Processor type
        //U P1|P2
    }

    else if ($W1 == "//T")
    {
        // Segment definition
        //T idstring name noload=0|1 abs=0|1
        $name= strtok(" \t");
        $w= strtok(" \t");
        $noload= 0;
        $abs= 0;
        while ($w!='')
        {
            $s= explode("=", $w);
            if (count($s)==2)
            {
                if ($s[0]=="noload")
                    $noload= $s[1];
                if ($s[0]=="abs")
                    $abs= $s[1];
            }
            $w= strtok(" \t");
        }        
        $seg= array(
            "name"=>$name,
            "id"=>$w2,
            "start"=>$addr,
            "noload"=>$noload!=0,
            "abs"=>$abs!=0,
            "fin"=>$fin,
            "lnr"=>$lnr
        );
        if (($s= arri($segs, $w2))!='')
            ddie("Segment $name from $fin redefines {$s['id']}");
        $segs[$seg["id"]]= $seg;
        debug("Segment defined: {$seg['name']},{$seg['id']}");
    }

    else if (($W1 == "//L") || ($W1 == "//=") || ($W1 == "//S"))
    {
        // Symbol or label
        //L key name value owner segid
        $type= $W1[2];
        $key= $w2;
        $name= strtok(" \t");
        $value= strtok(" \t");
        $v= 0;
        $val= 0+intval($value, 16);
        $owner= strtok(" \t");
        $segid= strtok(" \t");
        if (($segid == "-") || ($segid == "_"))
            $segid= '';
        if (($owner == "-") || ($owner == "_"))
            $owner= '';
        if ($owner == "s")
            $owner= $segid;
        debug(sprintf("Def $type from p2h: key=$key name=$name value=$value val=$val segid=$segid"));
        if (($segid != '') && find_extern($name))
            ddie("Extern symbol $name redefined as local");
        $s= arri($syms, $key);
        if (!is_array($s))
        {
            mk_symbol($segid.$name, $val, $type);
            if ($type == "L")
                $syms[$key]['defined']= false;
        }
        else
        {
            if ($s['type']=="X")
                $syms[$key]['type']= $type;
            else
                ddie("Redefinition of $name", 1);
        }
        if ($segid != '')
        {
            debug("Converting label $name to local of $segid");
            $syms[$key]['segid']= $segid;
        }
        $syms[$key]['owner']= $owner;
        debug("Imported '$type':".print_r($syms[$key],true));
    }

    else if ($W1 == "//P")
    {
        // Begin/End of a code segment
        //P -
        //P id name
        $w3= strtok(" \t");
        if ($w2 == "-")
            $segment= false;
        else
        {
            $segment= arri($segs, $w2);
            if ($segment == '')
            {
                debug("SEGMENTS:".print_r($segs));
                ddie("No referred segment {$w3}/{$w2} found.");
            }
        }
    }

    else if ($W1 == "//G")
    {
        // Global label definition of prev code record
        //G name
        last_ok("//G record ({$w2}) without prev //C");
        debug("Symbol $w2 definition place in $fin in global area val=$last_code_at");
        set_symbol($w2, $last_code_at/*, arri($segment,'id')*/);
        $mem[$last_code_at]['tags'][$w2]= $w2;
    }

    else if ($W1 == "//N")
    {
        // Local label definition of prev code record
        //N name segmentid
        $last= last_ok("//N record ({$w2}) without prev //C");
        $w3= strtok(" \n");
        debug("Symbol $w2 definition place in $fin in seg $w3 val=$last_code_at");
        if (find_extern($w2))
            ddie("Extern symbol $w can not be local");
        set_symbol($w3.$w2, $last_code_at, $w3);
        $mem[$last_code_at]['tags'][$w2]= $w2;
    }

    else if ($W1 == "//R")
    {
        // Relocation info about prev code record
        //R hexaddress mode symbol value
        $a= 0 + intval($w2, 16);
        $mode= strtok(" \n");
        $sym= strtok(" \n");
        $v= 0 + intval(strtok(" \t"), 16);
        $r= array("used_parameter"=> $sym,
                  "mode"=> $mode,
                  "value"=> $v);
        $last= last_ok("//R record without prev //C");
        $mem[$last_code_at]['reloc'][]= $r;
    }

    else if ($W1 == "//I")
    {
        // Immediate info
        //I hexaddress mode hexvalue
        $mode= strtok(" \t");
        $v= 0 + intval(strtok(" \t"), 16);
        $last= last_ok("//I without perv //C");
        $mem[$last_code_at]['immediate']= array('mode'=>$mode,
                                                'value'=>$v);
    }

    else if ($W1 == "//+")
    {
        // Skip defined by .ds
        //+ hexvalue
        $v= 0 + intval($w2, 16);
        if ($v > 0)
        {
            $v--;
            if ($v > 0)
                $addr+= $v;
        }
    }
    
    else if ($W1 == "//H")
    {
        // Check sum record
        //H hexvalue
    }

    else if ($W2 == "//C")
    {
        // Code record
        // icode //C address source code
        // 02490000 //C 00016 shr	r4		; m>>= 1
        // 0      7 9 11
        //              13  17
        //                    19
        $w3= strtok(" \t");
        $v= intval($w1, 16);
        mk_mem($addr, $v);
        $mem[$addr]['src']= substr($org, 19);
        $last_code_at= $addr++;
        debug(sprintf("Last //C record at %08x\n", $last_code_at));
    }
             
    else if ($W1 == "//E")
    {
        // End of the file
    }

}


function is_const($p, &$value)
{
    if (preg_match("/^0[xX][0-9a-fA-F]+/",$p) ||
        preg_match("/^0[bB][01]+/",$p) ||
        is_numeric($p))
    {
        $value= intval($p, 0);
        return true;
    }
    if ($p[0] == "'")
    {
        $c= substr($p,1,1);
        $value= ord($c);
        return true;
    }
    return false;
}


function place_param(&$icode, $mode, $value)
{
    $pl= $mode;
    $pv= $value;
    if ($pl == "_")
    {
        // just skip
    }
    else if ($pl == "rd")
    {
        $pv&= 0xf;
        $pv<<= 20;
        $icode&= 0xff0fffff;
        $icode|= $pv;
    }
    else if ($pl == "rda")
    {
        $pv&= 0xf;
        $icode&= 0xff0fffff;
        $pv<<= 20;
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
    else if ($pl == "rb1")
    {
        $pv&= 0xf;
        $pv<<= 12;
        $icode&= 0xffff0fff;
        $icode|= $pv;
    }
    else if (($pl == "#8") || ($pl == "d8"))
    {
        $pv&= 0xff;
        $icode&= 0xffffff00;
        $icode|= $pv;
        if ($pl=="#8")
            debug( sprintf("//I #8 %08x", $pv) );
    }
    else if (($pl == "#16") || ($pl == "d16"))
    {
        $pv&= 0xffff;
        $icode&= 0xffff0000;
        $icode|= $pv;
        if ($pl=="#16")
            debug( sprintf("//I #16 %08x", $pv) );
    }
    else if ($pl == "#20")
    {
        $pv&= 0xfffff;
        $icode&= 0xfff00000;
        $icode|= $pv;
        debug( sprintf("//I #20 %08x", $pv) );
    }
    else if ($pl == "#24")
    {
        $pv&= 0xffffff;
        $icode&= 0xff000000;
        $icode|= $pv;
        debug( sprintf("//I #24 %08x", $pv) );
    }
    else if ($pl == "#27")
    {
        $pv&= 0x0effffff;
        $icode&= 0xf8000000;
        $icode|= $pv;
        debug( sprintf("//I #27 %08x", $pv) );
    }
    else if (($pl == "#32") || ($pl == "d32"))
    {
        $icode= $pv;
        if ($pl=="#32")
            debug( sprintf("//I #32 %08x", $pv) );
    }
    else if ($pl == "h16")
    {
        $porg= $pv;
        $pv>>= 16;
        $pv&= 0x0000ffff;
        $icode&= 0xffff0000;
        $icode|= $pv;
        debug( sprintf("//I h16 %08x", $porg) );
    }
}

// Read out symbol value from sym table
function param_value($p, $fin, $lnr)
{
    global $syms, $segs, $segment, $conly;
    if (empty($p))
        return 0;
    $v= 0;
    if (is_const($p, $v))
        return $v;
    $skey= arri($segment,'id').$p;
    $s= arri($syms, /*$p*/$skey);
    if (empty($s) || !is_array($s))
        $s= arri($syms, $p);
    if (!empty($s) && is_array($s))
    {
        if (!$conly)
        {
            if (!$s['defined'])
                ddie("Undefined symbol: {$p}", 1, $fin, $lnr);
        }
        else
        {
            if (!$s['defined'] && !$s['extern'])
                ddie("Undefined symbol {$p} is not extern", 1, $fin, $lnr);
        }
        return $s['value'];
    }
    ddie("Symbol not found: {$p} as {$skey}");
    return 0;
}


// Part of phase 2: inject symbol values into inst code
function proc_params(&$m)
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
    $icode= $m['icode'];
    $pattern= arri($m, 'pattern');
    $allowed_params= arri($m['inst']['params'],$pattern);
    $used_params= $m['params'];
    $c= $icode;
    if (count($allowed_params)==0)
        return $icode;
    $icode|= $allowed_params['icode'];
    debug( sprintf("Pattern fixed %08x -> icode= %08x",$c,$icode) );
    foreach ($used_params as $i => $up)
    {
        $pt= $pattern[$i];
        if ($pt=="_")
            break;
        $pl= $allowed_params['placements'][$i];
        $pv= param_value($up, $m['fin'], $m['lnr']);
        debug("Param placing: {$pt}: {$up}={$pv} as {$pl}");
        $c= $icode;
        place_param($icode, $pl, $pv);
        if (($pl=='#8') ||
            ($pl=='#16') ||
            ($pl=='#20') ||
            ($pl=='#24') ||
            ($pl=='#27') ||
            ($pl=='#32') ||
            ($pl=='d8') ||
            ($pl=='d16') ||
            ($pl=='d32') ||
            ($pl=='h16'))
        {
            $m['reloc'][]= array('used_parameter'=>$up,
                                 'mode'=>$pl,
                                 'value'=>$pv);
            $m['immediate']= array('mode'=>$pl,
                                   'value'=>$pv);
        }
        //debug( "Param placing, memory: ".print_r($m,true) );
        debug( sprintf("Param placed %08x -> icode= %08x",$c,$icode) );
    }
    return $icode;
}


function proc_relocs(&$m)
{
    /*
    [reloc] => Array
        (
            [0] => Array
                (
                    [used_parameter] => div_dok
                    [mode] => #16
                    [value] => 7
                )

        )
     */
    foreach ($m['reloc'] as $r)
    {
        $sym= $r['used_parameter'];
        $mode= $r['mode'];
        $v= param_value($sym, $m['fin'], $m['lnr']);
        place_param($m['icode'], $mode, $v);
        debug(sprintf("Addr=%x replace {$sym}=%x", $m['address'], $v));
    }
}


// PHASE 1
///////////////////////////////////////////////////////////////////////

// Load source files and do PHASE 1
foreach ($fina as $fin)
{
    $fext= pathinfo($fin, PATHINFO_EXTENSION);
    if ($fext=="s" || $fext=="asm")
    {
        // Assembly source
        debug("\n;; Phase 1 of file $fin [ASM]\n");
        $src= file_get_contents($fin);
        $lines= preg_split("/\r\n|\n|\r/", $src);
        $nuof_lines= count($lines);
        debug("$nuof_lines lines buffered");
        for ($li= 0; $li < $nuof_lines; $li++)
        {
            $lnr= $li+1;
            $l= trim($lines[$li]);
            //$l= preg_replace("/;.*$/", "", $l);
            debug("\n");
            debug("line[$lnr]: $l");
            proc_asm_line($l);
        }
    }
    else if (($fext=="p2h") || ($fext == "p2o"))
    {
        // Object file
        debug("\n;; Phase 1 of file $fin [P2H]\n");
        debug(sprintf("Start read of $fin at address %05x\n", $addr));
        $last_code_at= false;
        $src= file_get_contents($fin);
        $lines= preg_split("/\r\n|\n|\r/", $src);
        $nuof_lines= count($lines);
        debug("$nuof_lines lines buffered");
        $segment= false;
        for ($li= 0; $li < $nuof_lines; $li++)
        {
            $lnr= $li+1;
            $l= trim($lines[$li]);
            //$l= preg_replace("/;.*$/", "", $l);
            debug("\n");
            debug("line[$lnr]: $l");
            proc_p2h_line($l);
        }
    }
    else
    {
        echo "Unknown file type ($fin)";
        exit(10);
    }
}

debug("\n\n");

// PRE-PHASE 2
/////////////////////////////////////////////////////////////////////

// Mark all segments as unrefed, or refed if conly
foreach ($segs as $k => $s)
{
    $segs[$k]['refed']= $conly;
}

// Check all references and mark refed segments
if (!$conly)
{
    foreach ($mem as $m)
    {
        $segid= $m['segid'];
        if (arri($m, 'params')=='') continue;
        //debug("Check refs from MEM[{$m['address']}]=".print_r($m,true));
        $p= $m['params'];
        //debug("params=".print_r($p,true));
        foreach ($p as $name)
        {
            if ($name == '') continue;
            //debug("Checking=".print_r($name,true));
            $v= 0;
            if (is_const($name, $v)) continue;
            if (($s= arri($syms, $segid.$name)) == '') continue;
            if (($s['segid'] == '') &&
                ($s['owner'] != '') &&
                ($s['owner'] != $segid))
            {
                debug("Symbol '{$name}' of seg={$s['owner']} {$s['name']} ref by '{$segid}'");
                if (($seg= arri($segs, $s['owner'])) == '')
                    ddie("Referenced segment {$s['owner']} not found",
                         1, $m['fin'], $m['lnr']);
                $segs[$s['owner']]['refed']= true;
            }
        }
    }
}

$unrefed= false;
foreach ($segs as $se)
{
    //debug("SEG=".print_r($se,true));
    if (!$se['refed'])
    {
        debug("Unreferenced segment: {$se['id']} {$se['name']}");
        $unrefed= true;
    }
}

if ($unrefed && !$conly && !$keep)
{
}


// PAHSE 2
/////////////////////////////////////////////////////////////////////  
debug("PHASE 2\n");
debug("SYMBOL_TABLE:".print_r($syms,true));

// resolve symbols and inject values into inst codes
/////////////////////////////////////////////////////////////////////

foreach ($mem as $a => $m)
{
    //echo "a=$a, m=".print_r($m,true)."\n";
    if (!is_array($m))
        continue;
    $segment= arri($segs, $m['segid']);
    //debug( print_r($m,true) );
    $lnr= $m['lnr'];
    //debug(print_r($m,true));
    if (is_array(arri($m,"inst")) &&
        is_array(arri($m,"params")) &&
        !empty($m['pattern']))
    {
        debug( sprintf("mem[%x] is an instruction: %08x %s",$m['address'],$m['icode'],$m['src']) );
        $iseg= false;
        if (arri($m,'segid')!='')
        {
            $iseg= $segs[$m['segid']];
            //debug("Seg of {$m['segid']} is ".print_r($iseg,true));
        }
        debug( "Inst is in segment: {$m['segid']} = ".arri($iseg,'name') );
        //echo print_r($m,true);
        $pat= arri($m,"pattern");
        $ip= arri($m['inst']['params'],$pat);
        //debug("Looking $pat in array ".print_r($m['inst']['params'],true));
        //debug("ip=".print_r($ip,true));
        if (!is_array($ip))
        {
            $m['error']= "{$m['fin']}:{$m['lnr']}: Used pattern ($pat) does not match to any allowed";
            debug( "Error: ".$m['error'] );
            echo $m['error']."\n";
        }
        else
        {
            debug("Used pattern matches to an allowed one: $pat");
            $m['icode']= proc_params($m);
        }
    }
    else if (is_array(arri($m, 'reloc')))
    {
        proc_relocs($m);
    }
    debug( sprintf("Code of mem[%04x] is ready: %08x\n\n",$a,$m['icode']) );
    debug("MEM[$a]=".print_r($m,true));
    $mem[$a]= $m;
}
debug("; PHASE 2 done");


// PHASE 2
// Generate output file
$hex= '';
$o= "//U {$proc}";
$hex.= $o."\n";
debug($o);


// List segments
debug("; Segments");
$hex.= "\n";
$hex.= "//; SEGMENTS\n";
foreach ($segs as $skey => $seg)
{
    debug( $o= sprintf("//T %s %s noload=%d abs=%d", $seg['id'], $seg['name'], $seg['noload']?1:0, $seg['abs']?1:0) );
    devdeb("Segment: ".print_r($seg,true));
    $hex.= $o."\n";
}


// omit symbol table
debug("SYMBOLS");
//debug ("syms[0]= ${syms[0]}");
$hex.= "\n";
$hex.= "//; SYMBOLS\n";
if (!empty($syms))
{
    foreach ($syms as $k => $s)
    {
        //L key name value owner [segid]
        debug("OMITING SYMBOL=".print_r($s,true));
        $o= sprintf("//%s %s %s %08x ", $s['type'], $k, $s['name'], $s['value']);
        if ($s['owner'] == '')
            $o.= "-";
        else
        {
            if ($s['segid'] != '')
                $o.= "s";
            else
                $o.= $s['owner'];
        }
        if (($segid= arri($s, 'segid')) != '')
            $o.= " {$segid}";
        else
            $o.= " _";
        $hex.= $o."\n";
        debug($o);
        devdeb("s[{$k}]=".print_r($s,true)."\n");
        if ($s['type'] == 'L')
        {
            if (isset($mem[$s['value']]))
            {
                debug("Adding label {$s['name']} to mem[{$s['value']}]\n");
                $mem[$s['value']]['labels'][]= $s;
                debug("MEM[{$s['value']}]=".print_r($mem[$s['value']],true));
            }
            else
                debug(sprintf("Mem at %08x not found for symbol {$s['name']}",$s['value']));
        }
    }
}

debug("\n\n");

// PHASE 2
// omit code
$hex.= "\n";
$hex.= "//; CODE\n";
$p= -1;
$checksum= 0;
$prev_segment_id= '';
debug( $o= sprintf("//P -") );
$hex.= $o."\n";
foreach ($mem as $a => $m)
{
    if (!is_array($m))
        continue;
    $segment= arri($segs, $m['segid']);
    if ($segment == '')
    {
        if ($prev_segment_id!='')
        {
            debug( $o= sprintf("//P -") );
            $hex.= $o."\n";
            $prev_segment_id= '';
        }
    }
    else
    {
        if ($segment['id'] != $prev_segment_id)
        {
            debug( $o= sprintf("//P %s %s", $segment['id'], $segment['name']) );
            $hex.= $o."\n";
            $prev_segment_id= $segment['id'];
        }
    }
    $lnr= $m['lnr'];
    //echo print_r($m,true);
    if ($a != $p+1)
    {
        $p++;
        while ($p < $a)
        {
            //debug( $o= sprintf("%08x ;%05x", 0, $p) );
            //$hex.= $o."\n";
            $p++;
        }
    }
    $p= $a;
    $m['icode']&= (int)0xffffffff;
    if ($m['icode'] !== false)
    {
        /*if (isset($m['label']) && ($m['label']!==false))
          {
          debug ($o= sprintf("//; %s", $m['label']['name']) );
          $hex.= $o."\n";
          }*/
        debug( $o= sprintf("%08x //%s %05x %s", $m['icode'], $m['cell_type'], $a, $m['src']) );
        $hex.= $o."\n";
        if ($m['error'] != false)
        {
            $o= "; ERROR: ".$m['error'];
            debug($o);
            echo $m['error'];
            $hex.= $o."\n";
        }
        else if (($m['cell_type']=='C') ||
                 ($m['cell_type']=='I'))
        {
            $checksum+= $m['icode'];
            $checksum&= (int)0xffffffff;
            if ($m['skip'] != 0)
            {
                debug( $o= sprintf("//+ %08x", $m['skip']) );
                $hex.= $o."\n";
            }
            foreach ($m['reloc'] as $r)
            {
                $v= 0;
                if (is_const($r["used_parameter"], $v))
                    continue;
                debug( $o= sprintf("//R %05x %s %s %08x", $a,
                                   $r['mode'],
                                   $r['used_parameter'],
                                   $r['value']) );
                $hex.= $o."\n";
            }
            if (($out_type=="obj") && (count($m['immediate'])>0))
            {
                debug( $o= sprintf("//I %05x %s %08x", $a,
                                   $m['immediate']['mode'],
                                   $m['immediate']['value']) );
                $hex.= $o."\n";
            }
            foreach ($m['labels'] as $s)
            {
                //debug(print_r($s,true));
                if ($s['segid']!='')
                    debug( $o= sprintf("//N %s %s", $s['name'], $s['segid']) );
                else
                    debug( $o= sprintf("//G %s", $s['name']) );
                $hex.= $o."\n";
            }
        }   
    }
    else
        debug(";ph3; what?");
    devdeb("a=$a, m=".print_r($m,true)."\n");
}
debug( $o= sprintf("//H %08x", $checksum) );
$hex.= $o."\n";
debug( $o= "//E" );
$hex.= $o."\n";

// PHASE 2
// write all output to object file
$obj= fopen($obj_name, "w");
if ($obj === false)
{
    echo "Can not open $obj_name for write\n";
}
else
{
    fwrite($obj, $hex);
    fclose($obj);
}

?>
