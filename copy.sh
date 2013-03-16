#!/bin/sh

CAMERA=../../../device/pantech/presto/camera
FRAMEWORK_AV=../../../frameworks/av
for FILE in `ls $CAMERA/camera`; do
    cp $CAMERA/camera/$FILE $FRAMEWORK_AV/camera/$FILE
done

for FILE in `ls $CAMERA/include/camera`; do
    cp $CAMERA/include/camera/$FILE $FRAMEWORK_AV/include/camera/$FILE
done

