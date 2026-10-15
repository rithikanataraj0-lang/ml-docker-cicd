```bash
#!/bin/bash

set -e

echo "Stopping existing ML application container..."

if sudo docker ps -a --format '{{.Names}}' | grep -q '^iris-ml-app$'; then
    sudo docker stop iris-ml-app || true
    sudo docker rm iris-ml-app || true
    echo "Existing container stopped and removed."
else
    echo "No existing ML application container found."
fi

echo "Stop operation completed successfully."
```
