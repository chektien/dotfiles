# check which file is the new drive mapped to
sudo fdisk -l

# use fdisk to edit partition table and create a new one
sudo fdisk /dev/sda
n, p, l, ENTER, ENTER, w

# format the partition using ext4
sudo mkfs -t ext4 /dev/sda1
ENTER

# create a dir as the filesystem mount point
sudo mkdir /owldata

# mount the partition
sudo mount -t auto /dev/sda1 /owldata

# edit fstab to mount on boot
sudo vim /etc/fstab

add /dev/sda1 /owldata auto noatime 0 0`

# edit /etc/samba/smb.conf
add 

[owldata]
comment = Share
path = "/ssd"
writeable = yes
guest ok = yes
create mask = 0777
directory mask = 0777
force user = pi
