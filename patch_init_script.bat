@echo on

where python.exe
if errorlevel 1 exit /b 1

for /f "usebackq tokens=*" %%i in (`python.exe -c "import sys; print(sys.prefix)"`) do (
    set "PYTHON_ROOT=%%i"
)

:python_found

curl --retry 3 -kL "https://raw.githubusercontent.com/peterjc123/pytorch/windows_dll_fix/torch/__init__.py" --output "%PYTHON_ROOT%\Lib\site-packages\torch\__init__.py"
if errorlevel 1 exit /b 1
