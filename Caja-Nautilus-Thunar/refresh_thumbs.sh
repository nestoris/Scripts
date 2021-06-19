#!/bin/bash
for i in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
rm `gio info "$i"|awk '/thumbnail::path/{sub(/^.* /,"",$0);print}'`
done
