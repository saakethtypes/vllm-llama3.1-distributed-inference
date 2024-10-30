# Use NVIDIA PyTorch image with CUDA support
FROM nvcr.io/nvidia/pytorch:23.03-py3

# Install vLLM, Ray, and dependencies
RUN pip install vllm ray

# Set environment variables
ENV NCCL_SOCKET_IFNAME=eth0 NCCL_DEBUG=INFO

# Add project files
COPY src /app/src
COPY config /app/config
WORKDIR /app

# Expose API port
EXPOSE 8000

# Command to run the server
CMD ["python", "/app/src/serve.py"]
