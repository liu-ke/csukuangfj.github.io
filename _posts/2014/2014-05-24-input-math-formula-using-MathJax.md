---
layout: post
title: 使用 MathJax 输入数学公式
useMath: [latex]
categories:
- Notes
tags:
- math
- MathJax
---

## 参考资料
 - [LaTeX Math Magic][1], 源代码参考[这里][3], github repostiory 在[这里][6]
 - [MathJax in Markdown][2],源代码参考[这里][4]
 - [MathJax Getting Started][5]
 - [Port MathJax support from gollum to jekyll #199][7]


## 输入方法
 - 
 - inline 公式: `\(` `formula` `\)`, 如 `\(\LaTeX\)`, `\(a^2+b^2=c^2\)`
 - 行间公式: `$$` `formula` `$$` 或 `\[` `formula` `\]`

## 配置
在 `default.html` 的 `head` 里输入如下代码：



{% highlight javascript %}
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script>
    MathJax.Hub.Config({
        tex2jax: {
            skipTags: ['script', 'noscript', 'style', 'textarea', 'pre']
        }
    });
    MathJax.Hub.Queue(function() {
        // Fix <code> tags after MathJax finishes running. This is a
        // hack to overcome a shortcoming of Markdown. Discussion at
        // https://github.com/mojombo/jekyll/issues/199
        var all = MathJax.Hub.getAllJax(), i;
        for(i = 0; i < all.length; i += 1) {
            all[i].SourceElement().parentNode.className += ' has-jax';
        }
    });
</script>
{% endhighlight %}



## 输入数学公式
#### The Lorentz Equations

`$$
\begin{aligned}
\dot{x} & = \sigma(y-x) \\
\dot{y} & = \rho x - y - xz \\
\dot{z} & = -\beta z + xy
\end{aligned}
$$`

#### The Cauchy-Schwarz Inequality

`\[
\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)
\]`

#### A Cross Product Formula

`\[
\mathbf{V}_1 \times \mathbf{V}_2 =  \begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\
\frac{\partial X}{\partial u} &  \frac{\partial Y}{\partial u} & 0 \\
\frac{\partial X}{\partial v} &  \frac{\partial Y}{\partial v} & 0
\end{vmatrix}
\]`

#### The probability of getting k heads when flipping n coins is

`\[
P(E)   = {n \choose k} p^k (1-p)^{ n-k}
\]`

#### An Identity of Ramanujan

`\[
\frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =
1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
{1+\frac{e^{-8\pi}} {1+\ldots} } } }
\]`

#### A Rogers-Ramanujan Identity

`\[
1 +  \frac{q^2}{(1-q)}+\frac{q^6}{(1-q)(1-q^2)}+\cdots =
\prod_{j=0}^{\infty}\frac{1}{(1-q^{5j+2})(1-q^{5j+3})},
\quad\quad \text{for $|q|<1$}.
\]`

#### Maxwell's Equations

`\[
\begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\   \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0 \end{aligned}
\]`




[1]: http://cwoebker.com/posts/latex-math-magic
[2]: http://doswa.com/2011/07/20/mathjax-in-markdown.html
[3]: https://raw.githubusercontent.com/cwoebker/.com/master/_posts/2011-10-27-latex-math-magic.markdown
[4]: https://github.com/stygstra/stygstra.github.com/blob/master/_layouts/default.html
[5]: http://docs.mathjax.org/en/latest/start.html#mathjax-cdn
[6]: https://github.com/cwoebker/.com
[7]: https://github.com/jekyll/jekyll/issues/199
