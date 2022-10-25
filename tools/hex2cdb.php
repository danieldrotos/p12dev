<?php
  error_reporting(E_ALL);
  ini_set("display_errors", "On");
  
  if (isset($argv[0]))
  {
    $fin= '';
    for ($i= 1; $i<$argc; $i++)
    {
      $fin= $argv[$i];
    }
  }
  if ($fin=='')
  {
    echo "hex file missing\n";
    exit(1);
  }
  //echo "reading $fin...\n";
  $src= file_get_contents($fin);

  $lsep= "\n\r";
  $la= array();
  $l= strtok($src, $lsep);
  while ($l != false)
  {
    $la[]= $l;
    $l= strtok($lsep);
  }
  $lnr= 0;
  $in= false;
  foreach ($la as $l)
  {
    //echo "$lnr procing line $l...\n";
    $f1= strtok($l, " \t");
    $f2= strtok(" \t");
    if ($f2 == "CODE")
      exit(0);
    if ($f2 == "SYMBOLS")
    {
      $in= true;
      continue;
    }
    if ($in)
    {
      //echo "IN\n";
      $f3= strtok(" \t");
      //echo " fields= f1=$f1 f2=$f2 f3=$f3\n";
      $type= substr($f1, 2);
      //echo " type=$type\n";
      if ($type == ";") continue;
      if ($type == "=") continue;
      $a= hexdec($f2);
      $s= $f3;
      echo 'F:G$'.$s.'$0$0(),C,0,0,0,0,0'."\n";
      echo 'L:G$'.$s.'$0$0:';
      printf("%x", $a);
      echo "\n";
    }
    $lnr++;
  }
?>
