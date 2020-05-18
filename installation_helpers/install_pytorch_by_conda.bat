@echo on

if "%CUDA_VERSION%" == "cpu" (
    set CONDA_FEATURE_TRACKING=cpuonly
) else (
    set CONDA_FEATURE_TRACKING=cudatoolkit=%CUDA_VERSION%
)

conda install -y %CONDA_FEATURE_TRACKING% pytorch torchvision torchaudio -c pytorch-nightly
if errorlevel 1 exit /b 1

