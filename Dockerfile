# Use the official Ubuntu image as a base
FROM ubuntu:latest

# Set the maintainer label
LABEL maintainer="official4jelas"

# Disable interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    tmate

# Set the working directory
WORKDIR /workspace

# Expose any necessary ports (e.g., for SSH)
EXPOSE 22

# Start a tmate session when the container starts
CMD ["tmate", "-F"]
