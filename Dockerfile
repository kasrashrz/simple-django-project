# Use a Python 3.7 image as the base
FROM python:3.7

# Set the working directory
WORKDIR /app

# Copy your application code and requirements.txt to the container
COPY . /app

# Install or upgrade pip
RUN pip install --upgrade pip

# Create and activate a virtual environment
RUN python -m venv venv

# Install dependencies within the virtual environment
RUN /app/venv/bin/pip install -r requirements.txt

RUN echo "#!/bin/sh" > entrypoint.sh && \
    echo "/app/venv/bin/python manage.py makemigrations" >> entrypoint.sh && \
    echo "/app/venv/bin/python manage.py migrate" >> entrypoint.sh && \
    echo "/app/venv/bin/python manage.py rebuild_index" >> entrypoint.sh && \
    echo "/app/venv/bin/python manage.py runserver 0:8001" >> entrypoint.sh && \
    chmod +x entrypoint.sh

EXPOSE 8001

# Use the updated shell script as the default command
CMD ["/app/entrypoint.sh"]
