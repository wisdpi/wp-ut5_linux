#!/bin/sh
echo "Check old driver and unload it."
check=`lsmod | grep r8152`
if [ "$check" != "" ]; then
        echo "rmmod r8152"
        /sbin/rmmod r8152
fi

echo "Build the module and install"
echo "-------------------------------" >> log.txt
date 1>>log.txt
make $@ all 1>>log.txt || exit 1
module=`ls *.ko`
module=${module#src/}
module=${module%.ko}

echo "DEPMOD $(uname -r)"
depmod `uname -r`
echo "UPDATE initramfs"
update-initramfs -u

echo "COPY udev rules"
cp 50-wput5.rules /etc/udev/rules.d/
echo "Completed. Please reboot system"
exit 0