This project has a lot of prerequisites, but it's something I wish I'd found when trying to create this task myself.


The task is simple, generate a Let's Encrypt certificate and get it used on the SonicWall and then make sure to refresh it as needed.


Some of the hard parts are done for us, but using some sticks and glue we can cobble together a few different applications to make this happen.


1. SSH.exe from OpenSSH 8.1.0.1 (https://github.com/PowerShell/Win32-OpenSSH)
2. expect-v0.6.2-amd64.zip (https://github.com/hymkor/expect/releases)
3. CertifyTheWeb 5.6.8.0 (https://github.com/webprofusion/certify)
4. FileZilla FTP Server 1.4 


My folder layout was to place the ps1, lua and batch scripts in one folder and the cert folder is a subfolder of that.
Setup the FileZilla server to host the cert folder as the home path.


Place ssh.exe in the main path. Place expect in the main path or the one specified in the script.


The way it works, you setup CTW to renew the cert, it then runs a powershell script that runs a scheduled task. The scheduled task runs the batch that copies the latest cert and runs the lua commands that instruct and upload the cert to the Sonicwall via SSH.


This could use some cleaning up, I've annoymized the scripts, there is a lot you'll have to adjust to work in your environment but I've tackled a large part of the complex parts for you at least.

