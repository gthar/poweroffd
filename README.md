# poweroffd

Background daemon to be able to poweroff my pi from a physical button

## args
* pin: pin where the button is connected

## connections
connect the pin (by default 17) to one end of the button and ground to the other

## installation
1. useradd -M -G gpio -s /usr/bin/nologin poweroffd 
2. add "poweroffd ALL=NOPASSWD: /sbin/poweroff" to sudoers
3. sh install.sh
