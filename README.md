# About

This repo compile SPECCPU2006 (mostly) in parallel.
This repo depends on official spec tools to preprocess Fortran files.

Thus, before using this repo, please ensure that you have correctly installed the SPEC tools (in the source tar ball).

``` shell
cd /spec2006_path
./install.sh
```

The global optimization flags are set in the root Makefile and Makefile.apps.
The compatibility flags and including paths are set in each Makefile of benchmarks.

# How to

- set SPEC2006 path in env vars

``` shell
export SPEC=/spec2006_path
```

- source shrc (if you encounter errors, please check whether you have installed SPEC tools correctly)

``` shell
pushd $SPEC && source shrc && popd
```

- copy source
``` shell
make copy-all-src
```
- compile binaries
```
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto -march=rv64gc_zba_zbb_zbc_zbs" \
     build-all -j `nproc`
```

- init data
```
make copy-all-data
```
- collect result
```
make collect-all # default collect folder is cpu2006_build_$(TIMESTAMP)
make collect-all ELF_PATH=/path/to/elf # ELF_PATH is optional
```

# With Vector extension

- compile binaries
```
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto -march=rv64gcv_zvl128b_zba_zbb_zbc_zbs -ftree-vectorize  -mabi=lp64d -mrvv-max-lmul=m4 -mrvv-vector-bits=zvl" \
     build-all -j `nproc`
```

# With jemalloc

- compile jemalloc

```
export RISCV=/riscv_toolchain/top
git clone https://github.com/jemalloc/jemalloc.git
cd jemalloc
cp /path/to/jemalloc_cpp.patch ./
git checkout -b apply-patch da66aa391f853ccf2300845b3873cc8f1cf48f2d
git apply jemalloc_cpp.patch
CC=$RISCV/bin/riscv64-unknown-linux-gnu-gcc CXX=$RISCV/bin/riscv64-unknown-linux-gnu-c++ LD=$RISCV/bin/riscv64-unknown-linux-gnu-ld ./autogen.sh --prefix=$RISCV --host=x86_64-linux-gnu

make && make install

```

```shell
# prepare jemalloc compiled before
export RISCV=/riscv_toolchain/top
export LD_JEMALLOC=1
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto" \
     build-all -j `nproc`
```

# Run and Compare with Reference Output

```shell
# Build the ELF and initialize the data before running.
make ARCH=riscv64 run-all-test  # Run all tests using the test input set. Use run-all-train or run-all-ref for train or ref input sets.
```

You can also specify `VALIDATE=0` and `REPORT=0` to disable validation and report generation to speed up the running process,
this relaxes the need of `SPEC` env var at runtime:

```shell
make ARCH=riscv64 VALIDATE=0 REPORT=0 run-all-test
```

We will use `qemu-$(ARCH)` to run the compiled binary when `$(ARCH)` does not match `uname -m`.

You can also specify `LOADER` argument to run the compiled binaries with different loader, such as `qemu-riscv64-static`:

```shell
make ARCH=riscv64 run-int-test LOADER="qemu-riscv64 -cpu rv64,v=true,vlen=128,rvv_ta_all_1s=true"
```

if no error occurs, the compiled binaries are correct.

When running on a real hardware, sometimes you may want to know the performance counter of the binaries, you can specify `PROFILER` argument to run the compiled binaries with different profiler, such as `perf`:

```shell
make ARCH=riscv64 run-int-test PROFILER="perf stat -e cycles,instructions,branch-misses,cache-misses --append -o ../../perf.log"
```

When you need to compile different binaries with different architecture or flags, you can specify `TAG` argument to distinguish the compiled binaries, it will use `build$(TAG)` as the build folder name:

```shell
make ARCH=x86_64 build-all -j `nproc`
make ARCH=x86_64 run-int-test
make ARCH=riscv64 TAG=riscv64 build-all -j `nproc`
make ARCH=riscv64 TAG=riscv64 run-int-test
```

When you need to run the multiple compiled binaries on a shared storage (e.g. NFS) at the same time, you can specify `RUN_TAG` argument to distinguish the run folders, it will use `run$(RUN_TAG)` as the run folder name:

```shell
make ARCH=riscv64 RUN_TAG=run1 run-int-test
make ARCH=riscv64 RUN_TAG=run2 run-int-test
```


# Test compiled ELF

```shell
make apply-elf-all ELF_PATH=/path/to/elf
make ARCH=riscv64 run-int-test LOADER="qemu-riscv64 -cpu rv64,v=true,vlen=128,rvv_ta_all_1s=true" # LOADER is optional
```

# Note for GCC >= 14

The old version of xerces-c in 483.xalancbmk [contains a bug](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111544) that will cause compile errors in GCC 14 and later. You may need to apply the [patch](./patches/483.xalancbmk.patch) to fix it.

# Note for GCC >= 15

The 436.cactusADM [contains a bug](https://stackoverflow.com/questions/25483031/storage-size-of-tzp-isn-t-known) that will cause compile errors in GCC 15 and later. You may need to apply the [patch](./patches/436.cactusADM.patch) to fix it.

# Note for LLVM >= 21

The 445.gobmk [contains a bug](https://discourse.llvm.org/t/is-anyone-else-seeing-an-error-in-spec2k6-445-gobmk-using-just-scalar/85752) that will cause miscompilation in LLVM 21 and later. You may need to apply the [patch](./patches/445.gobmk.patch) to fix it.

You may also need to set `ulimit -s unlimited` before running LLVM-compiled binaries to avoid stack overflow.
