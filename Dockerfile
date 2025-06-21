FROM docker:24.0-cli

# Install bash, curl, git, docker-compose
RUN apk add --no-cache bash curl git docker-compose

# Copy install script
COPY . .

# Run the install script (assumes it clones into /app or similar)
RUN bash install.sh

# Set working dir to where the repo was cloned
WORKDIR /openreplay/scripts/docker-compose

# Run docker-compose
CMD ["docker-compose", "--profile", "migration", "up", "--force-recreate", "--build", "-d"]
