FROM ubuntu:22.04

# Voorkom interactieve prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install bash, curl, git, docker-compose
RUN apt update && \
    apt install -y curl git bash docker-compose && \
    apt clean

# Copy install script
COPY . .

# Run the install script (assumes it clones into /app or similar)
RUN bash install.sh

# Set working dir to where the repo was cloned
WORKDIR /openreplay/scripts/docker-compose

# Run docker-compose
CMD ["docker-compose", "--profile", "migration", "up", "--force-recreate", "--build", "-d"]
