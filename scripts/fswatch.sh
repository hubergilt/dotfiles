#!/bin/bash

# Target folder to monitor
TARGET_DIR="$HOME/Downloads"

# Handle file passed as argument from xargs
NEW_FILE="$1"

# Target files containing the Firefox " (1)." duplicate pattern
if [[ -f "$NEW_FILE" && "$NEW_FILE" =~ [[:space:]]?\([0-9]+\)\.[^.]+$ ]]; then
    DIR=$(dirname "$NEW_FILE")
    filename=$(basename "$NEW_FILE")

    BASE_NAME=$(sed -E 's/[[:space:]]?\([0-9]+\)\.[^.]+$//' <<< "$filename")
    EXT="${filename##*.}"

    CLEAN_TARGET="$DIR/$BASE_NAME.$EXT"
    
    # Step 1: Shift existing old versions upward (e.g., .old1.py -> .old2.py)
    # We sort them numerically in reverse to avoid overwriting files during the shift
    for old_file in $(ls -r "$DIR/$BASE_NAME.old"*."$EXT" 2>/dev/null | sort -V -r); do
        if [[ "$old_file" =~ \.old([0-9]+)\."$EXT"$ ]]; then
            NUM="${BASH_REMATCH[1]}"
            NEW_NUM=$((NUM + 1))
            mv "$old_file" "$DIR/$BASE_NAME.old$NEW_NUM.$EXT"
        fi
    done

    # Step 2: Push the current clean file to old1
    if [ -f "$CLEAN_TARGET" ]; then
        mv "$CLEAN_TARGET" "$DIR/$BASE_NAME.old1.$EXT"
    fi

    # Step 3: Promote the newly downloaded file to the clean name
    mv "$NEW_FILE" "$CLEAN_TARGET"
    
    echo "Successfully rotated: $BASE_NAME.$EXT"
fi
