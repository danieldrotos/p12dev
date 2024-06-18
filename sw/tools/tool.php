#!/usr/bin/php
<?php

  function isWindows()
  {
    return defined('PHP_WINDOWS_VERSION_BUILD');
  }

  function get_home()
  {
    if (false !== ($home = getenv('HOME')))
    {
      return $home;
    }
    if (/*isWindows() &&*/ false !== ($home = getenv('USERPROFILE')))
    {
      return $home;
    }
    if (function_exists('posix_getuid') && function_exists('posix_getpwuid')) {
      $info = posix_getpwuid(posix_getuid());
      return $info['dir'];
    }
    return "";
  }


function sys_inc()
  {
    $i= 0;
    $d= "./";
    while ($i<6)
    {
      if (file_exists($d.".version"))
      {
        return $d."/sw/lib";
        break;
      }
      $d= "../".$d;
      $i++;
    }
    $d= get_home();
    if (file_exists($d."/p12tool") && file_exists($d."/p12tool/include"))
      return $d."/p12tool/include";
    return "";
  }


  if (isset($argv[0]))
  {
    for ($i=1; $i<$argc; $i++)
    {
      if ($argv[$i] == "-h")
      {
	echo get_home()."\n";
      }
      else if ($argv[$i] == "-si")
      {
	echo sys_inc()."\n";
      }
    }
  }
  
?>
