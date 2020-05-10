@echo on

if not exist polluted_dlls.7z (
    curl --retry 3 "https://www.dropbox.com/s/c68hj6ad2rmugzf/polluted_dlls.7z?dl=1" --output polluted_dlls.7z
    if errorlevel 1 exit /b 1
)

7z x -aoa polluted_dlls.7z -o"C:\Windows\System32"
if errorlevel 1 exit /b 1

call test_pytorch_repos_import.bat
if errorlevel 1 exit /b 1

del C:\Windows\System32\libiomp5md.dll
if errorlevel 1 exit /b 1
