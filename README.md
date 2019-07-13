# rpi-bootloader
[![Build Status](https://travis-ci.org/DieterReuter/rpi-bootloader.svg?branch=master)](https://travis-ci.org/DieterReuter/rpi-bootloader)

This repo just builds a package with all the necessary boot file for a Raspberry Pi. So it fetches all files from the upstream repo at https://github.com/raspberrypi/firmware.

Bootloader for latest LTS Linux Kernel 4.19.58. Last built at 2019-07-13.


## Build locally

We can run the build process for development locally on macOS with the help of [Docker-for-Mac](https://docs.docker.com/docker-for-mac/) and using Docker and Docker Compose.

Show the build process.
```
$ cat build.sh

#!/bin/bash
set -e

docker-compose -p rpibootloaderbuild build
docker-compose -p rpibootloaderbuild run builder
docker-compose -p rpibootloaderbuild down
```

Run a local build.
```
$ ./build.sh
```


## Results
```
$ tree builds/
builds/
└── 20190713-103924
    ├── rpi-bootloader.tar.gz
    └── rpi-bootloader.tar.gz.sha256

1 directory, 2 files

$ ls -al builds/20190713-103924/
total 27768
drwxr-xr-x  4 dieter  staff       128 Jul 13 12:39 .
drwxr-xr-x  3 dieter  staff        96 Jul 13 12:40 ..
-rw-r--r--  1 dieter  staff  13718802 Jul 13 12:39 rpi-bootloader.tar.gz
-rw-r--r--  1 dieter  staff        88 Jul 13 12:39 rpi-bootloader.tar.gz.sha256
```


## Content of a tarball
```
$ tar vtf builds/20190713-103924/rpi-bootloader.tar.gz
-rw-r--r--  0 root   root    18693 Jul 13 12:39 boot/COPYING.linux
-rw-r--r--  0 root   root     1494 Jul 13 12:39 boot/LICENCE.broadcom
-rw-r--r--  0 root   root    52296 Jul 13 12:39 boot/bootcode.bin
-rw-r--r--  0 root   root     6724 Jul 13 12:39 boot/fixup.dat
-rw-r--r--  0 root   root     6068 Jul 13 12:39 boot/fixup4.dat
-rw-r--r--  0 root   root     3030 Jul 13 12:39 boot/fixup4cd.dat
-rw-r--r--  0 root   root     9146 Jul 13 12:39 boot/fixup4db.dat
-rw-r--r--  0 root   root     9148 Jul 13 12:39 boot/fixup4x.dat
-rw-r--r--  0 root   root     2649 Jul 13 12:39 boot/fixup_cd.dat
-rw-r--r--  0 root   root     9802 Jul 13 12:39 boot/fixup_db.dat
-rw-r--r--  0 root   root     9798 Jul 13 12:39 boot/fixup_x.dat
-rw-r--r--  0 root   root  2878052 Jul 13 12:39 boot/start.elf
-rw-r--r--  0 root   root  2759172 Jul 13 12:39 boot/start4.elf
-rw-r--r--  0 root   root   762880 Jul 13 12:39 boot/start4cd.elf
-rw-r--r--  0 root   root  4716552 Jul 13 12:39 boot/start4db.elf
-rw-r--r--  0 root   root  3672712 Jul 13 12:39 boot/start4x.elf
-rw-r--r--  0 root   root   685412 Jul 13 12:39 boot/start_cd.elf
-rw-r--r--  0 root   root  4854088 Jul 13 12:39 boot/start_db.elf
-rw-r--r--  0 root   root  3791560 Jul 13 12:39 boot/start_x.elf
```


## License

MIT License

Copyright (c) 2018-2019 Dieter Reuter
