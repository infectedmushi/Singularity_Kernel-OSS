#!/bin/bash
export KERNEL_DIR="/home/deepongi/Android/Singularity_Kernel"
export KBUILD_OUTPUT="/home/deepongi/Android/Singularity_Kernel/out"
export ZIP_DIR="/home/deepongi/Android/AnyKernel3"
export ZIP_OUT_DIR="/home/deepongi/Android/Out_Zips"
#make O=out mrproper
#rm -rf out
export PATH="/mnt/Hawai/toolchains/proton-clang-16/bin:$PATH"
export USE_CCACHE=1
export ARCH=arm64
export VARIANT="singularity-r09"
export HASH=`git rev-parse --short=4 HEAD`
export KERNEL_ZIP="$VARIANT-$HASH"
export LOCALVERSION="~singularity-r09"
make O=$KBUILD_OUTPUT CC=clang  LLVM=1 LLVM_IAS=1 evo_defconfig
make -j64 O=$KBUILD_OUTPUT CC=clang AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip LLVM=1 LLVM_IAS=1 CROSS_COMPILE=/mnt/Hawai/toolchains/gcc-linaro-13.0.0-2022.11-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- CROSS_COMPILE_ARM32=/mnt/Hawai/toolchains/gcc-linaro-13.0.0-2022.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
cp -v $KBUILD_OUTPUT/arch/arm64/boot/Image $ZIP_DIR/Image
cd $ZIP_DIR
zip -r9 $VARIANT-$HASH.zip *
mv -v $VARIANT-$HASH.zip $ZIP_OUT_DIR/
echo -e "${green}"
echo "-------------------"
echo "Build Completed"
echo "-------------------"
echo -e "${restore}"
echo "                                                     "
echo "  _       __        _          _     _      _        "
echo " (_)_ _  / _|___ __| |_ ___ __| |___| |__ _| |__ ___ "
echo " | | ' \|  _/ -_) _|  _/ -_) _  |___| / _  | '_ (_-< "
echo " |_|_||_|_| \___\__|\__\___\__,_|   |_\__,_|_.__/__/ "
echo "                                                     "
echo "                                                     "
                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
