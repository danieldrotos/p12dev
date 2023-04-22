timeout /t 2
rem telnet localhost 5555

start "term" "%ProgramFiles(x86)%\teraterm\ttermpro.exe" /T=1 "telnet://localhost:5555/"
