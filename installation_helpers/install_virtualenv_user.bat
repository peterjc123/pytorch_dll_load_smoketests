@echo on

python -m venv "%TEMP%\myenv"
if errorlevel 1 exit /b 1

call "%TEMP%\myenv\Scripts\activate"
if errorlevel 1 exit /b 1
