#### Part 1

# List all debs that are duplicates

for deb1 in /var/cache/apt/archives/*.deb; do
    deb1_name=$(dpkg-deb -I "$deb1" | grep Package:)

    for deb2 in /var/cache/apt/archives/*.deb; do
        deb2_name=$(dpkg-deb -I "$deb2" | grep Package:)

        if [[ "$deb1_name" = "$deb2_name" && "$deb1" != "$deb2" ]]; then
            echo "$deb1"
        fi
    done
done

# This resulted in debs that were dupes.
sort output_of_previous_command | uniq > duplicate-packages.txt

# This part took around 2.5 hours to run!

#### Part 2

# Move all old debs to a different folder
#
# I couldn't do this part in bash so had to move to Python.

python deb-move-old.py
