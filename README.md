# LLaMA 3.1 Distributed Inference on Kubernetes

This project sets up a distributed inference environment for the LLaMA 3.1 model using a single-node Kubernetes cluster with four GPUs. It leverages vLLM for multi-GPU inference and Ray for distributed processing.

## Project Structure

- **Dockerfile**: Builds the environment with necessary dependencies.
- **k8s/deployment.yaml**: Kubernetes deployment configuration.
- **k8s/service.yaml**: Kubernetes service configuration.
- **config/vllm_config.yaml**: Configuration for vLLM.
- **run_cluster.sh**: Script to set up Ray cluster.
- **src/inference.py**: Script for running inference.
- **src/serve.py**: Script to start the API server.

## Setup Instructions

1. **Build Docker Image**:
   ```bash
   docker build -t llama-inference:latest .
   ```

2. **Deploy on Kubernetes**:
   ```bash
   kubectl apply -f k8s/deployment.yaml
   kubectl apply -f k8s/service.yaml
   ```

3. **Initialize Ray**:
   - On the head node (master):
     ```bash
     bash run_cluster.sh head
     ```
   - For worker nodes, connect by setting the head node's IP address in the `run_cluster.sh` script.

4. **Testing Inference**:
   - Use the `src/inference.py` script to send prompts to the `llama-inference-service`.

## Prerequisites

- Kubernetes cluster with GPU support.
- Docker installed on the system.
- Access to NVIDIA GPU drivers.
