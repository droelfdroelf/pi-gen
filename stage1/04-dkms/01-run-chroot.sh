#!/bin/bash -e

VER="0.0.1"
KERNELV=$(cat /tmp/kv)
dkms -c /usr/src/snd-digitakt-${VER}/dkms.conf -k ${KERNELV} build snd-digitakt/${VER}
dkms -c /usr/src/snd-digitakt-${VER}/dkms.conf -k ${KERNELV} install snd-digitakt/${VER}

