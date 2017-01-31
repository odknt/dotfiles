#!/bin/bash

VGAOUT="$(lspci | grep -wi vga)"
RADEON="$(grep -wi radeon <<< "$VGAOUT")"
NVIDIA="$(grep -wi nvidia <<< "$VGAOUT")"

if [[ $NVIDIA ]]; then
  echo "$(nvidia-settings -q '[gpu:0]/GPUCoreTemp' | \
    grep -Po '(?<=\):\s)\d+(?=.)')℃"
fi
