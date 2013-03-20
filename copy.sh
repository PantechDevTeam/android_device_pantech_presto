#!/bin/sh

CAMERA=../../../device/pantech/presto/camera
SERVICE=../../../device/pantech/presto/services
FRAMEWORK_AV=../../../frameworks/av
FRAMEWORK_BASE=../../../frameworks/base

for FILE in `ls $CAMERA/camera`; do
    cp $CAMERA/camera/$FILE $FRAMEWORK_AV/camera/$FILE
done

for FILE in `ls $CAMERA/include/camera`; do
    cp $CAMERA/include/camera/$FILE $FRAMEWORK_AV/include/camera/$FILE
done

for FILE in `ls $SERVICE/java/com/android/server`; do
    cp $SERVICE/java/com/android/server/$FILE $FRAMEWORK_BASE/services/java/com/android/server/$FILE
done
