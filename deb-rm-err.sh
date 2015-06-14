# Remove all debs that err!

for deb in /var/cache/apt/archives/*.deb; do
    dpkg-deb -I "$deb" 1>/dev/null 2>/dev/null
    if [ $? -ne 0 ]; then
        rm -f "$deb"
    fi
done
