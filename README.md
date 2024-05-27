# About

This repo compile SPECCPU2006 (mostly) in parallel.
This repo depends on official spec tools to preprocess Fortran files.

The global optimization flags are set in the root Makefile and Makefile.apps.
The compatibility flags and including paths are set in each Makefile of benchmarks.

# How to

- set SPEC2006 path in env vars

``` shell
export SPEC=/spec2006_path
```

- source shrc

``` shell
cd $SPEC && source shrc
```

- set SPEC_LITE env var to the path of this repo
``` shell
export SPEC_LITE=/spec06_lite
```
- copy source
``` shell
cd $SPEC_LITE
bash $SPEC_LITE/scripts/src_copy.sh
```
- compile binarys
```
export ARCH=riscv64
export CROSS_COMPILE=riscv64-unknown-linux-gnu-
make build-all -j 70
```
- collect result
```
bash scripts/collect.sh
```

# With jemalloc

- compile jemalloc

```
export RISCV=/riscv_toolchain/top
git clone https://github.com/jemalloc/jemalloc.git
cd jemalloc
cp /path/to/jemalloc_cpp.patch ./ && git apply jemalloc_cpp.patch
CC=$RISCV/bin/riscv64-unknown-linux-gnu-gcc CXX=$RISCV/bin/riscv64-unknown-linux-gnu-c++ LD=$RISCV/bin/riscv64-unknown-linux-gnu-ld ./autogen.sh --prefix=$RISCV --host=x86_64-linux-gnu

make && make install

```

```shell
// prepare jemalloc compiled before
export RISCV=/riscv_toolchain/top
export LD_JEMALLOC=1
make build-all -j 70
```
