@echo on

python -c "import torch"
if errorlevel 1 exit /b 1

REM python -c "from caffe2.python import core"
REM if errorlevel 1 exit /b 1

python -c "import torchvision"
if errorlevel 1 exit /b 1
