#!/bin/sh

CM_DIR=../../../
FRAMEWORK_AV=../../../frameworks/av
FRAMEWORK_BASE=../../../frameworks/base
HARDWARE=../../../hardware
PATCH_DIR=device/pantech/presto/patchs

## patch CameraParameters.cpp
cd $CM_DIR
patch -p0 -i $PATCH_DIR/camera_1.patch
## patch CameraParameters.h
patch -p0 -i $PATCH_DIR/camera_2.patch
## Patch PowerManagerService.java
patch -p0 -i $PATCH_DIR/proximity.patch
## Patch libhardware_legacy
patch -p0 -i $PATCH_DIR/libhardware.patch
