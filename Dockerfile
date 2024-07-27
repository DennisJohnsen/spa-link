# Use the official Ruby image from the Docker Hub with ARM64 support
FROM ruby:2.7-alpine3.14

# Install necessary packages and tools
RUN apk update && apk add --no-cache \
    build-base \
    socat \
    tzdata && \
    # Install ffi directly
    gem install ffi -v 1.17.0 && \
    # Set bundler to deployment mode and install the application
    bundle config set deployment 'true' && \
    gem install balboa_worldwide_app && \
    # Clean up build dependencies
    apk del build-base && \
    rm -rf /var/cache/apk/*

# Environment variables
ENV MQTT_URI=mqtt://admin:hqdmv4AneEY8@192.168.1.100 \
    BRIDGE_IP=192.168.1.102 \
    BRIDGE_PORT=8899

# Copy the entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Define the entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]