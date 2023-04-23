# Install the VirtuVerse theme in grub : 


##### Download here: https://github.com/Patato777/dotfiles


`sudo grub-mkconfig -o /boot/grub/grub.cfg`

If it doesn't work, then make sure grub2 is installed `sudo apt-get update`

`sudo apt-get install grub2-common`, if it still doesn't work, create a grub folder in /boot with the command `sudo mkdir grub`.



If grub is not installed, run the command `sudo apt-get install grub2-common`.


Note: Run `sudo apt install gawk` if `awk -i inplace` returns an error and replace awk with gawk in the script. 
If it returns the error `/etc/default/grub not found` :
1. Run `sudo nano /etc/default/grub` 
2. Paste `GRUB_THEME=/boot/grub/themes/virtuaverse/theme.txt`
