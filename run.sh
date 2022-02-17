#!/bin/sh

if [ ! -f disk.qcow2 ]; then
	qemu-img create -f qcow2 disk.qcow2 896M &> /dev/null
fi

# -----

qemu-system-x86_64 \
-net nic \
-net user \
-cpu max \
\
-drive file=disk.qcow2,format=qcow2,media=disk \
-drive file=xius.iso,format=raw,media=cdrom \
\
-m $(free -m | grep -oP '\d+' | head -n 1)k \
-smp cores=$(nproc) \
-boot menu=on,strict=off \
-display gtk \
-rtc base=localtime \
-vga qxl \
--accel tcg,thread=multi