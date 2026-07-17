#!/bin/bash

# Set variables
CHECK_MK_SERVER_URL="https://checkmk.local.kaneworld.org/KaneCo/"
PLUGIN_DIR="/usr/lib/check_mk_agent/plugins"
CONF_DIR="/etc/check_mk"   #only needs to be updated once.... so I will not add this logic
WAIT_TIME=5 # wait time in seconds
TIMEOUT=300 # timeout in seconds
START_TIME=$(date +%s)

# Install Checkmk docker dependencies
pip install docker
pip3 install docker

# Check if checkmk server is available.
while true; do
  CURRENT_TIME=$(date +%s)
  ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

  if [[ $ELAPSED_TIME -ge $TIMEOUT ]]; then
    echo "Timeout reached. Checkmk server is not available."
    exit 1
    break
  fi

  response=$(curl --write-out '%{http_code}' --silent --output /dev/null "${CHECK_MK_SERVER_URL}check_mk/agents/plugins/mk_docker.py")

  if [[ $response -eq 200 ]]; then
    echo "Checkmk server is online"
    break
  else
    echo "Checkmk server is not available. Retrying in $WAIT_TIME seconds..."
    sleep "$WAIT_TIME"
  fi
done

#Install Checkmk Docker and smart plugin
rm -rf ${PLUGIN_DIR}
mkdir -p ${PLUGIN_DIR}
cd ${PLUGIN_DIR}
wget ${CHECK_MK_SERVER_URL}check_mk/agents/plugins/mk_docker.py
chmod 755  mk_docker.py
wget ${CHECK_MK_SERVER_URL}/check_mk/agents/plugins/smart
chmod 755 smart