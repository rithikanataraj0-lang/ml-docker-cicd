```bash
#!/bin/bash

set -e

echo "=================================="
echo "Preparing EC2 for ML Deployment"
echo "=================================="

if ! command -v docker >/dev/null 2>&1; then
    echo "Installing Docker..."

    if command -v dnf >/dev/null 2>&1; then
        sudo dnf update -y
        sudo dnf install -y docker
    elif command -v yum >/dev/null 2>&1; then
        sudo yum update -y
        sudo yum install -y docker
    else
        echo "Unsupported Linux package manager."
        exit 1
    fi
fi

echo "Starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Checking Docker installation..."
sudo docker --version

echo "EC2 preparation completed successfully!"
```
