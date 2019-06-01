#!/usr/bin/env bash
set -euxo pipefail
wget http://lcamtuf.coredump.cx/afl/releases/afl-2.52b.tgz
tar -xzf afl-2.52b.tgz
cd afl-2.52b
make