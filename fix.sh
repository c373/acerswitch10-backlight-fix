#!/bin/bash

if [ $( id -u ) -ne 0 ]
  then
	echo 'Please run as root.'
	exit
fi

initrdimg="$(readlink -f /boot/initrd.img)"
echo backing up $initrdimg...
mv -v $initrdimg $initrdimg.old
echo generating $initrdimg...
cat initramfs-acer-sw10-sw5-012-dsdt-overlay.img $initrdimg.old > $initrdimg
