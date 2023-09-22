#!/usr/bin/php
<?php

$debugging= true;
$debugging= false;
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
$insts= array();
$conds= array();
$first_fin= '';
$src= '';
$fina= array();

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
        else
        {
            $_REQUEST['submit']= "";
            $fin= $argv[$i];
            if ($first_fin == '')
                $first_fin= $fin;
            if (!file_exists($fin))
            {
                echo "Asm file does not exists\n";
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
        echo "Asm file missing\n";
        exit(1);
    }
    if ($obj_name == '')
    {
        $p= strrpos($first_fin, ".");
        if ($p === false)
        {
            echo "Can not convert asm filename to obj filename\n";
            exit(2);
        }
        $obj_name= substr($first_fin, 0, $p).".p2h";
    }
    if ($debugging)
    {
        $p= strrpos($first_fin, ".");
        if ($p === false)
        {
            echo "Can not convert asm filename to list filename\n";
            exit(5);
        }
        $lst_name= substr($first_fin, 0, $p).".lst";
        $lst= fopen($lst_name, "w");
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
	"n_"  =>array("icode"=>0x00000000,"placements"=>array("rd","#27"))
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
    global $debugging, $lst;
    
    if ($debugging === true)
    {
      if ($lst !== false)
      {
	fwrite($lst, ";; $x\n");
      }
    }
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
  
  function mk_symbol($name, $value, $type= "S")
  {
    global $syms, $fin, $lnr;
    $s= arri($syms, $name);
    if (is_array($s))
    {
      $error= "{$fin}:{$lnr}: Redefinition of symbol $name";
      debug("Error: ".$error);
      echo $error."\n";
      exit(9);
    }
    $sym= array(
        'name' => $name,
        'value'=> $value,
        'fin'  => $fin,
        'lnr'  => $lnr,
        'type' => $type
    );
    $syms[$name]= $sym;
    return $sym;
  }

  function proc_line($l)
  {
    global $fin, $conds, $insts, $mem, $syms, $lnr, $addr;
    global $conds1, $conds2, $insts1, $insts2, $proc;
    $org= $l;
    $icode= 0;
    $label= false;
    $cond= false;
    if (($w= strtok($l, " \t")) === false)
    {
      debug("proc_line; no words found in line $lnr");
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
      debug("proc_line; w=$w");
      
      if (($n= is_label($w)) !== false)
      {
	$xaddr= sprintf("%x", $addr);
	debug("proc_line; found label=$n at addr=$xaddr");
        $label= mk_symbol($n, $addr, "L");
        $ok= true;
      }
      
      else if (($cond= is_cond($W)) !== false)
      {
        debug("proc_line; COND= ".sprintf("%08x",$cond));
        $icode= $icode | $cond;
        debug("proc_line; ICODE= ".sprintf("%08x",$icode));
      }

      else if (($W == ".PROC") || 
	($W == "PROC") ||
	($W == "CPU"))
      {
	$w= strtok(" \t");
	if (($w!==false) && ($w[0]==';'))
	  return;
	$W= strtoupper($w);
	$p1= strpos("P1", $W);
	$p2= strpos("P2", $W);
	if (($p1===false) && ($p2===false))
	{
	  $error= "{$fin}:{$lnr}: Unknown processor type";
	  debug("Error: ".$error);
	  echo $error."\n";
	  exit(10);
	}
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
	//debug("Size of insts= ".count($insts));
	//debug("Size of conds= ".count($conds));
	return;
      }
      
      else if (($W == "=") || ($W == "EQU"))
      {
	if ($prew == '')
	{
	  $error= "{$fin}:{$lnr}: Label missing for assignment";
	  debug("Error: ".$error);
	  echo $error."\n";
	  exit(7);
	}
	$w= strtok(" \t");
	if (($w!==false) && ($w[0]==';'))
	  return;
	$val= intval($w,0);
	debug("proc_line; EQU w=$w val=$val");
	mk_symbol($prew, $val, ($W=="=")?"=":"S");
	debug("proc_line; SYMBOL $prew=$val");
	$ok= true;
	return;
      }

      else if ($W == "ORG")
      {
        $w= strtok(" \t");
	if (($w!==false) && ($w[0]==';'))
	  return;
        $addr= intval($w,0);
        debug(sprintf("proc_line; addr=%x",$addr));
        $ok= true;
	return;
      }

      else if ($W == "DS")
      {
	$w= strtok(" \t,");
	if (($w!==false) && ($w[0]==';'))
	  return;
	$x= 0 + intval($w,0);
	$addr+= $x;
	debug(sprintf("proc_line; addr=%x",$addr));
	$ok= true;
	return;
      }
      
      else if (preg_match('/^D[BWD]$/', $W))
      {
	$orgw= $w;
	$pl= preg_replace("/^.*[dD][bBwWdD][ \t]+/", "", $l);
	debug("Param part of line: '$pl'");
	if (!empty($pl) && ($pl[0]=="\""))
	{
	  debug("Parsing string...");
	  $a= my_parse_string($pl);
	  //$s= $a[0];
	  //debug("Parsed string: \"{$s}\"");
	  //for ($i= 0; $i<strlen($s); $i++)
	  foreach ($a as $i=>$ch)
	  {
	    $params= array();
	    $params[]= $pv= ord(/*$s[$i]*/$ch);
	    $mem[$addr]= array(
            'icode'=>0,
            'src'=>$orgw."\t$pv",
            'fin'=>$fin,
            'lnr'=>$lnr,
            'error'=>$error,
            'inst'=>$insts[$W],
            'pattern'=>"n_",
            'address'=>$addr,
            'params'=>$params,
            'cell_type'=>"C"
	    );
	    debug( sprintf("mem[%x] Added char DB $pv",$addr) );
	    $addr++;
	  }
	  $params= array();
	  $params[]= 0;
	  $mem[$addr]= array(
          'icode'=>0,
	      'src'=>$orgw,
          'fin'=>$fin,
	      'lnr'=>$lnr,
	      'error'=>$error,
	      'inst'=>$insts[$W],
	      'pattern'=>"n_",
	      'address'=>$addr,
	      'params'=>$params,
	      'cell_type'=>"C"
	  );
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
	  $mem[$addr]= array(
          'icode'=>0,
	      'src'=>$orgw."\t".$w,
          'fin'=>$fin,
	      'lnr'=>$lnr,
	      'error'=>$error,
	      'inst'=>$insts[$W],
	      'pattern'=>"n_",
	      'address'=>$addr,
	      'params'=>$params,
	      'cell_type'=>"C"
	  );
	  debug( sprintf("mem[%x] Added DB $w",$addr) );
	  $addr++;
	  $w= trim(strtok(" \t,"));
	  if (($w!==false) && ($w!='') && ($w[0]==';'))
	    return;
	}
	return;
      }
      
      else if (($inst= is_inst($W)) !== false)
      {
	$icode= $icode | $inst['icode'];
	debug("proc_line; INST= ".sprintf("%08x",$icode));
	$mem[$addr]= array(
        'icode'=>$icode,
        'src'=>$org,
        'fin'=>$fin,
	    'lnr'=>$lnr,
        'error'=>$error,
	    'inst'=>$inst,
        'cell_type'=> "C" //"I"
        );
        $o= sprintf("%05x %08x", $addr, $icode);
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
    {
      $error= "{$fin}:{$lnr}: Unknown instruction";
      debug("Error: ".$error);
      echo $error."\n";
      exit(8);
      return;
    }
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
      //debug("Is return ok here?");
      //return;
      // emulate no params
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
    $mem[$addr]['address']= $addr;
    debug(sprintf("mem[%x] is ready", $addr));
    $addr++;
    debug(sprintf("new addr=%x", $addr));

    if (!$ok)
    {
      $error= "{$fin}:{$lnr}: Unrecognizable token $w";
      debug("Error: ".$error);
      echo $error."\n";
      exit(6);
    }
    
  }


// Read out symbol value from sym table
function param_value($p, $fin, $lnr)
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
        return $s['value'];
    $error= "{$fin}:{$lnr}: Symbol not found: {$p}";
    debug("Error: ".$error);
    echo $error."\n";
    return 0;
}


// Part of phase 2: inject symbol values into inst code
function proc_params($icode, $pattern, $allowed_params, $used_params, $fin, $lnr)
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
    $icode|= $allowed_params['icode'];
    debug( sprintf("Pattern fixed %08x -> icode= %08x",$c,$icode) );
    foreach ($used_params as $i => $up)
    {
        $pt= $pattern[$i];
        if ($pt=="_")
            break;
        $pl= $allowed_params['placements'][$i];
        $pv= param_value($up, $fin, $lnr);
        debug("Param placing: {$pt}: {$up}={$pv} as {$pl}");
        $c= $icode;
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
                debug( sprintf("//"."I"."  #8 %08x", $pv) );
        }
        else if (($pl == "#16") || ($pl == "d16"))
        {
            $pv&= 0xffff;
            $icode&= 0xffff0000;
            $icode|= $pv;
            if ($pl=="#16")
                debug( sprintf("//"."I"." #16 %08x", $pv) );
        }
        else if ($pl == "#20")
        {
            $pv&= 0xfffff;
            $icode&= 0xfff00000;
            $icode|= $pv;
            debug( sprintf("//"."I"." #20 %08x", $pv) );
        }
        else if ($pl == "#24")
        {
            $pv&= 0xffffff;
            $icode&= 0xff000000;
            $icode|= $pv;
            debug( sprintf("//"."I"." #24 %08x", $pv) );
        }
        else if ($pl == "#27")
        {
            $pv&= 0x0effffff;
            $icode&= 0xf8000000;
            $icode|= $pv;
            debug( sprintf("//"."I"." #27 %08x", $pv) );
        }
        else if (($pl == "#32") || ($pl == "d32"))
        {
            $icode= $pv;
            if ($pl=="#32")
                debug( sprintf("//"."I"." #32 %08x", $pv) );
        }
        else if ($pl == "h16")
        {
            $porg= $pv;
            $pv>>= 16;
            $pv&= 0x0000ffff;
            $icode&= 0xffff0000;
            $icode|= $pv;
            debug( sprintf("//"."I"." h16 %08x", $porg) );
        }
        
        debug( sprintf("Param placed %08x -> icode= %08x",$c,$icode) );
    }
    return $icode;
  }


// PHASE 1
///////////////////////////////////////////////////////////////////////

// Load source files and do PHASE 1
foreach ($fina as $fin)
{
    debug("\n;; Phase 1 of file $fin\n");
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
        proc_line($l);
    }
}

