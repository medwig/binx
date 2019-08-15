#!/bin/bash

SCRIPT=$1		# Name of the script to make executeable
BINDIR='/usr/local/bin' # The bin path to copy the script to

# Exit if script argument is not given
if [ -z "$1" ]
  then
    echo "Name of target script is a required argument"
    exit 0
fi

# Exit if script argument is not a file
if [ ! -f $SCRIPT ]; then
    echo "File not found!"
    exit 0
fi

# Create shebang based on filetype extension
case "$SCRIPT" in
    *.py) SHEBANG='#!/usr/bin/env python3' EXT='.py' ;;
    *.sh) SHEBANG='#!/bin/bash' EXT='.sh' ;;
esac

# Copy script to /tmp for editing as $FILE
cp $SCRIPT /tmp
FILE="/tmp/$SCRIPT"

# Add shebang if not present
if [ "`head -c 2 $FILE`" != "#!" ]; then
    echo "Adding shebang: $SHEBANG"
    sed -i "1i$SHEBANG" $FILE
fi

# Make executeable
chmod +x $FILE

# Copy to bin dir
EXNAME=$(basename $SCRIPT $EXT)  # trim file extension
CP_RESULT=$(sudo cp -i -v $FILE $BINDIR/$EXNAME)

# Print outcome and exit
if [ -z "$CP_RESULT" ]
  then
    echo "Aborted!"
    exit 0
fi
echo "Copied to $BINDIR as $EXNAME"
