@echo on

set PYTHON_INSTALLER_URL=
if "%PYTHON_VERSION%" == "3.8" set "PYTHON_INSTALLER_URL=https://s3.amazonaws.com/ossci-windows/python-3.8.2-amd64.msix"
if "%PYTHON_VERSION%" == "3.7" set "PYTHON_INSTALLER_URL=https://s3.amazonaws.com/ossci-windows/python-3.7.7-amd64.msix"
if "%PYTHON_INSTALLER_URL%" == "" (
    echo Python %PYTHON_VERSION% not supported yet
)

curl --retry 3 -kL "%PYTHON_INSTALLER_URL%" --output python-amd64.msix
if errorlevel 1 exit /b 1

powershell -Command Add-AppxPackage .\python-amd64.msix
if errorlevel 1 exit /b 1

set "PATH=%LOCALAPPDATA%\Microsoft\WindowsApps;%PATH%"
echo "List of python.exe in PATH"
where python.exe

echo "List of pip.exe in PATH"
where pip.exe
