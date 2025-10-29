#!/bin/bash

# Variables
VIDEO_DEVICE="/dev/video0"
AUDIO_DEVICE="default"  # Or use `-f pulse -i alsa_input.pci-0000_00_1b.0.analog-stereo` for PulseAudio
OUTPUT_FILE="recording_$(date +%Y%m%d_%H%M%S).mkv"

# Record from webcam and mic
ffmpeg \
    -f v4l2 -framerate 30 -video_size 1280x720 -i "$VIDEO_DEVICE" \
    -f alsa -i "$AUDIO_DEVICE" \
    -c:v libx264 -preset ultrafast -c:a aac -b:a 128k \
    "$OUTPUT_FILE"