debug("\n\n");


// PAHSE 2
/////////////////////////////////////////////////////////////////////  
debug("PHASE 2\n");

// resolve symbols and inject values into inst codes
foreach ($mem as $a => $m)
{
    //echo "a=$a, m=".print_r($m,true)."\n";
    if (!is_array($m))
        continue;
    //debug( print_r($m,true) );
    $lnr= $m['lnr'];
    //debug(print_r($m,true));
    if (is_array(arri($m,"inst")) &&
        is_array(arri($m,"params")) &&
        !empty($m['pattern']))
    {
        debug( sprintf("mem[%x] is an instruction: %08x %s",$m['address'],$m['icode'],$m['src']) );
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
            $m['icode']= proc_params($m['icode'], $pat, $ip, $m['params'], $m['fin'], $m['lnr']);
        }
    }
    debug( sprintf("Code of mem[%04x] is ready: %08x\n\n",$a,$m['icode']) );
    $mem[$a]= $m;
}
debug("; PHASE 2 done");


// PHASE 2
// omit symbol table
$hex= '';
debug("SYMBOLS");
//debug ("syms[0]= ${syms[0]}");
$o= "//; PROC {$proc}";
$hex.= $o."\n";
debug($o);
$hex.= "//; SYMBOLS\n";
if (!empty($syms))
{
    foreach ($syms as $k => $s)
    {
        $o= sprintf("//%s %08x", $s['type'], $s['value'])." $k";
        $hex.= $o."\n";
        debug($o);
        echo "s[{$k}]=".print_r($s,true)."\n";
    }
}

debug("\n\n");

// PHASE 2
// omit code
$hex.= "//; CODE\n";
$p= -1;
foreach ($mem as $a => $m)
{
    if (!is_array($m))
        continue;
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
    $m['icode']&= 0xffffffff;
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
    }
    /*else if ($m['error'] !== false)
      {
      $o= sprintf("; ERROR: %s in \"%s\"", $m['error'], $m['src']);
      debug($o);
      echo $m['error'];
      $hex.= "; ".$o."\n";
    }*/
    else
        debug(";ph3; what?");
    echo "a=$a, m=".print_r($m,true)."\n";
}
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
