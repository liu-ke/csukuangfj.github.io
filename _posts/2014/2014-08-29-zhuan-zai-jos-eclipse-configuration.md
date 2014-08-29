---
layout: post
title: 转载 使用 Eclipse 打造 操作系统实习 JOS 开发环境
useMath: [latex]
categories:
- 转载
tags:
- Eclipse
---

转自 <http://www.cnblogs.com/dabaopku/archive/2012/02/17/2355749.html>

本文是 [全方位打造 Eclipse 自定义开发环境][1] 的延续，请先阅读这篇文章。

笔者非vim爱好者，也非emacs 拥趸，奈何记性不好，对文本开发环境一直感到怯懦，虽转战Linux阵营，依然对Visual Studio的开发环境念念不忘。幸而Eclipse的存在，经过简单的配置，倒也可以满足以往在Windows下的开发体验，是为记。

有了上篇文章的基础，再来配置 jos 的开发环境已经非常简单，部分操作就不再详加解释。

建立C++ MakeFile 项目（c项目也无所谓了，反正我们使用自定义的编译方式），选择工作目录为lab1，它提示说目录不为空也不需管它，直接Finish就OK。

之后就可以看到文件都加入了项目中。

![](/images/2012021714271896.jpg)

而且代码高亮，跳转功能就已具备，alt+/ 还可以代码补全（又要吐槽，难道就不能自动弹出么？非得alt+/）对于一些不能识别的库头文件，比如stdio.h，可以参考上篇文章加到项目搜索路径里面去；当然，本项目本来就是操作系统项目，又怎么会用别的库文件，因此这点工作倒可以省了。

 

接下来是配置编译环境，这个就非常简单了，因为我们只需要使用make一个命令就够了

甚至我们不需要设置build，只要编写一些extern tools就行了

比如评分， make grade，只需要按下图配置即可

![](/images/2012021714362070.jpg)

记得要把 build 选项卡的 build before launch 选项取消掉，因为你本来就没有配置build方法

然后运行这个extern tools，就可以看到输出

![](/images/2012021714382637.jpg)



 白璧微瑕的是，这个输出是非常普通的 “Teminal”输出，不是 c++ 的编译输出，因此，我们不能够用上篇博客中提到的 Error Parser 来帮助我们自动分析输出结果，比如得了多少分；你自然可以把这个Extern Tool 配置为项目的编译命令，这里就不赘述了。


下面是非常好用的，也是助教在文档中提到的，如何用 Git 进行版本管理。关于 git 的用法，可以参考这篇博客 [玩转git,让git成为个人工作备份利器(即使是电脑小白也推荐学习)][2]。

先在 Eclipse 里安装 egit 插件，然后就可以在 Window - Show View - Other 里 找到 Git Repositories 窗口，打开它，选褶从左数第三个按钮，可以导入一个现存的 git 版本库，选择项目所在文件夹，点击 search 即可。

![](/images/2012021714533272.jpg)

然后版本库就加入到你的 Eclipse 中了。

![](/images/2012021714540673.jpg)

然后你可以打开 Git Staging 窗口，点击 Working directory，就可以看到当前项目文件夹里发生了哪些变化。

至于git的更深入的用法，还是自己去研究吧，把 commit，pull和push记熟了就够了，也不一定要用patch来进行更新。

 

最后祝大家课程顺利，大家一起进步咯！

[1]: http://www.cnblogs.com/dabaopku/archive/2012/02/11/2346802.html
[2] : http://www.cnblogs.com/dabaopku/archive/2012/01/09/2316772.html
