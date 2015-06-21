# When complete webpages are saved via a browser, a folder containing
# all the needed files is created as well.
#
# Windows used to consider the html file and the folder a signle entity,
# so when a file was deleted, so was the folder, but that doesn't seem
# to be happening in Nautilus.
#
# This script deletes all folders that don't have a matching html file
# present in the same directory.
#
# Todo: Improve the way script is executed.

for dir in ~/Downloads/Webpages/*; do
    if [[ (-d $dir) ]]; then
        # Use shell expansion to replace _files with .htm
        file="${dir/_files/.htm}"

        # Check if a corresponding htm/html file exists
        if ! [[ -f $file || -f "$file"l ]]; then
            rm -r "$dir"
        fi
    fi
done
