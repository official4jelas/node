# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="official4jelas"

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages and sudo
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    tmate \
    sudo

# Add a non-root user and add to sudoers
RUN useradd -m myuser && \
    echo 'myuser:password' | chpasswd && \
    adduser myuser sudo

# Allow sudo without password for the user
RUN echo 'myuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to non-root user
USER myuser

# Set the working directory
WORKDIR /workspace

# Expose any necessary ports (e.g., for SSH)
EXPOSE 22

# Start a tmate session when the container starts
CMD ["tmate", "-F"]
