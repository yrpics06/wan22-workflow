#!/bin/bash
set -e

echo "===== Starting ComfyUI for Wan 2.2 ====="

if [ ! -f /workspace/ComfyUI/models/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors ]; then
    echo "Models not found. Starting download..."
    /workspace/download_models.sh
else
    echo "Models already present."
fi

cd /workspace/ComfyUI
python main.py --listen 0.0.0.0 --port 8188 --preview-method auto