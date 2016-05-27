#!/bin/sh

# Yubikey statt sudo passwort:
# Siehe auch:
# https://thomas-leister.de/linux/mit-yubikey-unter-arch-linux-einloggen-offline/
sudo pacman -S yubikey-pam
ykpamcfg -v -1

echo "Please add this line in /etc/pam.d/system-auth before auth .* pam_unix.so:"
echo "auth      sufficient    pam_yubico.so    mode=challenge-response"
echo "(waiting 5 seconds for you to copy this)"
sleep 7
sudo vim /etc/pam.d/system-auth


echo 
echo "Should work now."
echo "Hint: Maybe you want to set your pwd to something very long now."
echo "(also do not forget to change it for 'root' too!)"
