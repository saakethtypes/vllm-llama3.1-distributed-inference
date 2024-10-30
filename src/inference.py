import requests

url = "http://llama-inference-service:8000/generate"
payload = {
    "prompt": "San Francisco is a",
    "max_tokens": 50
}

response = requests.post(url, json=payload)
print(response.json())
