echo(false)
if spawn([[C:\scripts\le-sonicwall\ssh.exe]],"-tt", "admin@192.168.1.1") then
    prompt=expect("Are you sure you want to continue connecting (yes/no/[fingerprint])?", "admin@192.168.1.1's password:")
    if(prompt==0) then
        send("yes\r")
        expect("admin@192.168.1.1's password:")
        send("itsasecret\r")
    else
        send("itsasecret\r")
    end
    expect("admin@18B169AF5555>")
    send("restart time 5\r")
    expect("Are you sure you wish to restart SonicOS? (yes/cancel)")
    sendln("yes")
    expect("admin@18B169AF5555>")
    send("exit\r")
    send("\r")
end