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


## Mac OS X
 - /System/Library/Frameworks/OpenCL.framework
 - `gcc -o foo foo.c -framework OpenCL`
 - for linux, use `-lOpenCL`


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
