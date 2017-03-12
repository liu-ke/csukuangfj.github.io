---
layout: post
title:  First example of using OpenCL in OpenCV
categories:
- Notes
tags:
- c/c++
- programming
- OpenCV
- OpenCL
---

The following code is a minimal example showing how to create a context inside OpenCV 3.x.

{% highlight c linenos=table %}
#include <iostream>
#include <opencv2/core/ocl.hpp>

int main()
{
  cv::ocl::Context ctx;
  ctx.create(cv::ocl::Device::TYPE_CPU);
  std::cout << ctx.ndevices() << std::endl;

  std::cout << (ctx.create() ? "true":"false") << std::endl;

  return 0;
}
// output:
//1
//false
{% endhighlight %}

### References
 - ocl.hpp: <https://github.com/opencv/opencv/blob/master/modules/core/include/opencv2/core/ocl.hpp>
 - ocl.cpp: <https://github.com/opencv/opencv/blob/master/modules/core/src/ocl.cpp>
