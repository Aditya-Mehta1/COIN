#!/bin/bash
# Download required model weights for COIN pipeline
set -e

WEIGHTS_DIR="$(cd "$(dirname "$0")" && pwd)/weights"
mkdir -p "$WEIGHTS_DIR"

# SAM 2.1 Hiera Large
SAM_FILE="$WEIGHTS_DIR/sam2.1_hiera_l.pt"
if [ ! -f "$SAM_FILE" ]; then
    echo "Downloading SAM 2.1 Hiera Large weights..."
    wget -q --show-progress -O "$SAM_FILE" \
        "https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_large.pt"
    echo "Saved to $SAM_FILE"
else
    echo "SAM 2.1 weights already exist at $SAM_FILE"
fi

# OpenCV Structured Edge Detection model
EDGE_FILE="$WEIGHTS_DIR/edge.yml.gz"
if [ ! -f "$EDGE_FILE" ]; then
    echo "Downloading OpenCV Structured Edge Detection model..."
    wget -q --show-progress -O "$EDGE_FILE" \
        "https://raw.githubusercontent.com/opencv/opencv_extra/master/testdata/cv/ximgproc/model.yml.gz"
    echo "Saved to $EDGE_FILE"
else
    echo "Edge detection model already exists at $EDGE_FILE"
fi

echo "All weights downloaded."
