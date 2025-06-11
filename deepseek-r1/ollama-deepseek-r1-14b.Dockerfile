# ollama-deepseek-r1-14b.Dockerfile
# Use the official Ollama base image.
FROM ollama/ollama:latest

# Set base environment variables
# Changed OLLAMA_KEEP_ALIVE to -1 to keep models loaded indefinitely
# Define the model you want to pre-load
ENV OLLAMA_KEEP_ALIVE=-1 \
    MODEL_TO_PULL="deepseek-r1:14b"

# Expose the default Ollama port
EXPOSE 11434

# Using a custom entrypoint script to ensure Ollama is running before pulling the model
COPY entrypoint.sh /entrypoint.sh

# Install curl and pulling the model from ollama library
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* && \
   chmod +x /entrypoint.sh && \
   /entrypoint.sh

CMD ["ollama", "serve"]
