#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

root=Zipped

supertouch() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in $@; do
        echo $root/"$(dirname -- "$f")"
        echo $root/"$f"
        mkdir -p -- $root/"$(dirname -- "$f")"
        touch -- $root/"$f"
    done
}

for zip in *.zip;
do
    supertouch "$(unzip -Z1 "$zip")"
    echo "---"
done
