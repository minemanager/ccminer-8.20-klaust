#!/bin/bash

# Simple script to create the Makefile and build

# export PATH="$PATH:/usr/local/cuda/bin/"

make distclean || echo clean

rm -f Makefile.in
rm -f config.status
./autogen.sh || echo done

# CFLAGS="-O2" ./configure
extracflags="-march=native -std=c++11 -pthread -fno-strict-aliasing"
CUDA_CFLAGS="-O3 -std=c++11 -Xcompiler -fno-strict-aliasing,-Wall -D_FORCE_INLINES"

./configure CXXFLAGS="-O3 $extracflags" --with-cuda=/usr/local/cuda --with-nvml=libnvidia-ml.so

make -j4
cd ..