#!/bin/bash
set -e
set -x

# Create target dir for build artefacts
WORKDIR=$PWD
BUILD_NR=${BUILD_NR:=$(date '+%Y%m%d-%H%M%S')}
if [ "$TIMESTAMP_OUTPUT" == "true" ]; then
  BUILD_DEST=/builds/$BUILD_NR
else
  BUILD_DEST=/builds
fi
mkdir -p $BUILD_DEST

# Clone the upstream GH repo
BRANCH=master
if [[ -d $FIRMWARE ]]; then
  # update repo
  cd $FIRMWARE
  git pull
  git checkout $BRANCH
else
  # clone repo
  git clone --single-branch --branch $BRANCH --depth 1 $FIRMWARE_REPO $FIRMWARE
  cd $FIRMWARE
fi

# Create tar file
TARFILE=rpi-bootloader.tar.gz
FILELIST="
boot/LICENCE.*
boot/bootcode.bin
boot/fixup*.dat
boot/start*.elf
"
tar -cvzf $WORKDIR/$TARFILE $FILELIST
cd $WORKDIR
sha256sum $TARFILE > $TARFILE.sha256

# Copy build artefacts
cp $TARFILE* $BUILD_DEST/

# List build artefacts
ls -al $BUILD_DEST/
