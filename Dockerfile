FROM ubuntu:latest

# Update dan install tmate
RUN apt-get update && apt-get install -y tmate

# Set the entrypoint or command
ENTRYPOINT ["tmate"]
