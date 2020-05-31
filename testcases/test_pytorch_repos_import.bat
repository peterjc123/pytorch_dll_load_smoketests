@echo on

python -c "import torch"
if errorlevel 1 exit /b 1

python -c "import torchvision"
if errorlevel 1 exit /b 1

python -c "import torchaudio"
if errorlevel 1 exit /b 1

python -c "import torchtext"
if errorlevel 1 exit /b 1
