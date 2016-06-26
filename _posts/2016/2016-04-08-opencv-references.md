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

##  Installation on ubuntu 15.10
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
 
 - add environment variables to run configurations: `DYLD_LIBRARY_PATH`, whose value is `${DYLD_LIBRARY_PATH}:/Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib/lib`
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
 
## Minimum cmake file

```
cmake_minimum_required(VERSION 2.8)
project( BlurImage )
find_package( OpenCV )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( BlurImage BlurImage.cpp )
target_link_libraries( BlurImage ${OpenCV_LIBS} )
```

## My cmake file
```
cmake_minimum_required(VERSION 3.5)
project(linear_algebra)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/build")

set(SOURCE_FILES src/main.cpp)

# set the environment variable OpenCV_DIR in .bash_profile
# set (OpenCV_DIR /Users/fangjun/software/opencv/3.1.0/mac-os-opencv-install-sharedLib

find_package( OpenCV REQUIRED)
include_directories( ${OpenCV_INCLUDE_DIRS} )

include_directories( ./inc )

# for eigen
# include_directories( /Users/fangjun/software/eigen/eigen )

add_executable(linear_algebra ${SOURCE_FILES})
target_link_libraries( linear_algebra ${OpenCV_LIBS} )
```

## Tutorials
 - [Introduction to OpenCV-Python Tutorials][2]
 - [Mat(rix) object (Image Container)][3]
 - [Creating Mat Objects][4]
 - [Using OpenCV with gcc and CMake][16], a very small example demonstrating the usage of CMake with OpenCV
 - [Introduction to OpenCV][17]
 - [Load and Display an Image][18] contains very detailed explanation!
 - [Load, Modify, and Save an Image][19], convert a RGB color image to a gray scale image.
 - [Writing documentation for OpenCV][20]
 - [Mat - The Basic Image Container][21]
 - [**How to scan images, lookup tables and time measurement with OpenCV**][22] list three methods to iterate pixels of an image.
Example source code can be found inside `samples/cpp/tutorial_code/core/how_to_scan_images`
 - [**Mask operations on matrices**][23], Example source code can be found 
inside `samples/cpp/tutorial_code/core/mat_mask_operations/mat_mask_operations.cpp`. 2-D filtering with a customised 
kernel.
 - [**Operations with images**][24]
 - [Adding (blending) two images using OpenCV][25]
 - [Changing the contrast and brightness of an image!][26]
 - [Basic Drawing][27]
 - [Discrete Fourier Transform][28], source code example can be found inside 
`samples/cpp/tutorial_code/core/discrete_fourier_transform/discrete_fourier_transform.cpp`
 
## Color order
 - It is `BGR` !!! 
 
## OpenCV source repository
 - [CMakeLists.txt][7] example
 - [display image][8]


## OpenCV classes
 - [OpenCV modules][15]
 - [Basic structures][13]
 - [cv::Point_< _Tp > Class Template Reference][9]
 - [cv::Size_< _Tp > Class Template Reference][10]
 - [cv::Rect_< _Tp > Class Template Reference][11]
 - [cv::Mat Class Reference][12]
 - [cv::Vec< _Tp, cn > Class Template Reference][14]

## OpenCV with Qt
- [OpenCV with Qt][29]


## Courses
 - [Assignment for course CS 512 COMPUTER VISION (FALL 2015)][34] @ lllinois Institute of Technology
 - [CS485/685: Computer Vision (Spring 2012)][30]
 - [16423 – Designing Computer Vision Apps][32] @ CMU



## People
 - [Vadim Pisarevsky][31]
 

## Companies
 - [http://itseez.com][33]



[34]: http://www.cs.iit.edu/~agam/cs512/#assignments
[33]: http://itseez.com
[32]: http://16423.courses.cs.cmu.edu
[31]: https://www.linkedin.com/in/vadim-pisarevsky-308a9a25
[30]: http://www.cse.unr.edu/~bebis/CS485/
[29]: https://wiki.qt.io/OpenCV_with_Qt
[28]: http://docs.opencv.org/3.1.0/d8/d01/tutorial_discrete_fourier_transform.html#gsc.tab=0
[27]: http://docs.opencv.org/3.1.0/d3/d96/tutorial_basic_geometric_drawing.html#gsc.tab=0
[26]: http://docs.opencv.org/3.1.0/d3/dc1/tutorial_basic_linear_transform.html#gsc.tab=0
[25]: http://docs.opencv.org/3.1.0/d5/dc4/tutorial_adding_images.html#gsc.tab=0
[24]: http://docs.opencv.org/3.1.0/d5/d98/tutorial_mat_operations.html#gsc.tab=0
[23]: http://docs.opencv.org/3.1.0/d7/d37/tutorial_mat_mask_operations.html#gsc.tab=0
[22]: http://docs.opencv.org/3.1.0/db/da5/tutorial_how_to_scan_images.html#gsc.tab=0
[21]: http://docs.opencv.org/3.1.0/d6/d6d/tutorial_mat_the_basic_image_container.html#gsc.tab=0
[20]: http://docs.opencv.org/3.1.0/d4/db1/tutorial_documentation.html#gsc.tab=0
[19]: http://docs.opencv.org/3.1.0/db/d64/tutorial_load_save_image.html#gsc.tab=0
[18]: http://docs.opencv.org/3.1.0/db/deb/tutorial_display_image.html#gsc.tab=0
[17]: http://docs.opencv.org/3.1.0/df/d65/tutorial_table_of_content_introduction.html#gsc.tab=0
[16]: http://docs.opencv.org/3.1.0/db/df5/tutorial_linux_gcc_cmake.html#gsc.tab=0
[15]: http://docs.opencv.org/3.1.0/#gsc.tab=0
[14]: http://docs.opencv.org/3.1.0/d6/dcf/classcv_1_1Vec.html#gsc.tab=0
[13]: http://docs.opencv.org/3.1.0/dc/d84/group__core__basic.html#ga346f563897249351a34549137c8532a0&gsc.tab=0
[12]: http://docs.opencv.org/3.1.0/d3/d63/classcv_1_1Mat.html#gsc.tab=0
[11]: http://docs.opencv.org/3.1.0/d2/d44/classcv_1_1Rect__.html#afb53dd5c7f9a57ecb3d50d62d2d6dd14&gsc.tab=0
[10]: http://docs.opencv.org/3.1.0/d6/d50/classcv_1_1Size__.html#gsc.tab=0
[9]: http://docs.opencv.org/3.1.0/db/d4e/classcv_1_1Point__.html#details
[8]: https://github.com/Itseez/opencv/blob/master/samples/cpp/tutorial_code/introduction/display_image/display_image.cpp
[7]: https://github.com/Itseez/opencv/blob/master/samples/cpp/example_cmake/CMakeLists.txt
[6]: http://blogs.wcode.org/2014/11/howto-setup-xcode-6-1-to-work-with-opencv-libraries/
[5]: http://blogs.wcode.org/2014/10/howto-install-build-and-use-opencv-macosx-10-10/
[4]: http://www.bogotobogo.com/OpenCV/opencv_3_tutorial_creating_mat_objects.php
[3]: http://www.bogotobogo.com/OpenCV/opencv_3_tutorial_mat_object_image_matrix_image_container.php
[2]: http://opencv-python-tutroals.readthedocs.org/en/latest/py_tutorials/py_setup/py_intro/py_intro.html#intro
[1]: https://github.com/BVLC/caffe/wiki/Ubuntu-15.10-OpenCV-3.1-Installation-Guide