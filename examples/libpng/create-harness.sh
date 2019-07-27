#!/usr/bin/env bash
git clone https://github.com/glennrp/libpng.git
cd libpng
CC=../afl-2.52b/afl-gcc ./configure --disable-shared && make -j4
../afl-2.52b/afl-gcc contrib/libtests/readpng.c -lm -lz .libs/libpng16.a -o harness
mkdir input
wget -O input/pixel.png http://www.1x1px.me/FFFFFF-0.8.png?download=1
tar -czvf libpng.amz2.tar.gz harness input
# afl-fuzz -i input -o output harness