#! /bin/bash

git clone https://github.com/ArrowOS-Devices/android_device_xiaomi_ginkgo.git -b arrow-11.0 device/xiaomi/ginkgo &&
git clone https://github.com/ArrowOS-Devices/android_vendor_xiaomi_ginkgo.git -b arrow-11.0 vendor/xiaomi/ginkgo &&
git clone https://github.com/ArrowOS-Devices/android_vendor_miuicamera.git -b arrow-11.0-a3 vendor/miuicamera &&
git clone https://github.com/ArrowOS-Devices/android_kernel_xiaomi_ginkgo.git -b arrow-11.0 kernel/xiaomi/ginkgo