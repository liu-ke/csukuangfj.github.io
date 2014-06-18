---
layout: post
title: 转载 几种常用窗函数
useMath: [latex]
categories:
- 转载
tags:
- DSP
---

转自 <http://jiangshuxia.9.blog.163.com/blog/static/34875860201132710190742/>

# 几种常用窗函数  

设计 FIR DF 时,窗函数不仅可以影响过渡带宽度，还能影响肩峰和波动的大小,因此,  
选择窗函数应使其频谱：  
(1)主瓣宽度尽量小，以使过渡带尽量陡。  
(2)旁瓣相对于主瓣越小越好，这样可使肩峰和波动减小，即能量尽可能集中于主瓣内。  

 对于窗函数，这两个要求是相互矛盾的，要根据需要进行折衷的选择，为了定量地比较
各种窗函数的性能，给出三个频域指标： 

(1)3db 带宽 B ，单位为几种常用窗函数 ![](/images/1.gif)（最大可能的频率分辨力）

(2)最大旁瓣峰值 A(dB) ， A 越小，由旁瓣引起的谱失真越小

(3)旁瓣谱峰渐进衰减速度 D （ dB/oct ） 

一个理想的窗口，应该有最小的 B 、 A 及最大的 D 。 

![](/images/2.gif)

## 1. 基本窗

### （1）矩形窗 

![](/images/3.gif)

![](/images/4.gif)

 在 Matlab 中，实现矩形窗的函数为 w=boxcar(n) 。 
 
![](/images/5.gif)

### (2)三角窗（或巴特利特 Bartlett 窗）  

由于矩形窗从 0 到 1 （或 1 到 0 ）有一个突变的过渡带，这造成了吉布斯现象。  
Bartlett 提出了一种逐渐过渡的三角窗形式，它是两个矩形窗的卷积。 

![](/images/6.gif)

![](/images/7.gif)

 在Matlab中，函数bartlett(n)和 triang(n)用来计算相似的三角窗,但它们有两个重
要的区别： bartlett 函数返回的序列两端总是 0 ，因此，对于奇数 n ，语句 bartlett(n+2) 的中间部分等于 triang(n) ；对于偶数 n ， bartlett 仍然是两个矩形序列的卷积，但 n 为偶数时的三角窗没有标准定义。

### (3) 余弦窗 

![](/images/8.gif)

![](/images/9.gif)

## 2、升余弦窗

汉宁窗、汉明窗、布莱克曼窗都是升余弦窗的特例, 它们都是频率为 \(0 - \frac{2\pi}{(N-1)} \) 和
4π/(N-1) 的余弦序列的组合。

\[
w(n) = A - B \cos (n) + C \cos (2n)
\]

其中 A 、 B 、 C 为常数。升余弦窗的频率特性比矩形窗有很大改善。  
当 A = 0.5 ， B=0.5 ， C=0 时，为汉宁 (Hanning) 窗。 Matlab 中， w = hanning(n)  
当 A = 0.54 ， B=0.46 ， C=0 时，为汉明窗。 Matlab 中， w = hamming(n)  
当 A = 0.42 ， B=0.5 ， C=0.08 时，为布莱克曼窗。 Matlab 中， w = blackman(n)   


###（1）汉宁（Hanning）窗 —— 升余弦窗 

![](/images/10.gif)

![](/images/11.gif)

### (2)汉明（ Hamming ）窗——改进的升余弦窗 

![](/images/12.gif)

![](/images/13.gif)

### (3)布莱克曼（ Blackman ）窗——二阶升余弦窗 

![](/images/14.gif)

![](/images/15.gif)

 比较以上窗函数，可以看到，矩形窗函数具有最窄的主瓣B，但也有最大的边瓣峰值 A
和最慢的衰减速度 D。  
汉宁Hanning窗的主瓣稍宽，但有着较小的旁瓣和较大的衰减速度，因而被认为是较好
的窗口。 

## 3、凯瑟（Kaiser）窗 

 上面讨论的几种窗函数都是以牺牲一定的主瓣宽度为代价，来获得某种程度的旁瓣抑制，而 Kaiser 窗全面反映了这种主瓣和旁瓣衰减之间的交换关系，它定义了一组可调的由零阶贝塞尔 Bessel 函数构成的窗函数，通过调整参数β可以在主瓣宽度和旁瓣衰减之间自由选择它们的比重。对于某一长度的 Kaiser 窗，给定β，则旁瓣高度也就固定了。Kaiser 窗函数由 J.F. Kaiser 提出，由下是给出： 

![](/images/16.gif)

其中 I0 是修正过的零阶贝塞尔 Bessel 函数，β是用来调整窗形状的参数，β依赖于参数 N ，选择 N 可产生各种过渡带和接近最优的阻带衰减。

 对于相同的N， Kaiser 窗可以提供不同的过渡带宽，这是其他窗函数做不到的。例如如果β = 5.658 ，则过渡带宽等于 7.8pi/N ，最小阻带衰减为 60dB ，如下图所示。 
 
![](/images/17.gif)



下面是β 分别取 1 、 10 、 20 等不同值时，几个长为 50 的 Kaiser 窗。 

![](/images/18.gif)

 从图中可以看出，参数β 选得越大，其频谱的旁瓣越小，但主瓣宽度也相应地增加，因
从图中可以看出，参数β 选得越大，其频谱的旁瓣越小，但主瓣宽度也相应地增加，因
下面固定β，当窗的长度变化时，相应的旁瓣的高度保持不变。 

![](/images/19.jpg)

 由于Bessel函数的复杂性，这种窗的设计公式很难推导，为此，Kaiser 开发了经验公
式。

给定 wp、ws、 Rp 和 As ，参数β定义如下： 

![](/images/19.gif)

对于过渡带宽 △w = ws - wp (rad/s) ，滤波器阶数为 

![](/images/20.gif)

阶数为 N 的滤波器大致能满足要求，但最后的结构还必须要演算以便证明这一点。

在 Matlab 中，函数 w = kaiser(n, beta) 实现 Kaiser 窗。 

## 4、切比雪夫（Chebyshev）窗 

 在给定旁瓣高度下，Chebyshev窗的主瓣宽度最小，具有等波动性，也就是说，其所有
的旁瓣都具有相等的高度。  
在 Matlab 中，函数 w=chebwin(n,r)以窗长度和旁瓣高度为参数计算切比雪夫窗。
Chebyshev 仅对奇数长度的窗有定义，若 n 为偶数，函数 w = chebwin(n,r) 先将它加 1 ，然后设计长为 n+1 的切比雪夫窗。  
其傅立叶变换的旁瓣幅度低于主瓣 r dB 。 

![](/images/21.gif)

此外，还有Papoulis窗、Parzen窗、Poisson窗、Cauchy窗、 Gaussian窗、Bartlett-Hann、Blackman-Harris 、 Nuttall's Blackman-Harris 、 Bohman 、 Flat Top window 、 Hann 、 Parzen (de la Valle-Poussin ) 、 Tapered cosine 等。
Matlab 窗设计和分析工具 (WinTool) 具有 GUI 界面，可以用来设计和分析窗函数，

其用法：
>> wintool 