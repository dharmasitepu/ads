# aug/17/2021 00:16:10 by RouterOS 6.44.5
# software id = 0ST2-0PVY
#
# model = RB941-2nD
# serial number = A1C30BBA2DCD
/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n frequency=2427 mode=ap-bridge \
    ssid=server
/interface wireless security-profiles
set [ find default=yes ] authentication-types=\
    wpa-psk,wpa2-psk,wpa-eap,wpa2-eap group-ciphers=tkip,aes-ccm mode=\
    dynamic-keys supplicant-identity=MikroTik unicast-ciphers=tkip,aes-ccm \
    wpa-pre-shared-key=@mikhmon007 wpa2-pre-shared-key=@mikhmon007
/ip pool
add name=dhcp_pool0 ranges=192.168.88.2-192.168.88.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=bridge1 lease-time=1h name=\
    dhcp1
/ip hotspot user profile
add address-pool=dhcp_pool0 advertise=yes advertise-interval=0s \
    advertise-timeout=never advertise-url=https://dharmasitepu.github.io/ \
    mac-cookie-timeout=12h name=Vocheran on-login=":put (\",rem,2000,3 Jam,200\
    0,,Disable,\"); {:local date [ /system clock get date ];:local year [ :pic\
    k \$date 7 11 ];:local month [ :pick \$date 0 3 ];:local comment [ /ip hot\
    spot user get [/ip hotspot user find where name=\"\$user\"] comment]; :loc\
    al ucode [:pic \$comment 0 2]; :if (\$ucode = \"vc\" or \$ucode = \"up\" o\
    r \$comment = \"\") do={ /sys sch add name=\"\$user\" disable=no start-dat\
    e=\$date interval=\"3 Jam\"; :delay 2s; :local exp [ /sys sch get [ /sys s\
    ch find where name=\"\$user\" ] next-run]; :local getxp [len \$exp]; :if (\
    \$getxp = 15) do={ :local d [:pic \$exp 0 6]; :local t [:pic \$exp 7 16]; \
    :local s (\"/\"); :local exp (\"\$d\$s\$year \$t\"); /ip hotspot user set \
    comment=\$exp [find where name=\"\$user\"];}; :if (\$getxp = 8) do={ /ip h\
    otspot user set comment=\"\$date \$exp\" [find where name=\"\$user\"];}; :\
    if (\$getxp > 15) do={ /ip hotspot user set comment=\$exp [find where name\
    =\"\$user\"];}; /sys sch remove [find where name=\"\$user\"]}}" \
    parent-queue=none transparent-proxy=yes
add add-mac-cookie=no address-pool=dhcp_pool0 advertise=yes \
    advertise-interval=0s advertise-timeout=never advertise-url=\
    https://dharmasitepu.github.io/ keepalive-timeout=3m !mac-cookie-timeout \
    name=TRIAL session-timeout=3m status-autorefresh=3m transparent-proxy=yes
/ip hotspot profile
add dns-name=tina.com hotspot-address=192.168.88.1 login-by=\
    mac,http-chap,https,http-pap,trial mac-auth-mode=\
    mac-as-username-and-password name=hsprof1 trial-uptime-limit=3m \
    trial-uptime-reset=3m trial-user-profile=TRIAL
/ip hotspot
add address-pool=dhcp_pool0 disabled=no interface=bridge1 name=hotspot1 \
    profile=hsprof1
/interface bridge port
add bridge=bridge1 interface=ether2
add bridge=bridge1 interface=ether3
add bridge=bridge1 interface=ether4
/ip address
add address=192.168.88.1/24 interface=bridge1 network=192.168.88.0
/ip cloud
set ddns-enabled=yes
/ip dhcp-client
add dhcp-options=hostname,clientid disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.88.0/24 gateway=192.168.88.1
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=192.168.88.0/24
/ip hotspot user
add comment="===AGUNG===" disabled=yes mac-address=00:0A:F5:2F:BA:B4 name=\
    agung@tina.com password=G2h2@hYpO@
add comment="===ANGGI===" mac-address=E4:46:DA:EA:BC:6F name=anggi@tina.com \
    password=u8i@&pOsK5
