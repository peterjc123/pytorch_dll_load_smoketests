@echo on

conda install pytorch torchvision cpuonly -c pytorch
if errorlevel 1 exit /b 1

