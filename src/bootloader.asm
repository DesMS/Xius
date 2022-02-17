bits 16

jmp short boot

OEMLabel db "Xius"
BytesPerSector dw 512
SectorsPerCluster db 1
ReservedForBoot dw 1
NumberOfFats db 2
RootDirEntries dw 224

LogicalSectors dw 2880
MediumByte db 0x0f0
SectorsPerFat dw 9
SectorsPerTrack dw 18
Sides dw 2
HiddenSectors dd 0
LargeSectors dd 0
DriveNo dw 0
Signature db 41
VolumeID dd 0x00000000
VolumeLabel db "           "
FileSystem db "FAT12   "

boot:
	mov ax, 0x07c0
	mov ax, 544
	cli
	mov ss, ax
	mov sp, 4096
	sti

	mov ax, 0x07c0
	mov ds, ax

	cmp dl, 0
	je .no_change
	mov [bootdev], dl
.no_change:
	mov eax, 0

bootdev db 0
cluster dw 0
pointer dw 0

times 510-($-$$) db 0
dw 0x0aa55

buffer: