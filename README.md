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

- set SPEC_LITE env var to the path of this repo
``` shell
export SPEC_LITE=$(pwd)
```
- copy source
``` shell
make copy-all-src
```
- compile binarys
```
# '-j 29' means that 29 subitems are constructed at the same time
# 'SUBPROCESS_NUM' means how many threads are used in the construction of each individual subitem
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto" \
     SUBPROCESS_NUM=5 \
     build-all -j 29
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
# '-j 29' means that 29 subitems are constructed at the same time
# 'SUBPROCESS_NUM' means how many threads are used in the construction of each individual subitem
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto -march=rv64gcv_zvl128b_zba_zbb_zbc_zbs -ftree-vectorize  -mabi=lp64d -mrvv-max-lmul=m4 -mrvv-vector-bits=zvl" \
     SUBPROCESS_NUM=5 \
     build-all -j 29
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
# '-j 29' means that 29 subitems are constructed at the same time
# 'SUBPROCESS_NUM' means how many threads are used in the construction of each individual subitem
export RISCV=/riscv_toolchain/top
export LD_JEMALLOC=1
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto" \
     SUBPROCESS_BUM=5 \
     build-all -j 29
```

# Run with QEMU to difftest

use qemu-riscv64 to run the riscv compiled binarys, 
compare the output with speccpu reference output,
you can check the correctness of the compiled binarys.

use nix to install qemu or 
sudo apt install qemu-user-static.
```
nix-env -iA nixpkgs.qemu 
sudo apt install qemu-user-static  // ubuntu
```

qemu version should support riscv64 Bit extension

```shell
export ARCH=riscv64
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto" \
     SUBPROCESS_NUM=5 \
     build-all -j 29     // compile riscv version
make run-int-test   // use specint test input, qemu runs about 3mins
make run-fp-test    // use specfp test input, qemu runs about 15mins
```

if no error occurs, the compiled binarys are correct.

you can also compile x86 version and run the x86 compiled binarys native on your machine.

```shell
export ARCH=x86
make ARCH=x86 \
     OPTIMIZE="-O3 -flto" \
     SUBPROCESS_BUM=5 \
     build-all -j 29     // compile x86 version
make run-int-test   // use specint test input
make run-fp-test    // use specfp test input
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