add comment="===PUTRI===" name=putri@tina.com password=Hy8@@pUS4j
add comment="===MAMAK===" mac-address=1C:77:F6:57:07:25 name=mamak@tina.com \
    password=J@4YtP%zLs
add comment="===BAPAK===" mac-address=18:D7:17:70:F1:01 name=bapak@tina.com \
    password=Ug8Tgs%@9P
add comment="===KOMPUTER===" mac-address=50:3E:AA:34:C4:C4 name=\
    komputer@tina.com password=Ed#2@fHr9H
add comment="===LAPTOP===" mac-address=F0:03:8C:9D:A5:C7 name=laptop@tina.com \
    password=uYb%@gTdhJ
add comment="===SERVER===" mac-address=00:27:15:61:09:AD name=\
    server@mikhmon.007 password=mikhmon-server-007
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=wi8be password=\
    72355 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=g67zn password=\
    82472 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=y7ny7 password=\
    55898 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=j7zz9 password=\
    89583 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=3tahb password=\
    65568 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=nby2h password=\
    42889 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=kp4ds password=\
    98882 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=cyz5z password=\
    26743 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=wjues password=\
    82572 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=2r44b password=\
    57284 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=reg6p password=\
    49438 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=bak9b password=\
    56667 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=cm2tt password=\
    84739 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=grz6y password=\
    55678 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=guz3m password=\
    47752 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=kwd7j password=\
    59485 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=5s9gr password=\
    43343 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=bdha3 password=\
    87469 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=x4r3s password=\
    54587 profile=Vocheran server=hotspot1
add comment=up-496-09.04.20-Toko_Tina limit-uptime=3h name=ngb3z password=\
    93987 profile=Vocheran server=hotspot1
/ip service
set www-ssl disabled=no
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=TINA_HOTSPOT
/system logging
add action=disk prefix=-> topics=hotspot,info,debug
/system ntp client
set enabled=yes primary-ntp=162.159.200.123 secondary-ntp=202.162.32.12
/system scheduler
add comment="Monitor Profile Vocheran" interval=2m43s name=Vocheran on-event="\
    :local dateint do={:local montharray ( \"jan\",\"feb\",\"mar\",\"apr\",\"m\
    ay\",\"jun\",\"jul\",\"aug\",\"sep\",\"oct\",\"nov\",\"dec\" );:local days\
    \_[ :pick \$d 4 6 ];:local month [ :pick \$d 0 3 ];:local year [ :pick \$d\
    \_7 11 ];:local monthint ([ :find \$montharray \$month]);:local month (\$m\
    onthint + 1);:if ( [len \$month] = 1) do={:local zero (\"0\");:return [:to\
    num (\"\$year\$zero\$month\$days\")];} else={:return [:tonum (\"\$year\$mo\
    nth\$days\")];}}; :local timeint do={ :local hours [ :pick \$t 0 2 ]; :loc\
    al minutes [ :pick \$t 3 5 ]; :return (\$hours * 60 + \$minutes) ; }; :loc\
    al date [ /system clock get date ]; :local time [ /system clock get time ]\
    ; :local today [\$dateint d=\$date] ; :local curtime [\$timeint t=\$time] \
    ; :foreach i in [ /ip hotspot user find where profile=\"Vocheran\" ] do={ \
    :local comment [ /ip hotspot user get \$i comment]; :local name [ /ip hots\
    pot user get \$i name]; :local gettime [:pic \$comment 12 20]; :if ([:pic \
    \$comment 3] = \"/\" and [:pic \$comment 6] = \"/\") do={:local expd [\$da\
    teint d=\$comment] ; :local expt [\$timeint t=\$gettime] ; :if ((\$expd < \
    \$today and \$expt < \$curtime) or (\$expd < \$today and \$expt > \$curtim\
    e) or (\$expd = \$today and \$expt < \$curtime)) do={ [ /ip hotspot user r\
    emove \$i ]; [ /ip hotspot active remove [find where user=\$name] ];}}}" \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=sep/04/2020 start-time=03:12:29
