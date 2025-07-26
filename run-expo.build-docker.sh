# This script is used to run the Expo EAS build environment for Android using Docker.
# Make sure you have Docker installed and running on your machine.
# The script mounts the current directory to /app in the container and sets the working directory to /app.
# Usage: Run this script in your terminal to start the Docker container.
# Ensure you have the Docker image built before running this script.

# If you haven't built the Docker image yet, uncomment the line below to build it first.
# docker build -t expo-eas-android .

# This script runs the Expo EAS build environment for Android.
# It mounts the current directory to /app in the container and sets the working directory to /app.
# This script is for command prompt usage, not for direct execution in a powershell terminal.

#!/bin/bash
# Run a Docker container interactively (-it), and remove it after it exits (--rm)
docker run -it --rm \
  -v $(pwd):/app \ 
  -w /app \
  expo-eas-android

# If you want to run this script in a PowerShell terminal, you can use the following command:
# Make sure to adjust the volume mount syntax for PowerShell.
# For PowerShell, you might need to adjust the path syntax as follows:
# docker run -it --rm `
#   -v "${PWD}:/app" `
#   -w /app `
#   expo-eas-android

# Note: The `-it` flag allows you to interact with the container, and `--rm` removes the container after it exits.
#       -v $(pwd):/app mounts the current directory to /app in the container.
#       -w /app sets the working directory inside the container to /app.
#       expo-eas-android is the name of the Docker image you should have built previously.