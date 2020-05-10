@echo on

if "%CUDA_VERSION%" == "cpu" (
    set CUVER=cpu
) else (
    set CUVER=cu%CUDA_VERSION:.=%
)

pip install --pre torch torchvision -f https://download.pytorch.org/whl/nightly/%CUVER%/torch_nightly.html
if errorlevel 1 exit /b 1
