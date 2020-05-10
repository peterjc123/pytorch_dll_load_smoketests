@echo on

call install_conda.bat
if errorlevel 1 exit /b 1

call install_pytorch_by_conda.bat
if errorlevel 1 exit /b 1

call patch_init_script.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import_with_polluted_path.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import_with_polluted_systemroot.bat
if errorlevel 1 exit /b 1
