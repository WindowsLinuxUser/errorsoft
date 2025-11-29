#!/bin/bash
set +x
clear
PRODUCT="$(cat ./info/product.string)"
VERSION="$(cat ./info/version.string)"

echo "You don't need to run this file in the terminal unless you are trying to fix errors."

#venv check
if [ -d "./esvenv" ]; then
    echo "$PRODUCT venv found."
    ESVENV="./esvenv"
else
    echo "$PRODUCT venv not found. Proceed with creation?"
    read -n 1 -s -r -p "Press any key to continue, or press CTRL+C to exit."
    python -m venv esvenv
fi

sleep 1

launch_python() {
    python3 ./tklauncher.py
}
echo "Entering venv..."
source $ESVENV/bin/activate
if python3 -c "import pygame" &> /dev/null; then
    echo "Dependency check 2 done!"
else
    echo "Dependency check 2 failed!"
    echo "Now installing pygame..."
    pip install pygame
fi
launch_python
clear
exit 0