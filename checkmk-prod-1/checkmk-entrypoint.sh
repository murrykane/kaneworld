#!/bin/bash
set -e

SITE=${CMK_SITE_ID:-KaneCo}

if [ ! -d "/omd/sites/$SITE" ]; then
  echo "### CREATING SITE '$SITE'"
  omd create "$SITE"
else
  echo "### Site '$SITE' already exists. Skipping creation."
fi

if [ "${CMK_SKIP_START_SITE}" != "yes" ]; then
  echo "### Starting site '$SITE'"
  omd start "$SITE"
else
  echo "### Skipping site start as per CMK_SKIP_START_SITE=${CMK_SKIP_START_SITE}"
fi

# Keep container alive
tail -f /dev/null

