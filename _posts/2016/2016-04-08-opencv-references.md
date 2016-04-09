---
layout: post
title: OpenCV references
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- Computer vision
- Image processing
- OpenCV
---

## Installation
 - Refer to [Ubuntu 15.10 OpenCV 3.1 Installation Guide][1]
 - [HOWTO: Install, Build and Use openCV (MacOSX 10.10)][5]

##  installation on ubuntu 15.10
 - first shutdown vm and exit virtual box, then on mac os x, run
 
```
VBoxManage setextradata ubuntu-15.10 VBoxInternal2/SharedFoldersEnableSymlinksCreate/shared 1
```

 where `ubuntu-15.10` is the name of the virtual machine and `shared` is the name of the shared folder
 
 - then install dependencies:
 
```
sudo apt-get -qq remove ffmpeg x264 libx264-dev
sudo apt-get install --assume-yes libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip 
```

 - download `opencv-3.1.0.zip` and unzip it into directory `~/shared/software/opencv/3.1.0/opencv-3.1.0`
```
cd ~/shared/software/opencv/3.1.0/opencv-3.1.0
cd ..
~/shared/software/opencv/3.1.0$ mkdir opencv-3.1.0-kfj-build
~/shared/software/opencv/3.1.0$ mkdir opencv-3.1.0-kfj-installation
cd opencv-3.1.0-kfj-build/
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/home/fangjun/shared/software/opencv/3.1.0/opencv-3.1.0-kfj-installation -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ../opencv-3.1.0
make
make install
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/media/sf_shared/software/opencv/3.1.0/opencv-3.1.0-kfj-installation/lib
export PYTHONPATH=${PYTHONPATH}:/media/sf_shared/software/opencv/3.1.0/opencv-3.1.0-kfj-installation/lib/python2.7/dist-packages
ldconfig
```

 - to test:
 
```
python
import cv2
print cv2.__version__ # should print 3.1.0
```    
    
## Installation on Mac OS X 10.11
 - first download and unzip opencv-3.1.0
 - install cmake (download .dmg file from official website and move it to Applications folder, then add `/Applications/CMake.app/Contents/bin` to PATH) 
 - run cmake (just click the icon, or run cmake-gui from command line)
 - then follow [HOWTO: Install, Build and Use openCV (MacOSX 10.10)][5]

## configuration for xcode
 - other link flags: `-lopencv_calib3d -lopencv_core -lopencv_features2d -lopencv_flann -lopencv_highgui -lopencv_imgcodecs -lopencv_imgproc -lopencv_ml -lopencv_objdetect -lopencv_photo -lopencv_shape -lopencv_stitching -lopencv_superres -lopencv_ts -lopencv_video -lopencv_videoio -lopencv_videostab
`
 - add search path for header files and libraries
 
 - add environment variables to run configurations: `DYLD_LIBRARY_PATH`, which value `${DYLD_LIBRARY_PATH}:/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib/lib`
 - xcode preference--locations tab---advanced, choose legacy
 - refer to [HOWTO: Setup XCode 6.1 to work with OpenCV3 libraries][6]
 
## Environment variables (.bash_profile) 
```
export PATH=${PATH}:/Applications/CMake.app/Contents/bin

# static lib
# export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-staticLib/lib

# shared lib
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib/lib

# shared lib
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib/include

# for cmake
export OpenCV_DIR=/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib
```
 
## Tutorials
 - [Introduction to OpenCV-Python Tutorials][2]
 - [Mat(rix) object (Image Container)][3]
 - [Creating Mat Objects][4]


[6]: http://blogs.wcode.org/2014/11/howto-setup-xcode-6-1-to-work-with-opencv-libraries/
[5]: http://blogs.wcode.org/2014/10/howto-install-build-and-use-opencv-macosx-10-10/
[4]: http://www.bogotobogo.com/OpenCV/opencv_3_tutorial_creating_mat_objects.php
[3]: http://www.bogotobogo.com/OpenCV/opencv_3_tutorial_mat_object_image_matrix_image_container.php
[2]: http://opencv-python-tutroals.readthedocs.org/en/latest/py_tutorials/py_setup/py_intro/py_intro.html#intro
[1]: https://github.com/BVLC/caffe/wiki/Ubuntu-15.10-OpenCV-3.1-Installation-Guide