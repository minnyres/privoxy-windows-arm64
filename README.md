# privoxy-windows-arm64

[Privoxy](https://www.privoxy.org/) for Windows on ARM32/ARM64, built with LLVM/MinGW toolchain.

Please go to [releases](https://github.com/minnyres/privoxy-woa/releases) for the latest binaries.

## How to build

The Windows ARM64 build is compiled by LLVM/MinGW toolchain, which can work on Linux, Windows x64 and Windows ARM64. We are using GitHub actions to build on Linux and the build scripts are given in the [workflow file](https://github.com/minnyres/privoxy-windows-arm64/blob/main/.github/workflows/release.yml).

You can also try the following steps to make a native build on Windows 11 ARM64 with MSYS2.

1. Install [MSYS2-64bit](https://www.msys2.org/).
2. Enable and open the Clang ARM64 environment in MSYS2, following https://github.com/msys2/MSYS2-packages/issues/1787#issuecomment-980837586.
3. Run the build script `./build.sh`
