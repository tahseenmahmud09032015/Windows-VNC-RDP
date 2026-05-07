@echo off
set /p TAILSCALE_KEY="Enter your Tailscale Auth Key: "

echo Enabling RDP...
powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"

echo Installing Tailscale...
powershell -Command "Invoke-WebRequest -Uri 'https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe' -OutFile 'tailscale-setup.exe'"
start /wait tailscale-setup.exe /quiet

echo Authenticating with Tailscale...
"C:\Program Files\Tailscale\tailscale.exe" up --authkey=%TAILSCALE_KEY%

echo Success! Use your Tailscale Dashboard to find the IP and connect via RDP.
pause
