#!/usr/bin/env bash
set -euxo pipefail
git clone https://github.com/glennrp/libpng.git
cd libpng
CC=../afl-2.52b/afl-gcc ./configure --disable-shared && make -j4
../afl-2.52b/afl-gcc contrib/libtests/readpng.c -lm -lz .libs/libpng16.a -o harness
mkdir input
wget -O input/tigers.png http://www.jod.id.au/rmit/tigers.png
tar -czvf libpng.tar.gz harness input
# ./afl-fuzz -i testcases/images/png -o some_output_dir -x dictionaries/png.dict /path/to/readpng 
# ./afl-fuzz -i input -o output harness
