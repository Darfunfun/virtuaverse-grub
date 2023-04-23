#!/bin/bash

# Debian-based
if command -v dpkg > /dev/null 2>&1; then
    # Check if grub2 is installed
    if dpkg -s grub2-common > /dev/null 2>&1; then
        echo "grub2-common is installed"
    else
        echo "grub2-common is not installed"
    fi
# Arch based
elif command -v pacman > /dev/null 2>&1; then
    # Check if grub2 is installed
    if pacman -Qi grub > /dev/null 2>&1; then
        echo "grub2-common is installed"
    else
        echo "grub2-common is not installed"
    fi
# Redhat based
elif command -v dnf > /dev/null 2>&1; then
    # Check if grub2 is installed
    if dnf list installed grub2-common > /dev/null 2>&1; then
        echo "grub2-common is installed"
    else
        echo "grub2-common is not installed"
    fi
    
    
    
    
else
    echo "Unknown distribution"
fi
