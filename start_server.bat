@echo off
title SmartAI Commercial Gateway Launcher
echo ===================================================
echo       Starting SmartAI Server + Live Tunnels
echo ===================================================
echo.
echo 1. Starting FastAPI Server (main.py)...
start "SmartAI Server (Port 8000)" cmd /k "cd /d "%~dp0" && python main.py"

timeout /t 3 /nobreak >nul

echo 2. Starting Cloudflare Fresh Tunnel (No warning screen, phone + PC ready)...
start "Cloudflare Tunnel (Direct Link)" cmd /k "cd /d "%~dp0" && cloudflared.exe tunnel --url http://127.0.0.1:8000"

timeout /t 2 /nobreak >nul

echo 3. Starting ngrok Tunnel...
start "ngrok Tunnel" cmd /k "C:\Users\HP\Downloads\ngrok-v3-stable-windows-amd64\ngrok.exe http 8000 --url=https://nacho-crock-umbrella.ngrok-free.dev"

echo.
echo ===================================================
echo  Done! Services are now running.
echo ===================================================
pause
