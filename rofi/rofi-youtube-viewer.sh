#!/usr/bin/env bash

# Various options for the file browser script:
ROFI_YOUTUBE_VIEWER="youtube-viewer" # command used for opening the selection

# Handle argument.
if [ -n "$@" ]
then
    ROFI_YT_URL="$@"
    coproc ("${ROFI_YOUTUBE_VIEWER}" -q --really-quiet "${ROFI_YT_URL}" & > /dev/null 2>&1 ) 
fi

# vim:sw=4:ts=4:et:
