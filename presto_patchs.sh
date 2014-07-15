#!/bin/sh

CM_DIR=../../../
PATCH_DIR=device/pantech/presto/patchs

cd $CM_DIR

while getopts ":ar" option;
do
    case $option in
        a)
            ## patch CameraParameters
            patch -p1 < $PATCH_DIR/cameraparameters.patch
            ## Patch PowerManagerService.java
            patch -p1 < $PATCH_DIR/proximity_sensor.patch
            ## Patch libhardware_legacy
            patch -p1 < $PATCH_DIR/custom_wific.patch
	        ## Add bcm4329 driver
            patch -p1 < $PATCH_DIR/bcm4329.patch
	        ## Patch wpa_supplicant_8
            patch -p1 < $PATCH_DIR/wpa_supplicant_8.patch
            ;;
        r)
            ## patch CameraParameters
            patch -Rp1 < $PATCH_DIR/cameraparameters.patch
            ## Patch PowerManagerService.java
            patch -Rp1 < $PATCH_DIR/proximity_sensor.patch
            ## Patch libhardware_legacy
            patch -Rp1 < $PATCH_DIR/custom_wific.patch
            ## Remove bcm4329 driver
            patch -Rp1 < $PATCH_DIR/bcm4329.patch
	        ## Patch wpa_supplicant_8
            patch -Rp1 < $PATCH_DIR/wpa_supplicant_8.patch
            ;;
        *)
            echo "invalid option -$OPTARG" 
            ;;
    esac
done
