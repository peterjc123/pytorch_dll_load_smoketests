@echo on

call installation_helpers\install_conda.bat
if errorlevel 1 exit /b 1

call installation_helpers\install_pytorch_by_wheels.bat
if errorlevel 1 exit /b 1

cd testcases

call test_pytorch_repos_import.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import_with_polluted_path.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import_with_polluted_systemroot.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import_with_moved_dependencies.bat
if errorlevel 1 exit /b 1

call test_pytorch_repos_import_with_polluted_no_hang.bat
if errorlevel 1 exit /b 1
