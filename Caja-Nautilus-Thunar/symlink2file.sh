#!/bin/bash
make_orig(){
orig=$(realpath --relative-to="$PWD" "$1")
 if [ -h "$1" ];then
  unlink "$1"
  cp "$orig" "$1"
 fi
}

if [ ! -z "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" ];then
 echo "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"|while read fil; do
  make_orig "$fil"
 done
else
 for i in "$@"; do
  make_orig "$i"
 done
fi
