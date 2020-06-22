#!/bin/bash

IFS=','

read -ra FILE_EXTENSIONS <<< "${2:-.js,.css,.html,.json}"
read -ra TOOLS <<< "${3:-brotli,gzip}"
DEPTH=${4:-3}

echo "Processing files in folder '$1' using maximum folder depth $DEPTH"

for FILE_EXT in "${FILE_EXTENSIONS[@]}"
do
    for TOOL in "${TOOLS[@]}"
    do
        case $TOOL in
            gzip)
                `find $1 -maxdepth $DEPTH -type f -name "*$FILE_EXT" -exec gzip -k -f {} \;`
                ;;
                
            brotli)
                `find $1 -maxdepth $DEPTH -type f -name "*$FILE_EXT" -exec brotli -f {} \;`
                ;;
                
            *)
                echo "Invalid tool"
                ;;
        esac
    done
done
