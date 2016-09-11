---
layout: post
title: GPU references
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- CUDA
- GPU
- OpenCL
---

# References
 - [KEPLER - THE WORLD'S FASTEST, MOST EFFICIENT HPC ARCHITECTURE][4]
 - [Fermi compute whitepaper][1]
 - [GTX 400 Graphics Architecture White Paper][2]
 - [GTX 400 Architecture][3]

 - paper: [NVIDIA Tesla: A unified graphics and computing architecture][5]
 - paper: [Fermi GF100 GPU architecture][6]
 - paper: [Demystifying GPU microarchitecture through microbenchmarking][7]

# OpenCL
 - [OpencCL hello world][11] with c in various OS
 - [list of specificiations][8]
 - [different version for cl.hpp][9]
 - [OpenCL API 1.0 Quick Reference Card][10]
 - [An Introduction to OpenCL C++][16]. OpenCL C++ (a subset of C++ 14) support is introduced
since version 2.1 (Nov. 16, 2015)
 - [**The OpenCL C++ Wrapper API**][17], wrapper for OpenCL C API, support OpenCL version 1.2 or below


## khronos
 - [OpenCL Resources][18]

## Mac OS X
 - /System/Library/Frameworks/OpenCL.framework
 - `gcc -o foo foo.c -framework OpenCL`
 - for linux, use `-lOpenCL`


## OpenCL sdk
 - [Intel SDK for OpenCL Applications][12]
 - [AMD APP SDK][13], AMD OpenCL Accelerated Parallel Processing (APP)
 - [NVIDIA OpenCL SDK][14], see also [CUDA Code Samples][15]

## Tutorials
 - [Tutorial: Simple start with OpenCL and C++][19], which uses OpenCL C++ wrapper
to compute the sum of two vectors.

## OpenCL data type
 - [a stripped-down subset of cl.h and cl_platform.h, for BOINC][20]
 - all of the following are just **pointers** !
```
typedef struct _cl_platform_id *    cl_platform_id;
typedef struct _cl_device_id *      cl_device_id;
typedef struct _cl_context *        cl_context;
typedef struct _cl_command_queue *  cl_command_queue;
typedef struct _cl_mem *            cl_mem;
typedef struct _cl_program *        cl_program;
typedef struct _cl_kernel *         cl_kernel;
typedef struct _cl_event *          cl_event;
typedef struct _cl_sampler *        cl_sampler;
```


[20]: http://boinc.berkeley.edu/android-boinc/boinc/lib/cl_boinc.h
[19]: http://simpleopencl.blogspot.de/2013/06/tutorial-simple-start-with-opencl-and-c.html
[18]: https://www.khronos.org/opencl/resources
[17]: https://www.khronos.org/registry/cl/specs/opencl-cplusplus-1.2.pdf
[16]: https://www.khronos.org/assets/uploads/developers/resources/Intro-to-OpenCL-C++-Whitepaper-May15.pdf
[15]: https://developer.nvidia.com/cuda-code-samples
[14]: https://developer.nvidia.com/opencl
[13]: http://developer.amd.com/tools-and-sdks/opencl-zone/amd-accelerated-parallel-processing-app-sdk/
[12]: https://software.intel.com/en-us/intel-opencl
[11]: https://www.fixstars.com/en/opencl/book/OpenCLProgrammingBook/first-opencl-program/
[10]: https://www.khronos.org/files/opencl-quick-reference-card.pdf
[9]: https://www.khronos.org/registry/cl/api/1.2/cl.hpp
[8]: https://www.khronos.org/registry/cl/specs/
[7]: http://www.stuffedcow.net/files/gpuarch-ispass2010.pdf
[6]: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.210.5301&rep=rep1&type=pdf
[5]: http://people.cs.umass.edu/~emery/classes/cmpsci691st/readings/Arch/gpu.pdf
[4]: http://www.nvidia.com/object/nvidia-kepler.html
[3]: http://www.nvidia.com/object/GTX_400_architecture.html
[2]: http://www.nvidia.com/object/IO_89569.html
[1]: http://www.nvidia.com/object/IO_89570.html
