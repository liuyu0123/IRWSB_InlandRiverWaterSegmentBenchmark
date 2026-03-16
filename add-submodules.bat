@echo off
chcp 65001 >nul
echo ==========================================
echo 🔧 批量添加子模块
echo ==========================================

REM 检查 git
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误: 当前目录不是 git 仓库
    exit /b 1
)

REM UNet
if not exist "Model\UNet" (
    echo ➕ 添加: Model/UNet
    git submodule add https://github.com/liuyu0123/Pytorch-UNet.git -b feature/ly/develop "Model/UNet"
) else (
    echo ⏭️  跳过: Model/UNet
)

REM SegNet
if not exist "Model\SegNet" (
    echo ➕ 添加: Model/SegNet
    git submodule add https://github.com/liuyu0123/SegNet_PyTorch.git -b feature/ly/water_segment "Model/SegNet"
) else (
    echo ⏭️  跳过: Model/SegNet
)

REM PSPNet
if not exist "Model\PSPNet" (
    echo ➕ 添加: Model/PSPNet
    git submodule add https://github.com/liuyu0123/pspnet-pytorch.git -b feature/ly/water_segment "Model/PSPNet"
) else (
    echo ⏭️  跳过: Model/PSPNet
)

REM DeepLabV3plus
if not exist "Model\DeepLabV3plus" (
    echo ➕ 添加: Model/DeepLabV3plus
    git submodule add https://github.com/liuyu0123/deeplabv3-plus-pytorch.git -b feature/ly/water_segment "Model/DeepLabV3plus"
) else (
    echo ⏭️  跳过: Model/DeepLabV3plus
)

REM SegFormer
if not exist "Model\SegFormer" (
    echo ➕ 添加: Model/SegFormer
    git submodule add https://github.com/liuyu0123/segformer-pytorch.git -b feature/ly/water_segment "Model/SegFormer"
) else (
    echo ⏭️  跳过: Model/SegFormer
)

REM SwinUperNet
if not exist "Model\SwinUperNet" (
    echo ➕ 添加: Model/SwinUperNet
    git submodule add https://github.com/liuyu0123/Swin-UperNet.git -b feature/ly/water_segment "Model/SwinUperNet"
) else (
    echo ⏭️  跳过: Model/SwinUperNet
)

REM ENet
if not exist "Model\ENet" (
    echo ➕ 添加: Model/ENet
    git submodule add https://github.com/liuyu0123/PyTorch-ENet.git -b feature/ly/water_segment "Model/ENet"
) else (
    echo ⏭️  跳过: Model/ENet
)

REM FastSCNN
if not exist "Model\FastSCNN" (
    echo ➕ 添加: Model/FastSCNN
    git submodule add https://github.com/liuyu0123/Fast-SCNN-pytorch.git -b develop "Model/FastSCNN"
) else (
    echo ⏭️  跳过: Model/FastSCNN
)

REM BiSeNet
if not exist "Model\BiSeNet" (
    echo ➕ 添加: Model/BiSeNet
    git submodule add https://github.com/liuyu0123/BiSeNet-ooooverflow.git -b feature/ly/segment "Model/BiSeNet"
) else (
    echo ⏭️  跳过: Model/BiSeNet
)

REM WaSR
if not exist "Model\WaSR" (
    echo ➕ 添加: Model/WaSR
    git submodule add https://github.com/liuyu0123/WaSR.git -b feature/ly/water_segment "Model/WaSR"
) else (
    echo ⏭️  跳过: Model/WaSR
)

echo.
echo 📝 提交...
git add .gitmodules
git commit -m "Initialize all submodules" 2>nul

echo.
echo ==========================================
echo ✅ 完成！
echo ==========================================
git submodule status

pause