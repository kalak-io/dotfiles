# Dotfiles

Compute all files to start quickly a fresh installation


### Notes

#### Repair booting

Insert an USB stick with arch iso
In prompt, decrypt partition
```
cryptsetup luksOpen /dev/nvme0n1p2 <name>
mount /dev/mapper/<name> /mnt
arch-root /mnt
```

Like chroot, mount the boot partitiion
```
mount /dev/nvme0n1p1 /boot
```
Edit the `mkinitcpio.conf` file and recreate image
```
mkinitcpio -P
```
