@echo on

curl -k https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe -o miniconda.exe
if errorlevel 1 exit /b 1

start /wait "" miniconda.exe /S /InstallationType=JustMe /RegisterPython=0 /AddToPath=0 /D=%CD%\conda
if errorlevel 1 exit /b 1

call %CD%\conda\condabin\activate.bat base
if errorlevel 1 exit /b 1

conda create -n test python=%PYTHON_VERSION% -y
if errorlevel 1 exit /b 1

conda activate test
if errorlevel 1 exit /b 1
