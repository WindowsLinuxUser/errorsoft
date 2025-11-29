#!/bin/bash
set +x
clear
PRODUCT="$(cat ./info/product.string)"
VERSION="$(cat ./info/version.string)"

echo "
╔═══╗                      ╔═╗ ╔╗     ╔╗                    ╔╗         
║╔══╝                      ║╔╝╔╝╚╗    ║║                    ║║         
║╚══╗╔═╗╔═╗╔══╗╔═╗╔══╗╔══╗╔╝╚╗╚╗╔╝    ║║   ╔══╗ ╔╗╔╗╔═╗ ╔══╗║╚═╗╔══╗╔═╗
║╔══╝║╔╝║╔╝║╔╗║║╔╝║══╣║╔╗║╚╗╔╝ ║║     ║║ ╔╗╚ ╗║ ║║║║║╔╗╗║╔═╝║╔╗║║╔╗║║╔╝
║╚══╗║║ ║║ ║╚╝║║║ ╠══║║╚╝║ ║║  ║╚╗    ║╚═╝║║╚╝╚╗║╚╝║║║║║║╚═╗║║║║║║═╣║║ 
╚═══╝╚╝ ╚╝ ╚══╝╚╝ ╚══╝╚══╝ ╚╝  ╚═╝    ╚═══╝╚═══╝╚══╝╚╝╚╝╚══╝╚╝╚╝╚══╝╚╝ 
"
echo "Welcome to the $PRODUCT Launcher Legacy! (Ver: $VERSION)"
echo "This bash file is a component of $PRODUCT."
echo "Now launching..."

#bash script dependency checks
if command -v dialog >/dev/null 2>&1 ; then
    echo "Dependency check 1 done!"
else
    echo "Dependency check 1 failed!"
    exit 127
fi

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
    python3 ./bios.py
}



PYGAME_DETECT_AVX2=1
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="$PRODUCT Bash Launcher"
TITLE=""
MENU="Choose one of the following options:"

OPTIONS=(1 "Launch"
         2 "Forcequit"
         3 "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "You picked option 1"
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
            ;;
        2)
            echo "You picked option 2"
            clear
            echo "This will terminate any other python processes."
            read -n 1 -s -r -p "Press any key to continue, or press CTRL+C to exit."
            killall python3
            ;;
        3)
            echo "You picked option 3"
            clear
            exit 0
            ;;
esac