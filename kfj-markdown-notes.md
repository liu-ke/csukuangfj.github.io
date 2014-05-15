<head>
    <title>HTML Tutorial Example</title>
</head>



<h1>
    <center>HTML 笔记</center>
</h1>

<font color="red">红色字体</font>

上标: 4<sup>th</sup>  
下标: CO<sub>2</sub>  
删除线: <del>delete</del>, 也可以用 <s>delete</s>  
下划线: <ins>underline</ins>

点击链接发送邮件：
<a href="mailto:csukuangfj@126.com">Contact me</a>

<p>
    注释: <!-- additional content --> 要放在 html 标记里面！
</p>

<h1>
    <center>以下为 Markdown notes</center>
</h1>

参考网页 http://www.markdowntutorial.com/

可以参考网页 [stackedit](https://stackedit.io/ "这个网页有例子！")

参考 Markdown 语法说明 (简体中文版) http://wowubuntu.com/markdown/

参考 献给写作者的 Markdown 新手指南 http://jianshu.io/p/q81RER



### 简单的输入网址和邮箱

<www.baidu.com>
<xxx@xxx.com>

### 字体

斜体用下划线 `_italic_`输出为 _italic_ 。
粗体用两个星号，如 `**bold**` 输出为 **bold** 。

粗体和斜体可以嵌套，如 `**_bold and italic_**` 输出为 **_bold and italic_** 。

`~~删除线~~` 显示为 ~~删除线~~ 

输入\*号\*

### 标题
总共有 6 级标题，几级标题，前面就有几个 #

### 链接
 - inline link: 格式为`[]()`,中括号里写链接内容，小括号里写链接地址。
   如 `[跳到百度](http://www.baidu.com)`输出[跳到百度](http://www.baidu.com)。可以把 **百度** 加粗。也可以在标题
   中使用链接
 - reference link: 若文中有多个地方用到同一个链接，可以用这种方法，如果要改变链接地址的话，只用改变一次就可以了。

> 第一个链接名字为 `[链接1][first link]`, 第二个链接名字为 `[链接2][second link]`。
> 然后回到 `[第一个链接][first link]`
>
> `[first link]: http://www.baidu.com`
>
> `[second link]: http://www.google.com`

第一个链接名字为 [链接1][first link], 第二个链接名字为 [链接2][second link]。
然后回到 [第一个链接][first link]

  [first link]: http://www.baidu.com
  [second link]: http://www.google.com

注意：上面的方括号前面最多缩进三个空格。方括号冒号后面至少加一个空格
  
链接可以加文字，如 `[百度](http://www.baidu.com "点我去百度")` 输出 [百度](http://www.baidu.com "点我去百度")

或者

    [百度][baidu]
    
    [baidu]: http://www.baidu.com "点我去百度"
    
输出

[百度][baidu]
    
[baidu]: http://www.baidu.com "点我去百度"    

上面的 点我去百度 可以用双引号，单引号或小括号括起来。


### 图片
格式语插入链接一样，只是前面多了个个 `!`, 格式为 `![]()`, 中括号里填写一些文字内容，当图片加载不成功时，就会在显示图片的地方显示这个文字。

例子为  `![百度图标](http://www.baidu.com/img/bdlogo.gif)` 显示为 ![百度图标](http://www.baidu.com/img/bdlogo.gif) 。百度图标几个子可以省略。

使用 **reference link** 插入图片：

>  `![The first father][First Father]`
>
> `![The second first father][Second Father]`
>
> [First Father]: https://sourceforge.net/images/icon_linux.gif
>
> [Second Father]:    https://sourceforge.net/images/icon_linux.gif
>
> 输出

![The first father][First Father]
![The second first father][Second Father]

[First Father]: https://sourceforge.net/images/icon_linux.gif

[Second Father]:    https://sourceforge.net/images/icon_linux.gif

### 引用
如果引用的文字只有一段，那么可以只在开头加一个 `>`即可，用回车结束引用。
如果引用的文字有好几段，那么在每一段前面加`>`，并且空白行也要加`>`。

可以在引用里修改字体，添加链接。

### 列表
#### 无序列表
每一行的前面加 `*` 或 `-`

* first level
  * first level 1
  * first level 2
* second level
  * second level 1
c  * second level 2
  
#### 有序列表
每一行以数字开头，数字后跟一个原点。

1. first.
2. second.

##### 列表里的段落
- 第一段
    
    bla bla，前面有四个或四个以上的空格

- 第二段    



### 段落
若不想用回车显式输入一个空白行，可以在每行的最后输入**两个空格**，再输入回车。

### 表格

表格1

a11 | a12 | a13
----|-----|---
red | green| blue  sky


---------

表格2

Item      | Value
--------- | -----
Computer  | 1600 USD
Phone     | 12 USD
Pipe      | 1 USD

默认是居中对其

---------------

表格3

| Item      |    Value | Qty  |
| :----- | --------:| :--: |
| Computer  | 1600 USD |  5   |
| Phone     |   12 USD |  12  |
| Pipe      |    1 USD | 234  |

可以通过`:` 选则冒号可以选择居左，居中和居右对其


若想使用 html 的表格，去网址 http://pressbin.com/tools/excel_to_html_table/index.html 转换

### 程序

```c
void main(int argc, char* argv[])
{
    printf("Hello World!\n");
        
    return 0;
}
```

