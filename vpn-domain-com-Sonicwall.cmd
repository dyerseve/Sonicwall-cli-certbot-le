for /f "delims=" %%i in ('dir /b /a-d /od "C:\ProgramData\certify\assets\vpn.domain.com\*.pfx"') do set "LatestModifiedFile=%%~i"
copy /y C:\ProgramData\certify\assets\vpn.domain.com\%LatestModifiedFile% C:\scripts\le-sonicwall\cert\le-cert.pfx
c:\programs\expect\expect.exe c:\scripts\le-sonicwall\ssh.lua

