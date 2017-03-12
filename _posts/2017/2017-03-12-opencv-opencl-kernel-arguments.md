---
layout: post
title:  Notes on the kernel argument passing rules of OpenCL wrappers in OpenCV 3.x
categories:
- Notes
tags:
- c/c++
- programming
- OpenCV
- OpenCL
---

There are some Flags defined as enum inside `KernelArg`:
<script src="https://gist.github.com/csukuangfj/9417c6aa2adb8e20b21505ef96869804.js"></script>

If we have an object `Mat mat` and want to pass it to the OpenCL kernel, the prototype of the kernel depends on the enums defined above and the dimension of the `Mat`. Currently, it supports only 2-d and 3-d `Mat`.

Now let us look some examples:
<script src="https://gist.github.com/csukuangfj/d32b2685bf25fcae06957bad5d53ad20.js"></script>

One of the biggest advantage of using `ocl::KernelArg` is that we do not need to
create a `cl_mem`.

You can, of course, create an object of `cl_mem` and call the method of `ocl::Kernel`: `int set(int i, const void* value, size_t sz);` directly.

### References
 `int Kernel::set(int i, const KernelArg& arg)` in [ocl.cpp](https://github.com/opencv/opencv/blob/master/modules/core/src/ocl.cpp#L3366)