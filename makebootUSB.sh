#$ cd /media/somefolder/arch/boot/syslinux    #Where somefolder is the USB drive's mount point. Do not skip this step.
# extlinux --install .                       #Type it exactly as you see it, including the dot.
# dd bs=440 conv=notrunc count=1 if=/usr/lib/syslinux/mbr.bin of=/dev/sdx
# parted /dev/sdx toggle 1 boot
