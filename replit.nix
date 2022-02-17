{ pkgs }: {
	deps = [
		pkgs.nodejs-17_x
		pkgs.qemu_full
		pkgs.wget
		pkgs.dosfstools
		pkgs.cdrkit
		pkgs.nasm
		pkgs.fakeroot
	];
}