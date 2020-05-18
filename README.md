# pytorch_dll_load_smoketests
DLL load smoketests for PyTorch on Windows

## Background
There're so many DLL import failures about PyTorch on Windows. As a release build, we should make our best efforts to avoid them. So this repo is created to ensure those problems don't occur anymore in our products.

## Tested Python Distribution
1. Python from Anaconda / Miniconda
2. Python from Official site
3. Python from Microsoft Store

## Tested install toolkit
1. Pip (for all distributions)
2. Conda (for conda only)

## Tested repos
1. pytorch/pytorch
2. pytorch/vision
3. pytorch/audio

## Test cases
1. Normal import
2. Import with polluted PATH
3. Import with polluted SystemRoot
4. Import doesn't hang on DLL load failures
5. Import with deps in PATH

## How to contribute or report issues?
We welcome various kinds of PRs, including adding tested repos, distributions or test cases. 
If you happen to get one dll load failure and you don't know the reason, then please feel free to report to us by opening a new issue. The general process to report a DLL load failure is listed below.
1. Install Debugging Tools on Windows https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/#install-debugging-tools-for-windows
2. Open a Powershell / CMD with admin rights and type in the following commands
    ```powershell
    gflags /i python.exe +sls
    cdb -o -c "~*g; q" python.exe -c "import torch"
    gflags /i python.exe -sls
    ```
