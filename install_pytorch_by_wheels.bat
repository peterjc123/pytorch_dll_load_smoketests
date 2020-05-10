@echo on

pip install torch torchvision -f https://download.pytorch.org/whl/cpu/torch_stable.html
if errorlevel 1 exit /b 1

