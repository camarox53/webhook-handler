#! /bin/bash 

echo "Building contianers for all platforms"

# One build command to hanldle arm and amd64 
docker buildx build --push --platform linux/arm/v8,linux/amd64 --tag cmorris/webhook-handler:latest .

