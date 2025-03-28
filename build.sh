#!/bin/bash

echo "CONFIG_LOCALVERSION=\"$LOCALVERSION\"" >> arch/arm64/configs/$DEVICEDEFCONFIG
echo "Set CONFIG_LOCALVERSION to: $LOCALVERSION"

make clean
make mrproper
make ARCH=arm64 O=out $DEVICEDEFCONFIG

CROSS_COMPILE: "aarch64-linux-gnu-"
CROSS_COMPILE_ARM32: "arm-linux-gnueabi-"
CROSS_COMPILE_COMPAT: "arm-linux-gnueabi-"
CLANG_TRIPLE: "aarch64-linux-gnu-"

KBUILD_BUILD_USER="リアム"
KBUILD_BUILD_HOST="@belowzeroiq"

# Build Kernel
make \
  ARCH=arm64 \
  LLVM=1 \
  LTO=thin \
  CC=clang \
  AR=llvm-ar \
  AS=llvm-as \
  NM=llvm-nm \
  OBJCOPY=llvm-objcopy \
  OBJDUMP=llvm-objdump \
  STRIP=llvm-strip \
  KBUILD_BUILD_USER="$KBUILD_BUILD_USER" \
  KBUILD_BUILD_HOST="$KBUILD_BUILD_HOST" \
  -j$(nproc --all)
