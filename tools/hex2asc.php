#!/usr/bin/php
<?php
  error_reporting(E_ALL);
  ini_set("display_errors", "On");
  
  $aw= 12;
  
  if (isset($argv[0]))
  {
    $fin= array();
    for ($i= 1; $i<$argc; $i++)
    {
      if ($argv[$i] == "-m")
      {
	$i++;
	$aw= $argv[$i];
      }
      else
	$fin[]= $argv[$i];
    }
  }

  $mem_size= 1 << $aw;
  $mem= array();
  for ($i= 0; $i<$mem_size; $i++)
    $mem[$i]= 0;

  if (count($fin)==0)
  {
    echo "hex,h2p file missing\n";
    exit(1);
  }
  //echo "reading $fin...\n";
  $src= '';
  foreach ($fin as $f)
  {
    $src= file_get_contents($f);
    $lines= preg_split("/\r\n|\n|\r/", $src);

    foreach ($lines as $l)
    {
      //echo "procing line $l... of $f\n";
      $w1= strtok($l, " ");
      $w2= strtok(" ");
      $w3= strtok(" ");
      //echo " w1=$w1 w2=$w2 w3=$w3\n";
      $p1= preg_match('/^[0-9a-fA-F]+$/', $w1);
      $p2= ($w2=='//C');
      $p3= preg_match('/^[0-9a-fA-F]+$/', $w3);
      //echo " p1=$p1 p2=$p2 p3=$p3\n";
      if ($p1 && $p2 && $p3)
      {
	$a= 0 + intval($w3, 16);
	$v= 0 + intval($w1, 16);
	$mem[$a]= $v;
	//echo "\n CC w1=$w1 w3=$w3 a=$a v=$v m={$mem[$a]}\n\n";
	//printf(" MM %08x %05x\n", $mem[$a], $a);
      }
    }
  }
  
  for ($a= 0; $a < $mem_size; $a++)
  {
    printf("%08x", $mem[$a]);
    //printf(" %05x", $a);
    //echo " {$mem[$a]}";
    echo "\n";
  }
?>
