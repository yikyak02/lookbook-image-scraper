# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a virtual environment
RUN python -m venv /venv

# Activate the virtual environment and install the dependencies
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Set the environment variable for Flask
ENV FLASK_APP=app.py

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Use the virtual environment to run the app
CMD ["/venv/bin/python", "-m", "flask", "run", "--host=0.0.0.0", "--port=5000"]