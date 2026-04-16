@echo off
title HTML Prompt Tools — Local Server
echo.
echo  ========================================
echo   HTML Prompt Tools - Local Server v1.0
echo  ========================================
echo.
echo  Server berjalan di: http://localhost:3000
echo  Tekan Ctrl+C untuk stop server.
echo.
echo  Link cepat:
echo  - design_model_v4.html     http://localhost:3000/design_model_v4.html
echo  - vector-prompt-studio-v6  http://localhost:3000/vector-prompt-studio-v6.html
echo  - veo-prompt-generator     http://localhost:3000/veo-prompt-generator.html
echo.
start "" "http://localhost:3000/design_model_v4.html"
python -m http.server 3000 --directory "%~dp0"
pause
