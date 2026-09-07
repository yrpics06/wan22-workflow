#!/bin/bash

cd /workspace/ComfyUI
mkdir -p models/diffusion_models models/loras models/vae models/text_encoders

echo "===== Downloading base models ====="

# High Noise Model
if [ ! -f models/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors ]; then
  echo "Downloading High Noise model..."
  wget --user-agent="Mozilla/5.0" -c -O models/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors \
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"
fi

# Low Noise Model
if [ ! -f models/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors ]; then
  echo "Downloading Low Noise model..."
  wget --user-agent="Mozilla/5.0" -c -O models/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors \
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"
fi

# VAE
if [ ! -f models/vae/wan_2.1_vae.safetensors ]; then
  echo "Downloading VAE..."
  wget --user-agent="Mozilla/5.0" -c -O models/vae/wan_2.1_vae.safetensors \
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors"
fi

# CLIP
if [ ! -f models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors ]; then
  echo "Downloading CLIP..."
  wget --user-agent="Mozilla/5.0" -c -O models/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors \
    "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors"
fi

# 4steps LoRAs
if [ ! -f models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors ]; then
  echo "Downloading 4steps High LoRA..."
  wget --user-agent="Mozilla/5.0" -c -O models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"
fi

if [ ! -f models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors ]; then
  echo "Downloading 4steps Low LoRA..."
  wget --user-agent="Mozilla/5.0" -c -O models/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors \
    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Lightx2v/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"
fi

echo "===== Downloading custom LoRAs ====="

# 1. Grinding Cowgirl
if [ ! -f models/loras/WAN-2.2-I2V-Grinding-Cowgirl-HIGH-v1.safetensors ]; then
  echo "Downloading Grinding Cowgirl LoRA..."
  wget --user-agent="Mozilla/5.0" -c -O models/loras/WAN-2.2-I2V-Grinding-Cowgirl-HIGH-v1.safetensors \
    "https://civitai.red/api/download/models/2613687?fileId=2501075"
fi

# 2. Fullnelson
if [ ! -f models/loras/wan22-fullnelson-i2v-108epoc-high-k3nk.safetensors ]; then
  echo "Downloading Fullnelson LoRA..."
  wget --user-agent="Mozilla/5.0" -c -O models/loras/wan22-fullnelson-i2v-108epoc-high-k3nk.safetensors \
    "https://civitai.red/api/download/models/2169837?fileId=2063792"
fi

# 3. Pussyjob
if [ ! -f models/loras/pussyjob_v1.0_wan2.1_14b.safetensors ]; then
  echo "Downloading Pussyjob LoRA..."
  wget --user-agent="Mozilla/5.0" -c -O models/loras/pussyjob_v1.0_wan2.1_14b.safetensors \
    "https://civitai.red/api/download/models/2332735?fileId=2222747"
fi

echo "===== All downloads completed ====="
ls -lh models/loras/