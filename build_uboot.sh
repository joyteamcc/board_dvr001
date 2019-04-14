
cd `dirname $0`

THISDIR=`pwd`
UBOOTDIR="$THISDIR/../u-boot-2010.06"

mkdir -p $THISDIR/out

cd $UBOOTDIR
make ARCH=arm CROSS_COMPILE=arm-hisiv300-linux- hi3520dv300_config || exit 1
make -j`nproc` ARCH=arm CROSS_COMPILE=arm-hisiv300-linux- || exit 2

cp u-boot.bin $THISDIR/out/u-boot.bin

cd $THISDIR/uboot_tools
cp ../out/u-boot.bin ./
./mkboot.sh reg_info_hi3520dv300_400M_512MB_16bit_800M_250M.bin ../out/u-boot-hi3520dv300.bin
rm u-boot.bin

