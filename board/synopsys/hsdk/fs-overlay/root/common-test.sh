#!/bin/sh

HSDK_CPUS_ONLINE=0
HSDK_CPUS_ONLINE=`getconf _NPROCESSORS_ONLN`
if [[ "$HSDK_CPUS_ONLINE" -eq 4 ]]; then
	echo ' > HSDK_CPU_ONLINE_OK'
else
	echo ' > HSDK_CPU_ONLINE_FAIL   (only '"$HSDK_CPUS_ONLINE"' online)'
fi

mkdir -p /mnt/mmc1/ttt && mount /dev/mmcblk0p1 /mnt/mmc1/ttt && md5sum /mnt/sda1/ttt/test-file && umount /dev/mmcblk0p1
if [ $? -ne 0 ]; then
	echo ' > HSDK_TEST_MMC_FAIL'
else
	echo ' > HSDK_TEST_MMC_OK'
fi

mkdir -p /mnt/sda1/ttt && mount /dev/sda1 /mnt/sda1/ttt && md5sum /mnt/sda1/ttt/test-file && umount /dev/sda1
if [ $? -ne 0 ]; then
	echo ' > HSDK_TEST_USB1_FAIL'
else
	echo ' > HSDK_TEST_USB1_OK'
fi

mkdir -p /mnt/sdb1/ttt && mount /dev/sdb1 /mnt/sdb1/ttt && md5sum /mnt/sdb1/ttt/test-file && umount /dev/sdb1
if [ $? -ne 0 ]; then
	echo ' > HSDK_TEST_USB2_FAIL'
else
	echo ' > HSDK_TEST_USB2_OK'
fi

dmesg | grep "rsi_91x: Operating mode"
if [ $? -ne 0 ]; then
	echo ' > HSDK_TEST_SDIO_WIFI_FAIL'
else
	echo ' > HSDK_TEST_SDIO_WIFI_OK'
fi
