#!/usr/bin/env sh

export HOME=/config

exec java \
  -XX:+UseShenandoahGC \
  -XX:ShenandoahGCHeuristics=compact \
  -XX:+UseStringDeduplication \
  -XX:MaxRAMPercentage=75.0 \
  --add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED \
  -Duser.home=/config \
  -jar /usr/share/mediathekview/MediathekView.jar
