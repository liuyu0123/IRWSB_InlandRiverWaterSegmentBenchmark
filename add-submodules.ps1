# ============================================
# Batch Add Submodules - Fixed Version
# ============================================

$submodules = @{
    "Model/UNet" = @{ Url = "https://github.com/liuyu0123/Pytorch-UNet.git"; Branch = "feature/ly/develop" }
    "Model/SegNet" = @{ Url = "https://github.com/liuyu0123/SegNet_PyTorch.git"; Branch = "feature/ly/water_segment" }
    "Model/PSPNet" = @{ Url = "https://github.com/liuyu0123/pspnet-pytorch.git"; Branch = "feature/ly/water_segment" }
    "Model/DeepLabV3plus" = @{ Url = "https://github.com/liuyu0123/deeplabv3-plus-pytorch.git"; Branch = "feature/ly/water_segment" }
    "Model/SegFormer" = @{ Url = "https://github.com/liuyu0123/segformer-pytorch.git"; Branch = "feature/ly/water_segment" }
    "Model/SwinUperNet" = @{ Url = "https://github.com/liuyu0123/Swin-UperNet.git"; Branch = "feature/ly/water_segment" }
    "Model/ENet" = @{ Url = "https://github.com/liuyu0123/PyTorch-ENet.git"; Branch = "feature/ly/water_segment" }
    "Model/FastSCNN" = @{ Url = "https://github.com/liuyu0123/Fast-SCNN-pytorch.git"; Branch = "develop" }
    "Model/BiSeNet" = @{ Url = "https://github.com/liuyu0123/BiSeNet-ooooverflow.git"; Branch = "feature/ly/segment" }
    "Model/WaSR" = @{ Url = "https://github.com/liuyu0123/WaSR.git"; Branch = "feature/ly/water_segment" }
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Batch Add Submodules" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

if (-not (Test-Path ".git")) {
    Write-Host "Error: Not a git repository" -ForegroundColor Red
    exit 1
}

foreach ($path in $submodules.Keys) {
    $info = $submodules[$path]
    $url = $info.Url
    $branch = $info.Branch
    
    if (-not (Test-Path $path)) {
        Write-Host ""
        Write-Host "[ADD] $path" -ForegroundColor Green
        Write-Host "      URL: $url" -ForegroundColor Gray
        Write-Host "      Branch: $branch" -ForegroundColor Gray
        
        # 正确的参数顺序: git submodule add -b <branch> <url> <path>
        git submodule add -b $branch $url $path
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Success" -ForegroundColor Green
        } else {
            Write-Host "[FAIL] Failed" -ForegroundColor Red
        }
    } else {
        Write-Host ""
        Write-Host "[SKIP] $path (exists)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Committing..." -ForegroundColor Cyan

git add .gitmodules
git commit -m "Initialize all submodules" 2>$null

if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] Committed" -ForegroundColor Green
} else {
    Write-Host "[INFO] No changes to commit" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Done!" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

git submodule status