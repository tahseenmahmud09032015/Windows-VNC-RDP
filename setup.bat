@echo off
title Windows Server 2025 RDP + Tailscale Setup
echo ---------------------------------------------------
echo Installing Tailscale and Enabling RDP...
echo ---------------------------------------------------

:: Enable RDP
powershell -Command "Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0"
powershell -Command "Enable-NetFirewallRule -DisplayGroup 'Remote Desktop'"

:: Download and Install Tailscale
echo Downloading Tailscale...
powershell -Command "Invoke-WebRequest -Uri 'https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe' -OutFile 'tailscale-setup.exe'"
echo Installing Tailscale (this may take a minute)...
start /wait tailscale-setup.exe /quiet

:: Start Tailscale
echo ---------------------------------------------------
echo Tailscale is installed. 
echo Please log in to your Tailscale account in the browser window that opens.
echo ---------------------------------------------------
"C:\Program Files\Tailscale\tailscale.exe" up

pause
