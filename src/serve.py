from vllm import LLM
import yaml

# Load vLLM configuration
with open("config/vllm_config.yaml", "r") as f:
    config = yaml.safe_load(f)

llm = LLM(
    model=config["model_path"],
    tensor_parallel_size=config["tensor_parallel_size"],
    pipeline_parallel_size=config["pipeline_parallel_size"]
)

# Start server with configurations
llm.serve(
    host="0.0.0.0",
    port=8000,
    max_tokens=config["max_tokens"],
    batch_size=config["batch_size"]
)
