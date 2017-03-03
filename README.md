# rpi-bootloader
[![Build Status](https://travis-ci.org/dieterreuter/rpi-bootloader.svg?branch=master)](https://travis-ci.org/dieterreuter/rpi-bootloader)


## Build locally

We can run the build process for development locally on macOS with the help of [Docker-for-Mac](https://docs.docker.com/docker-for-mac/) and using Docker and Docker Compose.

Show the build process.
```
$ cat build.sh
#!/bin/bash
set -e

docker-compose build
docker-compose run builder
```

Run a local build.
```
$ ./build.sh
```


## Results
```
$ tree builds/
builds/
└── 20170303-121340
    ├── rpi-bootloader.tar.gz
    └── rpi-bootloader.tar.gz.sha256

1 directory, 2 files

$ ls -al builds/20170303-121340/
total 13520
drwxr-xr-x  4 dieter  staff      136 Mar  3 13:14 .
drwxr-xr-x@ 3 dieter  staff      102 Mar  3 13:13 ..
-rw-r--r--  1 dieter  staff  6914623 Mar  3 13:14 rpi-bootloader.tar.gz
-rw-r--r--  1 dieter  staff       88 Mar  3 13:14 rpi-bootloader.tar.gz.sha256
```


## Content of a tarball
```
$ tar vtf builds/20170303-121340/rpi-bootloader.tar.gz
-rw-r--r--  0 root   root     1494 Mar  3 13:14 boot/LICENCE.broadcom
-rw-r--r--  0 root   root    50268 Mar  3 13:14 boot/bootcode.bin
-rw-r--r--  0 root   root     6646 Mar  3 13:14 boot/fixup.dat
-rw-r--r--  0 root   root     2558 Mar  3 13:14 boot/fixup_cd.dat
-rw-r--r--  0 root   root     9777 Mar  3 13:14 boot/fixup_db.dat
-rw-r--r--  0 root   root     9775 Mar  3 13:14 boot/fixup_x.dat
-rw-r--r--  0 root   root  2846692 Mar  3 13:14 boot/start.elf
-rw-r--r--  0 root   root   654980 Mar  3 13:14 boot/start_cd.elf
-rw-r--r--  0 root   root  4983140 Mar  3 13:14 boot/start_db.elf
-rw-r--r--  0 root   root  3929604 Mar  3 13:14 boot/start_x.elf
```

--
MIT License

Copyright (c) 2017 Dieter Reuter
