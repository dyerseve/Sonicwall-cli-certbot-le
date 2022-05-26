echo(false)
if spawn([[C:\scripts\le-sonicwall\ssh.exe]],"-tt", "admin@192.168.1.1") then
    -- fingerprint prompt, just accept it
    prompt=expect("Are you sure you want to continue connecting (yes/no/[fingerprint])?", "admin@192.168.1.1's password:")
    if(prompt==0) then
        sendln("yes")
        expect("admin@192.168.1.1's password:")
        sendln("itsasecret")
    else
        sendln("itsasecret")
    end
    expect("admin@18B169AF5555>")
    sendln("conf")
    --Catch prompt to override local admin
    prompt2=expect("[no]:", "config(18B169AF5555)#")
    if(prompt2==0) then
        sendln("yes")
        expect("config(18B169AF5555)#")
        sendln("ssl-vpn server")
    else
        sendln("ssl-vpn server")
    end
    --remove current cert from SSL-VPN
    expect("(config-sslvpn-server)#")
    sendln("certificate use-self-signed")
    expect("(config-sslvpn-server)#")
    sendln("commit")
    expect("% Changes made.")
    sendln("exit")
    --remove current cert from WEB MGMT
    expect("config(18B169AF5555)#")
    sendln("administration")
    expect("(config-administration)#")
    sendln("web-management certificate use-self-signed")
    expect("(config-administration)#")
    sendln("commit")
    expect("% Changes made.")
    sendln("exit")
    expect("config(18B169AF5555)#")
    sendln("certificates")
    expect("(config-certificates)#")
    sendln("no certificate 'le-sonicwall'")
    expect("% Changes made.")
    sendln("exit")
    expect("config(18B169AF5555)#")
    sendln("certificates")
    expect("(config-certificates)#")
    sendln("import cert-key-pair 'le-sonicwall' password 'aaaaaa' ftp ftp://sonicwall:sonicwall@192.168.1.5/cert/le-cert.pfx")
    expect("% Import succeed.")
    sendln("exit")
     --add new cert to SSL-VPN
    expect("config(18B169AF5555)#")
    sendln("ssl-vpn server")
    expect("(config-sslvpn-server)#")
    sendln("certificate name 'le-sonicwall'")
    expect("(config-sslvpn-server)#")
    sendln("commit")
    expect("% Changes made.")
    sendln("exit")
    --add new cert to WEB MGMT
    expect("config(18B169AF5555)#")
    sendln("administration")
    expect("(config-administration)#")
    sendln("web-management certificate  name 'le-sonicwall'")
    expect("(config-administration)#")
    sendln("commit")
    expect("% Changes made.")
    sendln("exit")
    expect("config(18B169AF5555)#")
    sendln("exit")
    expect("admin@18B169AF5555>")
    sendln("exit")
    send("\r")
end