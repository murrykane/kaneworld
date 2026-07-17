#!/bin/bash
# Usage function
usage() {
    echo "Usage: $0"
    echo "This will sync Radarr and Sonarr based on configuration files."
    echo
    echo "Arguments:"
    ehoc "    NA"
    exit 1
}
docker exec -it recyclarr-prod-2 recyclarr sync