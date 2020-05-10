@echo on

if not exist polluted_dlls.7z (
    curl --retry 3 -kL "https://www.dropbox.com/s/c68hj6ad2rmugzf/polluted_dlls.7z?dl=1" --output polluted_dlls.7z
    if errorlevel 1 exit /b 1
)

for /f "usebackq tokens=*" %%i in (`python.exe -c "import sys; print(sys.prefix)"`) do (
    set "PYTHON_ROOT=%%i"
)

mkdir backup_libs
xcopy /y /q "%PYTHON_ROOT%\Lib\site-packages\torch\lib\*.*" backup_libs\*.*

7z x -aoa polluted_dlls.7z -o"%PYTHON_ROOT%\Lib\site-packages\torch\lib"
if errorlevel 1 exit /b 1

call test_pytorch_repos_import.bat || ver > NUL

rmdir /S /Q "%PYTHON_ROOT%\Lib\site-packages\torch\lib"
if errorlevel 1 exit /b 1

mkdir "%PYTHON_ROOT%\Lib\site-packages\torch\lib"
if errorlevel 1 exit /b 1

xcopy /y /q backup_libs\*.* "%PYTHON_ROOT%\Lib\site-packages\torch\lib\*.*"
if errorlevel 1 exit /b 1
