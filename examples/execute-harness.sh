#!/usr/bin/env bash
set -euxo pipefail
tar -xzvf $1
mkdir -p output
afl-2.52b/afl-fuzz -i input -o output harness
