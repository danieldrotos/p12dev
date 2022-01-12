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
    $f1= strtok($l, "// ");
    if ($f1 == ";")
      $f1= strtok(" ");
    if ($in)
    {
      if ($f1 == "CODE")
	exit(0);
      //echo "IN\n";
      $f2= strtok("//; ");
      $f3= strtok("//; ");
      //echo " fields= f1=$f1 f2=$f2 f3=$f3\n";
      $a= hexdec($f1);
      $s= $f2;
      echo 'F:G$'.$s.'$0$0(),C,0,0,0,0,0'."\n";
      echo 'L:G$'.$s.'$0$0:';
      printf("%x", $a);
      echo "\n";
    }
    else
      //echo "OUT\n";
      {
	if ($f1 == "SYMBOLS")
	  $in= true;
	if ($f1 == "CODE")
	{
	  $in= false;
	  exit(0);
	}
	//echo " $in\n";
      }
    $lnr++;
  }
?>
