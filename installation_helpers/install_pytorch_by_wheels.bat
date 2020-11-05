@echo on

if "%CUDA_VERSION%" == "cpu" (
    set CUVER=cpu
) else (
    set CUVER=cu%CUDA_VERSION:.=%
)

if "%USE_MODULE_PIP%" == "1" (
    set PIP_COMMAND=python -m pip
) else (
    set PIP_COMMAND=pip
)

%PIP_COMMAND% install --pre torch torchvision torchaudio torchtext -f https://download.pytorch.org/whl/%CUVER%/torch_stable.html
if errorlevel 1 exit /b 1
