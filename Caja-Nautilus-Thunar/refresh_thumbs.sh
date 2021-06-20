#!/bin/bash
for i in "$@"; do
rm $(gio info "$i"|awk '/thumbnail::path/{sub(/^.* /,"",$0);print}')
done
