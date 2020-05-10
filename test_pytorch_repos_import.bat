@echo on

python -c "import torch"
if errorlevel 1 exit /b 1

python -c "from caffe2.python import core"
if errorlevel 1 exit /b 1

python -c "import torchvision"
if errorlevel 1 exit /b 1
