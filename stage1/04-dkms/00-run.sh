#!/bin/bash -e

HEADERLOC="${ROOTFS_DIR}/usr/src"

# we build only for the v7+ kernel
for KN in ${HEADERLOC}/*v7+
do
	KERNEL=$(echo ${KN} | sed -e 's/linux-headers-//')
done
#KERNEL="4.19.42-v7+"
KERNEL=$(basename $KERNEL)
echo "Building for kernel: ${KERNEL}"
VER="0.0.1"
mkdir -p ${ROOTFS_DIR}/tmp
echo ${KERNEL} > ${ROOTFS_DIR}/tmp/kv
mkdir -p ${ROOTFS_DIR}/usr/src/snd-digitakt-${VER}
cp files/* ${ROOTFS_DIR}/usr/src/snd-digitakt-${VER}
# replace kernelver variable in dkms.conf
sed -e "s/KERNELV/$KERNEL/g" files/dkms.conf > ${ROOTFS_DIR}/usr/src/snd-digitakt-${VER}/dkms.conf
echo "config: ${ROOTFS_DIR}/usr/src/snd-digitakt-${VER}/dkms.conf"
cat ${ROOTFS_DIR}/usr/src/snd-digitakt-${VER}/dkms.conf
