#!/bin/sh

python manage.py collectstatic --no-input --clear
python manage.py migrate

set -e

# Add the following lines to ensure correct permissions
if [ -n "$APP_HOME" ]; then
    chown -R app:app "$APP_HOME"
fi


exec "$@"