#!/bin/bash

# Check if grub2-common is installed on Debian based
if [ -x "$(command -v dpkg)" ]; then
  if ! dpkg -s grub2-common >/dev/null 2>&1; then
    echo "grub2-common is not installed. Please execute 'sudo apt-get install grub2-common' for installing grub2"
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

# Adding some configurations options to grub
echo "GRUB_THEME=/boot/grub/themes/virtuaverse/theme.txt" | sudo tee -a /etc/default/grub > /dev/null
echo "GRUB_DEFAULT=0" | sudo tee -a /etc/default/grub > /dev/null
echo "GRUB_TIMEOUT=30" | sudo tee -a /etc/default/grub > /dev/null
echo "GRUB_TIMEOUT_STYLE=countdown" | sudo tee -a /etc/default/grub > /dev/null

# Update grub
if [ -x "$(command -v update-grub)" ]; then
  sudo update-grub
elif [ -x "$(command -v grub-mkconfig)" ]; then
  sudo grub-mkconfig -o /boot/grub/grub.cfg
else
  echo "Impossible de mettre à jour Grub. Veuillez le faire manuellement."
fi
