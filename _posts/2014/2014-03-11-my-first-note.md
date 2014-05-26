---
layout: post
title: 第一个笔记
categories:
- Notes
tags:
- git
---

name | value
-----|-----
path | {{ page.path }}

## 程序

### 第一种方法

在 `_layouts/default.html` 添加 `prism.js` 或者 `highlight.js`

```language-c
void main(int argc, char* argv[])
{
    printf("Hello World!\n");
        
    return 0;
}
```


------

### 第二种方法
使用 `pygments`

 - 没有行号
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}


 - 添加行号

{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}


 - 添加行号 2 a

{% highlight tex linenos=table %}
\documentclass{article}

\usepackage{ctex}

\begin{document}

\end{document}
{% endhighlight %}





## 图片

### 来自网络
 ![](http://www.baidu.com/img/bdlogo.gif)
 
### 来自根目录
![](/images/github.png)




