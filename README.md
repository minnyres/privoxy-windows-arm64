# privoxy-windows-arm64

[Privoxy](https://www.privoxy.org/) for Windows on ARM32/ARM64, built with LLVM/MinGW toolchain.

Please go to [releases](https://github.com/minnyres/privoxy-woa/releases) for the latest binaries.

## How to build

It can be natively built on ARM Windows systems that support x64 emulation.

1. Install [MSYS2-64bit](https://www.msys2.org/).
2. Enable and open the Clang ARM64 environment in MSYS2, following https://github.com/msys2/MSYS2-packages/issues/1787#issuecomment-980837586.
3. Run the build script `./build.sh`
