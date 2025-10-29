#!/bin/bash

# Usage: ./pdf_to_images.sh input.pdf output_prefix

INPUT_PDF="$1"
OUTPUT_PREFIX="$2"

if [[ -z "$INPUT_PDF" || -z "$OUTPUT_PREFIX" ]]; then
  echo "Usage: $0 input.pdf output_prefix"
  exit 1
fi

# Convert PDF to PNG images, one per page
pdftoppm "$INPUT_PDF" "$OUTPUT_PREFIX" -png

echo "Images exported with prefix: ${OUTPUT_PREFIX}-*.png"

