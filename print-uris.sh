# Usage:
# bash print-uri.sh < list-of-packages.txt

# Given a list of packages print uris of packages
# that don't already exist on the system
while read -r package; do
    output=$(apt-get --print-uris download "$package")

    uri=$(echo "$output" | cut -f 1 -d' ')
    deb=$(echo "$output" | cut -f 2 -d' ')

    if ! [[ -f /var/cache/apt/archives/$deb ]]; then
        echo "$uri"
    fi
done
