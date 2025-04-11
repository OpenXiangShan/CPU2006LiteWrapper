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
pushd $SPEC && source shrc && popd
```

- copy source
``` shell
make copy-all-src
```
- compile binarys
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

- compile binarys
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

We will use `qemu-$(ARCH)` to run the compiled binary when `$(ARCH)` does not match `uname -m`.

You can also specify `LOADER` argument to run the compiled binarys with different loader, such as `qemu-riscv64-static`:

```shell
make ARCH=riscv64 run-int-test LOADER="qemu-riscv64 -cpu rv64,v=true,vlen=128,rvv_ta_all_1s=true"
```

if no error occurs, the compiled binarys are correct.

# Test compiled ELF

```shell
make apply-elf-all ELF_PATH=/path/to/elf
make ARCH=riscv64 run-int-test LOADER="qemu-riscv64 -cpu rv64,v=true,vlen=128,rvv_ta_all_1s=true" # LOADER is optional
```

# Note for GCC >= 14

The old version of xerces-c in 483.xalancbmk [contains a bug](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111544) that will cause compile errors in GCC 14 and later. You may need to apply the following patch to SPEC CPU 2006 source code to get this fixed:

```diff
diff --git a/benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.hpp b/benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.hpp
--- a/benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.hpp
+++ b/benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.hpp
@@ -329,7 +329,7 @@ private :
     // -----------------------------------------------------------------------
     unsigned int            fCurIndex;
     NameIdPool<TElem>*      fToEnum;
-    MemoryManager* const    fMemoryManager;
+    MemoryManager*          fMemoryManager;
 };
 
 XERCES_CPP_NAMESPACE_END
diff --git a/MANIFEST b/MANIFEST
--- a/MANIFEST
+++ b/MANIFEST
@@ -9994,7 +9994,7 @@ ac0a17e3fe819364d3a8ea9354a27023 * 0004D188 benchspec/CPU2006/483.xalancbmk/src/
 2192f1105e11d8ea3cbb7019e8c5275e * 00001BC0 benchspec/CPU2006/483.xalancbmk/src/xercesc/util/MsgLoaders/Win32/Win32MsgLoader.hpp
 ffdcae60bae1c42929d1f33389440ec7 * 00001878 benchspec/CPU2006/483.xalancbmk/src/xercesc/util/Mutexes.hpp
 5a5f8fb48bf4b7d3a612e0f005c82019 * 00003CDE benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.c
-67f8de1ccc32e696ca600937d8638680 * 0000321C benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.hpp
+26e31191b8f87d85aa9abce0576d0f0a * 0000321C benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NameIdPool.hpp
 3f7d5f0dcb84f045d9493d125509a05f * 000010E5 benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NetAccessors/Socket/SocketNetAccessor.hpp
 86aa48fb589a764d0f0c994bb912d32f * 00001855 benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NetAccessors/Socket/UnixHTTPURLInputStream.hpp
 09b27f524d928a977425c4f009d25b50 * 00001D37 benchspec/CPU2006/483.xalancbmk/src/xercesc/util/NetAccessors/WinSock/BinHTTPURLInputStream.hpp

```

# Note for GCC >= 15

The 436.cactusADM [contains a bug](https://stackoverflow.com/questions/25483031/storage-size-of-tzp-isn-t-known) that will cause compile errors in GCC 15 and later. You may need to apply the [patch](./patches/436.cactusADM.patch) to fixed.
