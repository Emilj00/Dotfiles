#!/usr/bin/env bash

if [ "$(hostname)" == "gigabyte" ]; then
    export LIBVA_DRIVER_NAME=nvidia
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export GBM_BACKEND=nvidia-drm
    export __GL_GSYNC_ALLOWED=0
    export __GL_VRR_ALLOWED=0
    export WLR_RENDERER=vulkan
    export WLR_NO_HARDWARE_CURSORS=1
    export NVD_BACKEND=direct
fi

