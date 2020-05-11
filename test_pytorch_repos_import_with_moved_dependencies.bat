@echo on

where python.exe
if errorlevel 1 exit /b 1

for /f "usebackq tokens=*" %%i in (`python.exe -c "import os, importlib; import importlib.util; print(os.path.dirname(importlib.util.find_spec('torch').origin))"`) do (
    set "PYTORCH_ROOT=%%i"
)

mkdir deps
move /Y %PYTORCH_ROOT%\lib\cudnn*.dll deps\
if errorlevel 1 exit /b 1

@setlocal
set "PATH=%CD%\deps;%PATH%"

call test_pytorch_repos_import.bat
if errorlevel 1 exit /b 1

@endlocal

move /Y deps\* %PYTORCH_ROOT%\lib\
if errorlevel 1 exit /b 1

rmdir /S /Q deps
if errorlevel 1 exit /b 1
