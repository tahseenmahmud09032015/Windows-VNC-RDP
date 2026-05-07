@echo off
title Windows Server 2025 RDP/VNC Fast Setup
echo Enabling RDP...
powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"

echo Installing TightVNC via Chocolatey...
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
choco install tightvnc -y

echo Setting up Ngrok Tunnel...
powershell -Command "Invoke-WebRequest https://bin.equinox.io/c/b34236aksed/ngrok-v3-stable-windows-amd64.zip -OutFile ngrok.zip"
powershell -Command "Expand-Archive ngrok.zip -Force"

echo Setup Complete. 
echo To start RDP tunnel, run: .\ngrok\ngrok.exe tcp 3389
pause
