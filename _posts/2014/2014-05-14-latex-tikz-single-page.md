---
layout: post
title: Tikz pgf 单页环境 图片单独存放
categories:
- Notes
tags:
- latex
- tikz
---

## 方法1:
```latex
\documentclass{article}
\usepackage[pdftex,active,tightpage]{preview}
%\setlength\PreviewBorder{2mm} % use to add a border around the image
\usepackage{tikz}
\begin{document}
\begin{preview}
\begin{tikzpicture}
    \shade (0,0) circle(2); % background
    \draw (0,0) circle(2);  % rim
    \draw (.75,1) circle(.5);   % right eye
    \fill (.66,.9) circle(.25); % right pupil
    \draw (-.75,1) circle(.5);  % left eye
    \fill (-.66,.9) circle(.25);% left pupil
    \fill (.2,0) circle (.1);   % right nostril
    \fill (-.2,0) circle (.1);  % left nostril
    \draw (-135:1) arc (-135:-45:1) -- cycle; % mouth
  \end{tikzpicture}
\end{preview}
\end{document}
```
然后直接用 pdflatex filename.tex 即可.  
这种方法可以调节图片的 margin

## 方法2
首先，把 tikz 代码单独放一个文件中，代码如下
```latex
\documentclass{standalone}
\usepackage{tikz} 
%include other needed packages here   
\begin{document}

\begin{tikzpicture}
% include your tikz code here
\end{tikzpicture}

\end{document}
```
这种方法现在不会调节图片的空白距离。使用这种方法的好处是可以直接在引用这个图片的文件中使用 input 包含即可。

然后在文件中包含这个图片，代码如下:
```latex
\documentclass{article} % or whatever class you are using

\usepackage{standalone} % 要添加这两个 package
\usepackage{tikz}

% All other packages required
\begin{document}
% Text text text
% somewhere where you want the tikz picture
\begin{figure}[!h]
\centering
\input{mytikzfig.tex} % 假设待插入tikz 代码文件名为 mytikzfig.tex
\caption{  }
\end{figure}

% Text text text
\end{document}
```




