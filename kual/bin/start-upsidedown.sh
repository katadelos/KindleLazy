#!/bin/bash

#unmount file first (maybe silly to do), copy conf from system to public area
#replace counter clock wise setting with clockwise
#mount and remount (makes the read only work) - read only so that makexconfig doesn't overwrite our CW change
#kill lxinit, it will restart X
#set the input flipped so the touch screen is comfortable upside down.
#set book page view to portrait. if view setting is landscape, even if we rotated upside down, when book is opened kindle will fix itself and stop upsidedown.


#these changes are not permenant, reboot will restore rotation and input rotation.
#input rotation does not survive lxinit, so we do it afterwards

#maybe good idea to check if everything was successful and THEN fix the touch input... :)

cd "$(dirname "$0")"

umount /var/local/xorg.conf
cp /var/local/xorg.conf xorg.conf
sed -i 's/        Option      "Rotate"  "CCW"/        Option      "Rotate"  "CW"/g' xorg.conf
mount --bind xorg.conf /var/local/xorg.conf
mount -o remount,ro,bind /var/local/xorg.conf
killall lxinit
sleep 15
./xinput set-prop 'multitouch' 'Multitouch Device Orientation' 1
lipc-set-prop com.lab126.winmgr orientationLock U