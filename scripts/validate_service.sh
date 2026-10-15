```bash
#!/bin/bash

set -e

echo "Checking ML application health..."

APP_URL="http://localhost:5000"

for i in {1..10}; do
    if curl --fail --silent "$APP_URL/health"; then
        echo ""
        echo "ML application is healthy!"
        exit 0
    fi

    echo "Waiting for application... Attempt $i/10"
    sleep 5
done

echo "ERROR: ML application health check failed."
sudo docker logs iris-ml-app
exit 1
```
