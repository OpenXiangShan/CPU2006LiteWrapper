let
  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
    sha256 = "sha256:1f5d2g1p6nfwycpmrnnmc2xmcszp804adp16knjvdkj8nz36y1fg";
  };
  pkgs = import nixpkgs {};
  riscv64Pkgs = pkgs.pkgsCross.riscv64;
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
  ];

  shellHook = ''
    echo "Cross-compilation environment for RISC-V 64-bit (GNU) Linux ready"
    echo "Use 'qemu-riscv64' to run the compiled program"

    export SPEC_LITE=$PWD
    export ARCH=riscv64
    export CROSS_COMPILE=riscv64-unknown-linux-gnu-
    export OPTIMIZE="-O3 -flto"
    export SUBPROCESS_NUM=5

    export CC=${riscv64Pkgs.stdenv.cc}/bin/riscv64-unknown-linux-gnu-gcc
    export CXX=${riscv64Pkgs.stdenv.cc}/bin/riscv64-unknown-linux-gnu-g++
    export LD=${riscv64Pkgs.stdenv.cc}/bin/riscv64-unknown-linux-gnu-ld

    export CFLAGS="$CFLAGS -static -Wno-format-security"
    export CXXFLAGS="$CXXFLAGS -static -Wno-format-security"
    export LDFLAGS="$LDFLAGS -static"
  '';
}