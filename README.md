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
bash scripts/src_copy.sh
```
- compile binarys
```
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto" \
     build-all -j `nproc`
```

- init data
```
make init
```
- collect result
```
bash scripts/collect.sh gcc
```

The `gcc` can be any name, only used as a suffix in the filename to tag the result.

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
make ARCH=riscv64 \
     CROSS_COMPILE=riscv64-unknown-linux-gnu- \
     OPTIMIZE="-O3 -flto" \
     build-all -j `nproc`
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