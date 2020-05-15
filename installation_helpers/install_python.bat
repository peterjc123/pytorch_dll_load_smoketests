@echo on

set PYTHON_INSTALLER_URL=
if "%PYTHON_VERSION%" == "3.8" set "PYTHON_INSTALLER_URL=https://www.python.org/ftp/python/3.8.2/python-3.8.2-amd64.exe"
if "%PYTHON_VERSION%" == "3.7" set "PYTHON_INSTALLER_URL=https://www.python.org/ftp/python/3.7.7/python-3.7.7-amd64.exe"
if "%PYTHON_VERSION%" == "3.6" set "PYTHON_INSTALLER_URL=https://www.python.org/ftp/python/3.6.8/python-3.6.8-amd64.exe"
if "%PYTHON_INSTALLER_URL%" == "" (
    echo Python %PYTHON_VERSION% not supported yet
)

curl --retry 3 -kL "%PYTHON_INSTALLER_URL%" --output python-amd64.exe
if errorlevel 1 exit /b 1

start /wait "" python-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 TargetDir=%CD%\Python%PYTHON_VERSION%
if errorlevel 1 exit /b 1

set "PATH=%CD%\Python%PYTHON_VERSION%\Scripts;%CD%\Python%PYTHON_VERSION%;%PATH%"
echo "List of python.exe in PATH"
where python.exe

echo "List of pip.exe in PATH"
where pip.exe
