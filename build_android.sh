#!/bin/bash - 
#===============================================================================
#
#          FILE: build_android.sh
# 
#         USAGE: ./build_android.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/07/2015 23:03
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

rm -r build_armeabi-v7a;
mkdir build_armeabi-v7a;
pushd build_armeabi-v7a
export ANDROID_STANDALONE_TOOLCHAIN="/ficusstorage1/softwares/android/ndk-toolchain/"
cmake -DCMAKE_TOOLCHAIN_FILE=../platforms/android/android.toolchain.cmake -DANDROID_ABI="armeabi-v7a with NEON" -DANDROID_TOOLCHAIN_NAME=standalone -DWITH_CUFFT=OFF -DWITH_CUDA=OFF -DWITH_TIFF=NO -DWITH_JASPER=OFF -DWITH_OPENEXR=NO -DWITH_EIGEN=OFF  -DCMAKE_BUILD_TYPE=RELEASE -DWITH_OPENMP=ON  -DBUILD_opencv_gpu=OFF -DBUILD_opencv_androidcamera=OFF -DANDROID_STL_FORCE_FEATURES=ON ..
make -j100
popd

rm -r build_arm64-v8a;
mkdir build_arm64-v8a;
pushd build_arm64-v8a
export ANDROID_STANDALONE_TOOLCHAIN="/ficusstorage1/softwares/android/ndk-toolchain64/"
cmake -DCMAKE_TOOLCHAIN_FILE=../platforms/android/android.toolchain.cmake -DANDROID_ABI="arm64-v8a" -DANDROID_TOOLCHAIN_NAME="standalone" -DWITH_CUFFT=OFF -DWITH_CUDA=OFF -DWITH_TIFF=NO -DWITH_JASPER=OFF -DWITH_OPENEXR=NO -DWITH_EIGEN=OFF  -DCMAKE_BUILD_TYPE=RELEASE -DWITH_OPENMP=ON  -DBUILD_opencv_gpu=OFF -DBUILD_opencv_androidcamera=OFF -DANDROID_STL_FORCE_FEATURES=ON ..
make -j100
popd
