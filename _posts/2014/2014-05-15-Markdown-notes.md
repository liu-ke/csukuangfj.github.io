---
layout: post
title: Markdown笔记
categories:
- Notes
tags:
- Markdown
---

## 参考资料
- 网页 <http://www.markdowntutorial.com/>
- 网页 [stackedit](https://stackedit.io/ "这个网页有例子！")
- Markdown 语法说明 (简体中文版) <http://wowubuntu.com/markdown/>
- 献给写作者的 Markdown 新手指南 <http://jianshu.io/p/q81RER>


## 程序
### 插入一般代码

```C
void main(int argc, char* argv[])
{
    printf("Hello World!\n");
        
    return 0;
}
```
### 插入 HTML 代码

    <h1>
        <center>HTML 笔记</center>
    </h1>

上面采用的是直接 TAB 缩进，可以不用倒引号。最后加上，方便以后用 CSS 修饰。

## 插入图片
### 来自网络
 ![](http://www.baidu.com/img/bdlogo.gif)
 
### 来自根目录
![鼠标](/images/csu.png)

## 字体

斜体用下划线 `_italic_`输出为 _italic_ 。
粗体用两个星号，如 `**bold**` 输出为 **bold** 。

粗体和斜体可以嵌套，如 `**_bold and italic_**` 输出为 **_bold and italic_** 。

`~~删除线~~` 显示为 ~~删除线~~ 

输入\*号\*

<font color="red">红色字体</font>

上标: <font>4<sup>th</sup></font>  
下标: <font>CO<sub>2</sub></font>   
删除线: <del>delete</del>, 也可以用 <s>delete</s>  
下划线: <ins>underline</ins>