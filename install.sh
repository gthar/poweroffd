#!/usr/bin/env sh

cp -r poweroff /usr/local/stow
cd /usr/local/stow
stow poweroffd

systemctl enable powerffd.service
systemctl start powerffd.service
