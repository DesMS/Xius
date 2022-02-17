#!/bin/sh

rm -f xius.iso
cd out
if [ ! -e xius.flp ]; then
	mkdosfs -C xius.flp 1440 &> /dev/null
fi
nasm -O0 -w+orphan-labels -f bin -o bootloader.bin ../src/bootloader.asm
nasm -O0 -w+orphan-labels -f bin -o kernel.bin ../src/kernel.asm
dd status=noxfer conv=notrunc if=bootloader.bin of=xius.flp &> /dev/null
sleep 0.2
rm -f xius.iso
mkisofs -quiet -V 'XIUS' -input-charset iso8859-1 -o xius.iso -b xius.flp ./
cp ./xius.iso ../xius.iso
cd ../