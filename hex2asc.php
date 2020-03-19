<?php
  error_reporting(E_ALL);
  ini_set("display_errors", "On");
  
  $aw= 12;
  
  if (isset($argv[0]))
  {
    $fin= '';
    for ($i= 1; $i<$argc; $i++)
    {
      if ($argv[$i] == "-m")
      {
	$i++;
	$aw= $argv[$i];
      }
      else
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
  $l= strtok($src, $lsep);
  $lnr= 0;
  $mem_szie= 1 << $aw;
  while ($l !== false)
  {
    //echo "$lnr procing line $l...\n";
    if (preg_match('/^[0-9afA-F]/', $l))
    {
      echo substr($l, 0, 7)."\n";
      $lnr++;
    }
    $l= strtok($lsep);
  }

  for ( ; $lnr < $mem_szie; $lnr++)
    echo "00000000\n";
?>
