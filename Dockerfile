# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
#  These will be a python script called app.py
#   and another configuration file called requirements.txt
COPY . /app

# Install any needed packages specified in requirements.txt
#
#  It will contain just "Flask" and "Redis"
#
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 (of the container) available to the world outside this container
#  Docker might well map this to a different port on the, er, 'actual host'
EXPOSE 80

# Define environment variable - not sure what for
ENV NAME World

# Run app.py in python when the container launches
CMD ["python", "app.py"]