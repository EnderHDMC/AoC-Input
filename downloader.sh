#!/bin/bash
SESSION="PLACEHOLDER"

# Loop through years 2015 to 2024
for YEAR in {2015..2024}; do
  # Loop through days 1 to 25
  for DAY in {1..25}; do
    # Format DAY with leading zero if necessary
    DAY_PADDED=$(printf "%02d" $DAY)

    # Set output directory
    OUTPUT_DIR="$YEAR"
    mkdir -p "$OUTPUT_DIR"
    OUTPUT_PATH="$OUTPUT_DIR/day$DAY_PADDED.txt"

    # Skip if the file already exists
    if [[ -f "$OUTPUT_PATH" ]]; then
      echo "File $OUTPUT_PATH already exists. Skipping..."
      continue
    fi

    # Fetch the input file
    echo "Fetching input for Year: $YEAR, Day: $DAY"
    curl "https://adventofcode.com/$YEAR/day/$DAY/input" \
      -H "cookie: session=$SESSION" \
      -o "$OUTPUT_PATH"

    # Wait a bit to avoid overwhelming the server
    sleep 5
  done
done
