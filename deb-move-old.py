"""
From a list of debian packages, delete the old ones.

This script is a part of a bigger pipeline.

I wanted to do this in bash, but I didn't know how
to use dictionaries in bash properly, so I am here.
"""

import os
import re
import subprocess

with open("duplicate-packages.txt") as inp:
    debs = inp.readlines()

packages = {}


for deb in debs:
    deb = deb.strip()
    dpkg = subprocess.check_output(["dpkg-deb", "-I", deb])

    name = re.search(r'Package: (.*)', dpkg).group(1)
    version = re.search(r'Version: (.*)', dpkg).group(1)

    package = (version, deb)
    if name in packages:
        packages[name].append(package)
    else:
        packages[name] = [package]

# Packages that are being kept!
for name in sorted(packages):

    print ""
    print name

    for deb in packages[name][-1]:
        print(deb[0] + "\t\t" + deb[1])
        os.rename(deb[1], os.path.join("/home/dufferzafar/Debs", os.path.basename(deb[1])))
