@echo on

where python.exe
if errorlevel 1 exit /b 1

for /f "usebackq tokens=*" %%i in (`python.exe -c "import sys; print(sys.prefix)"`) do (
    set "PYTHON_ROOT=%%i"
)

mkdir deps
move /Y %PYTHON_ROOT%\Lib\site-packages\torch\lib\cudnn*.dll deps\
if errorlevel 1 exit /b 1

@setlocal
set "PATH=%CD%\deps;%PATH%"

call test_pytorch_repos_import.bat
if errorlevel 1 exit /b 1

@endlocal

move /Y deps\* %PYTHON_ROOT%\Lib\site-packages\torch\lib\
if errorlevel 1 exit /b 1

rmdir /S /Q deps
if errorlevel 1 exit /b 1
