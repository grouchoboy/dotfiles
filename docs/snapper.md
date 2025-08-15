This guide walks you through the installation, configuration, and usage of Snapper on Arch Linux.

# What is Snapshot
> A snapshot on a Linux PC is a record of the state of your system or file system at a specific point in time.
# Why we need Snapshot for Arch Linux ?
> Snapshots provide a crucial safety net for Arch Linux users, especially given the nature of Arch as a rolling release
> distribution with frequent and sometimes disruptive updates.
---
## Prerequisite
> Confirm that your system uses the GNU GRUB bootloader and the Btrfs file system before starting the installation.

## 1. Install Snapshot Tools
`sudo pacman -S snapper snap-pac`
  > **snap-pac**  will automatically create "pre2 and "post" snapshots when you install, update, or remove packages with pacman.
 ## 2. Configure Snapper 
 - Remove any existing /.snapshots directory or mountpoint if you have it.
  - `sudo umount /.snapshots`
  - `sudo rm -rf /.snapshots`
 - Create Snapper configuration for root: `sudo snapper -c root create-config /` This sets up /etc/snapper/configs/root and .snapshots subvolume for storing snapshots.
 - you could check subvolume with this cmd `df -h`
 - Mount the /.snapshots directory  ` sudo mount -a`
 - Set appropriate permissions: `sudo chmod 750 /.snapshots` `sudo chown :wheel /.snapshots` These commands restrict access to the /.snapshots directory so that only the owner and members of the wheel group can access it, enhancing security and limiting who can view or modify its contents.
 ## 3. Create and Managing Snapshots
 - Get manual snapshot ` sudo snapper -c root create --description "Whatever you want"` and list snapshots `sudo snapper -c root list` you could delete if you wish `sudo snapper -c root delete <snapshot-number>`
 ## 4. Integrate with GRUB for Easy Rollbacks
 Install **grub-btrfs** to automatically add snapshots to your GRUB boot menu, allowing you to boot directly into a snapshot if needed.
 - `yay -S grub-btrfs ` `sudo grub-mkconfig -o /boot/grub/grub.cfg`
 - run `grub-btrfs` for one time.

 ## 5.Summary
 - Use snapper for automated and manual Btrfs snapshots.
 - Snap-pac integrates with pacman for package operation snapshots.
 - grub-btrfs adds snapshot boot entries to GRUB.

For more details, 
- check [arch Wiki Snapper Page](https://wiki.archlinux.org/title/Snapper) 
- SUSE the Basic concepts of [Snapper](https://documentation.suse.com/smart/systems-management/html/snapper-basic-concepts/index.html)
- [Btrfs file system](https://en.wikipedia.org/wiki/Btrfs)
- more deep knowledge [watch](https://www.youtube.com/watch?v=_97JOyC1o2o) Stephen"s Tech Talks's youtube video about snapper on Arch Linux Systems. 
---
> This document was prepare using information from Wikipedia, YouTube, the Arch Linux Wiki, the SUSE Snapper website, and ChatGPT.


