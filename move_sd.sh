#!/bin/bash


mount /dev/mmcblk0p1 /mnt
cp blink.rbf /mnt/sdr.rbf
cp blink.rbf /mnt/soc_system.rbf
umount /mnt


mount /dev/mmcblk0p2 /mnt
cp blink.rbf /mnt/lib/firmware/
cp blink.rbf /mnt/root/
umount /mnt

rm blink.rbf
