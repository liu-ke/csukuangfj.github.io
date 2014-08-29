---
layout: post
title: 转载 全方位打造 Eclipse 自定义开发环境
useMath: [latex]
categories:
- 转载
tags:
- Eclipse
---

转自 <http://www.cnblogs.com/dabaopku/archive/2012/02/11/2346802.html>


## 前言

Eclipse 作为一款开源的跨平台的集成开发环境，本身就体现出了开源的强大优势和跨平台的可移植性。不仅有众多的开发人员为它开发了不计其数的插件，而且以它为模板进行二次开发的商业IDE也不在少数，比如 Myclipse，Wolfram Mathematica 的 WorkBench  等。同时，它也提供了几乎对所有语言的开发支持，从主流的 Java，C++，Python 到 及其非主流的 Linden Scripting Language，这种兼容并包的精神是闭源软件难以望其项背的。虽然说，专一的IDE会给特定项目的开发带来更加优秀的功能支持，比如 Visual Studio 配合上一些插件 在一定程度上 给用户带来的开发体验要远远优于CDT，但对于笔者经常跨平台工作、使用多种语言的开发者来说，也不得不含泪对Visual Studio 说 Goodbye，只得转战到 Eclipse 阵营中——Vim嘛，还达不到这么Geek的地步。。。

## 目标

Eclispse的CDT本身提供了自己的项目格式，.cproject，可以自己设定make方式，但终究在开发者和源代码之间建立了一个不太透明的隔阂，对于更加细致的编译要求也很难进行配置，因此笔者要放弃Eclipse的编译功能，使用 cmake  进行项目编译工作，Eclipse则从事除了编译以外的 代码编写、项目管理、源码控制等功能。通过本文，笔者将要展示如何通过Eclipse创建自定义编译环境，运行环境，调试环境，及自定义错误分析器，代码跳转等功能。

## 环境

Scientific Linux 6.1

Eclipse IDE for C/C++ Developers Indigo Service Release 1

cmake version 2.6-patch 4

gcc (GCC) 4.4.5 20110214 (Red Hat 4.4.5-6)

GNU Make 3.81

## 创建项目

创建一个c++项目，类型选 Makefile project - Empty Project - Other Toolchain，这个目的主要是为了让Eclipse尽量少的给我们的项目加额外的配置参数。

![](/images/2012021116512290.jpg)

现在得到一个完全空白的项目，我们给他添加 CMakeLists.txt ， main.cpp 和 build.sh 三个文件

为了方便编辑cmake文件，可以下载 [CmakeED[1] 插件，它可以提供代码高亮和提示功能。

我们先来写一段简单的 cmake 代码

    # config
    cmake_minimum_required(VERSION 1.0)
    PROJECT(HelloCMake)
     
    # working directory
    SET(PROJECT_BINARY_DIR ${PROJECT_SOURCE_DIR}/build)
    SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR})
     
    # source
    AUX_SOURCE_DIRECTORY(. src)
     
    # target
    ADD_EXECUTABLE(HelloCMake  ${src})


以及 c++ 程序

    #include <iostream>
    using namespace std;
     
    int main()
    {
        int sum=0;
        for(int i=0;i<100;++i)
        {
            sum+=i;
        }
        cout<<"Hello CMake!"<<endl
            <<"Sum is "<<sum<<endl;
    }

