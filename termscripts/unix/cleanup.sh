#!/bin/bash
set +x
clear
VERSION="$(cat ../../info/version.string)"
PRODUCT="$(cat ../../info/product.string)"

echo "Version $VERSION"
echo "This script will clean up Windows scripts, licenses and readmes, as well as clean temporary files created by $PRODUCT."
read -n 1 -s -r -p "Press any key to continue."
echo ""
echo "Please wait while we perform the cleanup."

