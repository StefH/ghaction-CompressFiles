#!/bin/bash

IFS=','

read -ra FILE_EXTENSIONS <<< "${2:-.js,.css,.html,.json}"
read -ra TOOLS <<< "${3:-brotli,gzip}"
depth=${4:-3}
deterministicCompression=${5:-false}

echo "Processing files in folder '$1' using maximum folder depth $depth"

for FILE_EXT in "${FILE_EXTENSIONS[@]}"
do
    for TOOL in "${TOOLS[@]}"
    do
        case $TOOL in
            gzip)
                if [ "$deterministicCompression" = "true" ]
                then
                  `find $1 -maxdepth $depth -type f -name "*$FILE_EXT" -exec gzip -k -f -n {} \;`
                else
                  `find $1 -maxdepth $depth -type f -name "*$FILE_EXT" -exec gzip -k -f {} \;`
                fi
                ;;
                
            brotli)
                `find $1 -maxdepth $depth -type f -name "*$FILE_EXT" -exec brotli -f {} \;`
                ;;
                
            *)
                echo "Invalid tool"
                ;;
        esac
    done
done
