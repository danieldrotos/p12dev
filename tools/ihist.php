<?php

  $cnt[0]= 0;
  $cnt[1]= 0;
  $cnt[2]= 0;
  $cnt[3]= 0;
  while (($l= fgets(STDIN)) !== false)
  {
    $l= trim($l);
    if ($l == '')
      continue;
    $lorg= $l;
    $w= strtok($l, " \t");
    while ($w != '')
    {
      if ($w == '//I')
      {
	$ts= strtok(" \t");
	$vs= strtok(" \t");
	$v= hexdec($vs);
	if (($v & 0xffffff80) == 0)
	  $cat= 0;
	else if (($v & 0xffffff00) == 0)
	$cat = 1;
	else if (($v & 0xffff0000) == 0)
	$cat = 2;
	else if (($v & 0xffff0000) != 0)
	$cat = 3;
	echo "$v $cat  ;$lorg\n";
	$cnt[$cat]++;
	$nr++;
      }
      $w= strtok(" \t");
    }
  }
  echo "$nr {$cnt[0]} {$cnt[1]} {$cnt[2]} {$cnt[3]}\n";
?>
