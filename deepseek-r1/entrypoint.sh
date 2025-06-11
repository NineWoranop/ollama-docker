#!/bin/bash

# Start Ollama server in the background
/bin/ollama serve &

# Wait for Ollama server to be ready
# We'll poll the health endpoint until it returns a success status
echo "Waiting for Ollama server to start..."
until curl -s http://localhost:11434/api/tags > /dev/null; do
  echo "Ollama not yet ready, waiting..."
  sleep 5
done
echo "Ollama server is ready."

# Pull the specified model
echo "Pulling model: $MODEL_TO_PULL"
ollama pull "$MODEL_TO_PULL"

echo "Pulling model: $MODEL_TO_PULL has been done."
