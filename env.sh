#!/bin/bash

export SPEC=~/dev/SPEC2006/cpu2006-1.2/
echo "SPEC="$SPEC

export SPEC_LITE=`pwd`
echo "SPEC_LITE="$SPEC_LITE

export ARCH=riscv64
export CROSS_COMPILE=riscv64-unknown-linux-gnu-
echo "ARCH="$ARCH
echo "CROSS_COMPILE"=$CROSS_COMPILE
