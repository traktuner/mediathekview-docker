#!/bin/sh
export HOME=/config

if grep -qi "ubuntu" /etc/os-release; then
    /bin/sh -c MediathekView
elif grep -qi "alpine" /etc/os-release; then
    /tmp/MediathekView
fi

sleep infinity
