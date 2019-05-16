#!/usr/bin/env bash
# Bash3 Boilerplate. Copyright (c) 2014, kvz.io

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

arg1="${1:-}"

FPS=${FPS:=25}
HEIGHT=${HEIGHT:=1944}
PORT=${PORT:=8554}
WIDTH=${WIDTH:=2592}

#raspivid -n -o - -t 0 -w 1920 -h 1080 -fps 30 -b 250000 | cvlc -vvv stream:///dev/stdin --sout '#rtp{access=udp,sdp=rtsp://:8554/stream}' :demux=h264

# https://projects.raspberrypi.org/en/projects/infrared-bird-box/11
raspivid -o - -t 0 -w ${WIDTH} -h ${HEIGHT} -fps ${FPS} -b 4000000 -g 50 | cvlc -vvv stream:///dev/stdin --sout "#rtp{access=udp,sdp=rtsp://:${PORT}/stream}" :demux=h264
r
