#!/bin/sh
. /app/venv/bin/activate
/app/venv/bin/python manage.py makemigrations
/app/venv/bin/python manage.py migrate
/app/venv/bin/python manage.py rebuild_index
/app/venv/bin/python manage.py runserver 0:8001
