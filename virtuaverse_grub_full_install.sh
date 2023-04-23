#!/bin/bash

# Check if grub2-common is installed on Debian based
if [ -x "$(command -v dpkg)" ]; then
  if ! dpkg -s grub2-common >/dev/null 2>&1; then
    echo "grub2-common is not installed. Please execute 'sudo apt-get install grub2-common grub-pc grub2' for installing grub2"
    exit 1
  fi
# Check if grub2-common is installed on Debian based
elif [ -x "$(command -v pacman)" ]; then
  if ! pacman -Q grub >/dev/null 2>&1; then
    echo "grub2-common is not installed. Please execute 'sudo pacman -S grub2' for installing grub2"
    exit 1
  fi
# Check if grub2-common is installed on Debian based
elif [ -x "$(command -v rpm)" ]; then
  if ! rpm -q grub2-common >/dev/null 2>&1; then
    echo "grub2-common is not installed. Please execute sudo yum install grub2-common for installing grub2"
    exit 1
  fi
else
  echo "Impossible to know if Grub2 is installed on this system (This script only check Debian, Arch and Redhat based systems"
  exit 1
fi

# Adding some configurations options to /etc/default/grub
sudo bash -c 'cat <<EOF > /etc/default/grub
GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=30
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
GRUB_THEME=/boot/grub/themes/virtuaverse/theme.txt

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal (grub-pc only)
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `vbeinfo'
#GRUB_GFXMODE=640x480

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"
EOF'

# Update grub
if [ -x "$(command -v update-grub)" ]; then
  sudo update-grub
elif [ -x "$(command -v grub-mkconfig)" ]; then
  sudo grub-mkconfig -o /boot/grub/grub.cfg
else
  echo "Impossible to update grub, please try manually"
fi