build.sh 负责编译我们的程序，你可下载 [ShellED[2] 来辅助编辑 shell script

我们的编译命令如下

    #! /bin/bash
     
    dir=build/HelloCMake_obj
     
    if [ ! -d  $dir ]; then
        mkdir -p $dir
    fi
     
    cd $dir
    cmake ../..
    make -j2

## 编译配置

 打开项目属性，在 C++ Build 选项页的 Builder Settings里，去掉 Use default build command，在 Build command 里输入 ${ProjDirPath}/build.sh

![](/images/2012021117341116.jpg)

 ok。

在build前要记着给 build.sh 加上 可执行 属性，chmod +x ~/develop/eclipse/HelloCMake/build.sh 

 然后build，之后输出窗口中就会显示出来我们的自定义build结果

![](/images/2012021117401812.jpg)

## 运行程序

我们的 可执行程序 并不是输出在正常目录里，因此 CDT 不会给我们生成自动的运行命令，我们需要自己设置；因为我们生成的甚至不一定是c++程序，因此使用自定义 Extern Tool 比自定义Run 更合适。

打开 Extern Tools Configuration，在 Progam 里新建一个命令，在 Location 里选择可执行程序命令，比如 ${workspace_loc:/HelloCMake/build/HelloCMake}。Work Directory是程序的启动路径，程序代码中使用 . 和 .. 进行路径查找时就是相对于这个目录；因此在 Visual Studio里开发程序有时会发现，在 vs 里运行程序没问题，但是进入程序文件夹运行程序出bug了，就是因为两种方式设置的 Work Directory不同。

最好把Build 选项卡里的 Build before lauch选项去掉；因为我们的程序现在已经不再局限在这一个项目中，而是以 WorkSpace作为参考系的，因此这个选项会导致编译整个WorkSpace，所以根据自己情况选择是否保留这个选项。

然后运行这个外部工具，就会看到我们的运行结果了。

## 错误分析器

我们给程序随便加点 bug，比如把 int sum 改成 int Sum，再编译程序就会出错了。因为在我们的build.sh 中，使用的都是标准工具，所以编译错误都被CDT直接识别出来了。在这点上，省却了我们不少麻烦。

打开项目属性，打开 C/C++ Build - Settings - Error Parsers，这里就是系统内嵌的标准分析器，它们的工作原理很简单，对 CDT console 的每一行输出进行正则表达式匹配，然后把匹配的组映射为文件、行、原因等参数，然后被 Probelm 接收。

如果我们的编译工具非主流，它的输出不符合上述分析器提供的功能，我们就没法根据输出定位错误位置了；这时，我们就可以自定义自己的 Error Parsers 来执行这项工作。

我们把程序改回去，而是给 CMakeLists 加点错误。

然后我们会得到类似的输出

![](/images/2012021118124357.jpg)

这里有一些 CMake 错误，但是分析器无法分析；我们就需要自己来实现。

首先这里有点局限，就是 CDT 的 Error Parsers 是基于行的，但是 CMake 的错误，每一条都是分成三行来提供的，这就很麻烦了，无法把它们合并成一条错误。

我们回到Error Parsers 界面，下面有个 WorkSpace Settings 链接，打开它，我们可以创建一个 CMake Parser

![](/images/2012021118170025.jpg)

然后，你可以仿造其他的parser，创建 cmake 输出的分析器，比如如下两个规则

![](/images/2012021119483419.jpg)

在项目属性里选择这个parser，然后重新生成，看看输出是不是变颜色了？同时，Problem里也有了信息

![](/images/2012021118230074.jpg)

其中前两个就是我们刚刚分析出来的，是不是很简单？美中不足就是无法把这两条合并，可惜啊。。。

## 代码跳转

这个本来是非常基本的功能，ctrl+click 可以跳转到类声明，打开头文件等，可以说是非常基本实用的功能，但是我们使用了自己的编译器后，上述功能就失效了，不如你点击 iostream，状态栏里居然说无法这个文件。这是怎么回事呢？

其实，代码跳转这个功能，是 Eclipse Indexer 系统的一个子功能，包括代码重构，符号搜索，都是在这个系统里的。我们在编译程序时，需要指定头文件、库文件的搜索路径，Indexer同样需要知道这些信息。

使用 CDT 的标准项目时，这两个路径通过同一个地方指定，因此说，项目能够编译链接成功，Indexer也就能把符号表建立起来了，也就拥有了代码跳转、重构等功能。我们虽然不需要使用 CDT 的编译功能，但是为了 Indexer，上述路径还是要指定的。

在 项目属性中，打开 C/C++ General - Paths and Symbols - Includes 选项卡里，添加常用路径

![](/images/2012021118375259.jpg)

然后再试试代码跳转功能，oh yeah！

 

## 最后的战役 - 调试

其实这已经很简单了，和配置 Extern Tools 类似，把 可执行程序，工作路径，源代码搜索路径配置好就ok了，只是要把程序编译成 Debug 版本，否则 gdb 无法加载符号表——在 CMakeLists 中加入 SET( CMAKE_BUILD_TYPE Debug ) 选项 就可以了

 

至此，我们就建立起了一个完善的自定义工具开发环境，是不是比原来自带的项目模板还顺手？更多功能，还是需要你自己亲自摸索吧～～


[1]: http://cmakeed.sourceforge.net/
[2]: http://sourceforge.net/projects/shelled/








