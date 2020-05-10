@echo on

conda install -y pytorch torchvision cpuonly -c pytorch
if errorlevel 1 exit /b 1

