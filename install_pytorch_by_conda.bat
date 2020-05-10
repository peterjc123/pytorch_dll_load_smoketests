@echo on

conda install -y pytorch torchvision cpuonly -c pytorch-nightly
if errorlevel 1 exit /b 1

