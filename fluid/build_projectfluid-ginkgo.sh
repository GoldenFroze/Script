#!/bin/bash

## Project Fluid
## https://github.com/Project-Fluid/manifest.git -b fluid-11
export ROMNAME=fluid
export ROMGIT="https://github.com/Project-Fluid/manifest.git -b fluid-11"
echo ""
echo ""
echo ""
echo ""
echo ""
make clean

if [[ ! -f "$SOURCEFILE" ]]
then 
repo init -u $ROMGIT
repo sync -j$(nproc --ignore=8)
. ginkgo-clone_sources.sh
echo "SYNC OF ROM AND DEVICE SOURCES COMPLETED!"
echo "Matching device source to ROM.  Beginning file alterations"
sed -i "s|vendor/arrow/config|vendor/$ROMNAME/config|" device/xiaomi/ginkgo/arrow_ginkgo.mk
sed -i "s|arrow_ginkgo|$ROMNAME\_ginkgo|" device/xiaomi/ginkgo/arrow_ginkgo.mk
sed -i "s|arrow_|$ROMNAME\_|" device/xiaomi/ginkgo/AndroidProducts.mk
cp device/xiaomi/ginkgo/arrow.dependencies device/xiaomi/ginkgo/$ROMNAME.dependencies
cp device/xiaomi/ginkgo/arrow_ginkgo.mk device/xiaomi/ginkgo/$ROMNAME\_ginkgo.mk
sleep 2
echo ""
echo ""
echo ""
echo "Beginning build proccess..."
sleep 1
echo ""
echo "..."
sleep 1
## Build Section after sources downloaded and fixed
. build/envsetup.sh
#eval $($BUILDCOMMAND | tee /dev/tty)
lunch $ROMNAME\_ginkgo-eng
make $ROMNAME -j$(nproc --ignore=6)
echo ""
echo " Rom Should Be Built"
echo ""
echo " ENTER TO CONTINUE"
echo ""
## Build section that runs if source already downloaded
else
source build/envsetup.sh
#eval $($BUILDCOMMAND | tee /dev/tty)
lunch $ROMNAME\_ginkgo-eng
make $ROMNAME -j$(nproc --ignore=6) | tee /dev/tty
echo ""
echo " Rom Should Be Built"
echo ""
echo " ENTER TO CONTINUE"
echo ""
fi