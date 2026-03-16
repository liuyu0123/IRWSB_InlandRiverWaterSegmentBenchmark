#!/bin/bash

declare -A submodules=(
    ["Model/UNet"]="https://github.com/liuyu0123/Pytorch-UNet.git -b feature/ly/develop"
    ["Model/SegNet"]="https://github.com/liuyu0123/SegNet_PyTorch.git -b feature/ly/water_segment"
    ["Model/PSPNet"]="https://github.com/liuyu0123/pspnet-pytorch.git -b feature/ly/water_segment"
    ["Model/DeepLabV3plus"]="https://github.com/liuyu0123/deeplabv3-plus-pytorch.git -b feature/ly/water_segment"
    ["Model/SegFormer"]="https://github.com/liuyu0123/segformer-pytorch.git -b feature/ly/water_segment"
    ["Model/SwinUperNet"]="https://github.com/liuyu0123/Swin-UperNet.git -b feature/ly/water_segment"
    ["Model/ENet"]="https://github.com/liuyu0123/PyTorch-ENet.git -b feature/ly/water_segment"
    ["Model/FastSCNN"]="https://github.com/liuyu0123/Fast-SCNN-pytorch.git -b develop"
    ["Model/BiSeNet"]="https://github.com/liuyu0123/BiSeNet-ooooverflow.git -b feature/ly/segment"
    ["Model/WaSR"]="https://github.com/liuyu0123/WaSR.git -b feature/ly/water_segment"
)

echo "🔧 批量添加子模块..."

for path in "${!submodules[@]}"; do
    url_branch="${submodules[$path]}"
    
    if [ ! -d "$path" ]; then
        echo "➕ 添加: $path"
        git submodule add $url_branch "$path"
    else
        echo "⏭️  跳过: $path (已存在)"
    fi
done

echo "📝 提交..."
git add .gitmodules
git commit -m "Initialize all submodules" 2>/dev/null || echo "无更改"

echo "✅ 完成！"
git submodule status