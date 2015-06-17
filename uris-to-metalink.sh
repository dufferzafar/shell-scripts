#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "<?xml version=\"1.0\"?>"
echo "<metalink "
echo "    xmlns=\"http://www.metalinker.org/\""
echo "    type=\"static\""
echo "    version=\"3.0\""
echo "    generator=\"duffer's DTA Metalink Generator\""
echo "    a0:version=\"0.7\""
echo "    xmlns:a0=\"http://www.downthemall.net/properties\""
echo "    pubdate=\"Wed, 17 Jun 2015 19:37:27 GMT\">"
echo "<files>"

while read -r line; do
    IFS=" "
    arr=($line)
    IFS=$'\n\t'

    url=$(echo ${arr[0]} | cut -f2 -d"'")
    name=${arr[1]}
    size=${arr[2]}
    # echo "$url" "$name" "$size" "$md5"

    # Metalink Version 4

    # echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
    # echo "<metalink xmlns=\"urn:ietf:params:xml:ns:metalink\">"
    # echo " <published>2015-05-15T12:23:23Z</published>"
    # echo " <file name=\"$name\">"
    # echo "   <size>$size</size>"
    # echo "   <identity>$name</identity>"
    # echo "   <language>en</language>"
    # echo "   <hash type=\"md5\">$md5</hash>"
    # echo "   <url priority=\"1\">$url</url>"
    # echo " </file>"
    # echo "</metalink>"

    # Metalink Version 3

    echo "<file name=\"$name\""
    echo "      a0:num=\"undefined\""
    echo "      a0:startDate=\"undefined\""
    echo "      a0:referrer=\"undefined\">"
    echo "<description>Kubuntu Packages</description>"
    echo "<resources>"
    echo "<url preference=\"100\" a0:usable=\"$url\">"
    echo "     $url"
    echo "</url>"
    echo "</resources>"
    echo "<size>$size</size>"
    echo "</file>"
done

echo "</files>"
echo "</metalink>"
