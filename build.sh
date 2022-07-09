#!/bin/bash

set -e
runtime=clang-aarch64

pacman -S --needed p7zip wget autoconf automake make mingw-w64-${runtime}-toolchain mingw-w64-${runtime}-brotli mingw-w64-${runtime}-pcre

wget https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/v2.28.0.tar.gz -O mbedtls-2.28.0.tar.gz
tar -xf mbedtls-2.28.0.tar.gz
cd mbedtls-2.28.0
export WINDOWS_BUILD=1
make no_test 
MBEDTLS=${PWD}/../mbedtls
make install DESTDIR=${MBEDTLS}
cd ..

wget https://www.silvester.org.uk/privoxy/Sources/3.0.33%20%28stable%29/privoxy-3.0.33-stable-src.tar.gz
tar -xf privoxy-3.0.33-stable-src.tar.gz

cd privoxy-3.0.33-stable
autoheader
autoconf
CPPFLAGS="-I ${MBEDTLS}/include" LDFLAGS="-L ${MBEDTLS}/lib" ./configure --enable-mingw32 --enable-zlib --enable-static-linking --disable-pthread -with-brotli --with-mbedtls
sed -i 's/-F pe-i386/ /g' GNUmakefile
sed -i 's/DWINVER=0x501/DWINVER=0x0A00/g' GNUmakefile
make

wget https://www.silvester.org.uk/privoxy/Windows/3.0.33%20%28stable%29/privoxy_3.0.33.zip
7z x privoxy_3.0.33.zip
cp privoxy.exe privoxy_3.0.33
7z a -mx9 privoxy_3.0.33-WinARM64.7z privoxy_3.0.33
mv privoxy_3.0.33-windows.7z ..
