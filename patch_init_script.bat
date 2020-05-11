@echo on

where python.exe
if errorlevel 1 exit /b 1

for /f "usebackq tokens=*" %%i in (`python.exe -c "import os, importlib; print(os.path.dirname(importlib.util.find_spec('torch').origin))"`) do (
    set "PYTORCH_ROOT=%%i"
)

curl --retry 3 -kL "https://raw.githubusercontent.com/peterjc123/pytorch/windows_dll_fix/torch/__init__.py" --output "%PYTORCH_ROOT%\__init__.py"
if errorlevel 1 exit /b 1
