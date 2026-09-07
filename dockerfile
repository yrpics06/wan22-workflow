FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# System packages
RUN apt-get update && apt-get install -y \
    git wget curl ffmpeg libgl1 libglib2.0-0 \
    python3.11 python3.11-venv python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Python setup
RUN ln -sf /usr/bin/python3.11 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

WORKDIR /workspace

# Clone ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

WORKDIR /workspace/ComfyUI

# Install Python packages
RUN pip install --upgrade pip && \
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124 && \
    pip install -r requirements.txt && \
    pip install huggingface_hub[cli] hf_transfer

# Custom nodes (Wan ke liye zaroori)
RUN cd custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    git clone https://github.com/ltdrdata/ComfyUI-Manager && \
    pip install -r ComfyUI-WanVideoWrapper/requirements.txt || true

# Model folders
RUN mkdir -p models/diffusion_models models/loras models/vae models/text_encoders models/clip

# Copy scripts
COPY download_models.sh /workspace/download_models.sh
COPY start.sh /workspace/start.sh
RUN chmod +x /workspace/download_models.sh /workspace/start.sh
RUN sed -i 's/\r$//' /workspace/download_models.sh /workspace/start.sh
RUN bash /workspace/download_models.sh

EXPOSE 8188

CMD ["python", "main.py", "--listen", "0.0.0.0", "--port", "8188", "--preview-method", "auto"]
