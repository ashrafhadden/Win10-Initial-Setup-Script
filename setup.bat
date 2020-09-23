:: Auto-Login
echo setup.bat BEGIN
set /p setupbatvar1="Enter password "
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /t REG_SZ /d domainname /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d Administrator /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %setupbatvar1% /f
:: Disable Hiberation & delete hiberfil.sys (saves approx. 1-5gb)
powercfg.exe /hibernate off
:: Choco
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
:: Apps
choco install signal
choco install discord
choco install caprine
choco install hyper
choco install google-chrome
echo Wait until Chrome is installed...
pause
:: Games
start chrome https://www.fosshub.com/WinDirStat.html?dwl=windirstat1_1_2_setup.exe
start chrome https://signup.na.leagueoflegends.com/en/signup/redownload
start chrome https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.na.exe
start chrome https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe
start chrome https://www.battle.net/download/getInstallerForGame?os=win&locale=enUS&version=LIVE&gameProgram=BATTLENET_APP
echo setup.bat END
