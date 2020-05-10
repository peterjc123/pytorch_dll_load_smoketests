@echo on

pip install --pre torch torchvision -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html
if errorlevel 1 exit /b 1

