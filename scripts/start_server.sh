```bash
#!/bin/bash

set -e

echo "Starting ML application container..."

APP_NAME="iris-ml-app"
IMAGE_NAME="iris-ml-app"
APP_PORT=5000

sudo docker run -d \
  --name "$APP_NAME" \
  --restart unless-stopped \
  -p "$APP_PORT:5000" \
  "$IMAGE_NAME"

echo "ML application started successfully!"
echo "Application port: $APP_PORT"
```
