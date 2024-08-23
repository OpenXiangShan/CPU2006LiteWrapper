let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
    sha256 = "sha256:1f5d2g1p6nfwycpmrnnmc2xmcszp804adp16knjvdkj8nz36y1fg";
  };
  pkgs = import nixpkgs {};
  riscv64Pkgs = pkgs.pkgsCross.riscv64;

  # Custom jemalloc with static libraries
  customJemalloc = riscv64Pkgs.jemalloc.overrideAttrs (oldAttrs: {
    configureFlags = (oldAttrs.configureFlags or []) ++ [
      "--enable-static"
      "--disable-shared"
    ];
    preBuild = ''
      # Add weak attribute to C++ operators, 作用和jemalloc_cpp.patch效果一样
      sed -i 's/void \*operator new(size_t)/void *operator new(size_t) __attribute__((weak))/g' src/jemalloc_cpp.cpp
      sed -i 's/void operator delete(void \*)/void operator delete(void *) __attribute__((weak))/g' src/jemalloc_cpp.cpp
    '';
    # Ensure static libraries are installed
    postInstall = ''
      ${oldAttrs.postInstall or ""}
      cp -v lib/libjemalloc.a $out/lib/
    '';
  });
in

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    file
    riscv64Pkgs.buildPackages.gcc
    riscv64Pkgs.buildPackages.binutils
  ];

  buildInputs = with riscv64Pkgs; [
    glibc
    glibc.static
    customJemalloc
  ];

  shellHook = ''
    echo "Cross-compilation environment for RISC-V 64-bit (GNU) Linux with jemalloc ready"
    echo "Use 'qemu-riscv64' to run the compiled program"

    export SPEC_LITE=$PWD
    export ARCH=riscv64
    export CROSS_COMPILE=riscv64-unknown-linux-gnu-
    export OPTIMIZE="-O3 -flto"
    export SUBPROCESS_NUM=5

    export CC=${riscv64Pkgs.stdenv.cc}/bin/riscv64-unknown-linux-gnu-gcc
    export CXX=${riscv64Pkgs.stdenv.cc}/bin/riscv64-unknown-linux-gnu-g++
    export LD=${riscv64Pkgs.stdenv.cc}/bin/riscv64-unknown-linux-gnu-ld

    export CFLAGS="$CFLAGS -static -Wno-format-security -I${customJemalloc}/include "
    export CXXFLAGS="$CXXFLAGS -static -Wno-format-security -I${customJemalloc}/include"
    export LDFLAGS="$LDFLAGS -static -ljemalloc -L${customJemalloc}/lib"
  '';
}