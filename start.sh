#!/bin/bash
set -e

echo "===== Checking models ====="

if [ ! -f /workspace/ComfyUI/models/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors ]; then
    echo "Downloading models at high speed..."
    /workspace/download_models.sh
else
    echo "Models ready!"
fi

cd /workspace/ComfyUI
python main.py --listen 0.0.0.0 --port 8188 --preview-method auto
