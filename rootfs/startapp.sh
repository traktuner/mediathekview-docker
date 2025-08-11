#!/usr/bin/env sh

# Set environment variables
export HOME=/config
export JAVA_OPTS="-XX:+UseShenandoahGC \
  -XX:ShenandoahGCHeuristics=compact \
  -XX:+UseStringDeduplication \
  -XX:MaxRAMPercentage=75.0 \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+UseContainerSupport \
  -XX:InitialRAMPercentage=50.0 \
  -Djava.awt.headless=false \
  -Duser.home=/config"

# Create config directory if it doesn't exist
mkdir -p /config

# Check if Java is available
if ! command -v java >/dev/null 2>&1; then
    echo "Error: Java is not installed or not in PATH"
    exit 1
fi

# Check if MediathekView.jar exists
if [ ! -f "/usr/share/mediathekview/MediathekView.jar" ]; then
    echo "Error: MediathekView.jar not found"
    exit 1
fi

echo "Starting MediathekView with Java options: $JAVA_OPTS"

# Start MediathekView
exec java $JAVA_OPTS \
  --add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED \
  -jar /usr/share/mediathekview/MediathekView.jar
