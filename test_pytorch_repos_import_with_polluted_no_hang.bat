@echo on

if not exist polluted_dlls.7z (
    curl --retry 3 -kL "https://www.dropbox.com/s/c68hj6ad2rmugzf/polluted_dlls.7z?dl=1" --output polluted_dlls.7z
    if errorlevel 1 exit /b 1
)

for /f "usebackq tokens=*" %%i in (`python.exe -c "import os, importlib; import importlib.util; print(os.path.dirname(importlib.util.find_spec('torch').origin))"`) do (
    set "PYTORCH_ROOT=%%i"
)

mkdir backup_libs
xcopy /y /q "%PYTORCH_ROOT%\lib\*.*" backup_libs\*.*

7z x -aoa polluted_dlls.7z -o"%PYTORCH_ROOT%\lib"
if errorlevel 1 exit /b 1

call test_pytorch_repos_import.bat || ver > NUL

rmdir /S /Q "%PYTORCH_ROOT%\lib"
if errorlevel 1 exit /b 1

mkdir "%PYTORCH_ROOT%\lib"
if errorlevel 1 exit /b 1

xcopy /y /q backup_libs\*.* "%PYTORCH_ROOT%\lib\*.*"
if errorlevel 1 exit /b 1

rmdir /S /Q backup_libs
if errorlevel 1 exit /b 1
