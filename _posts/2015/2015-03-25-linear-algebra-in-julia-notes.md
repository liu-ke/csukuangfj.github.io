---
layout: post
title: Linear Algebra in Julia
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- Julia
- Linear Algebra
- Math
---

<div tabindex="-1" id="notebook" class="border-box-sizing">
    <div class="container" id="notebook-container">

<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Linear-Algebra-in-Julia-(uncompleted)">Linear Algebra in Julia (uncompleted)<a class="anchor-link" href="#Linear-Algebra-in-Julia-(uncompleted)">&#182;</a></h2><p>created on 2015-03-24 by csukuangfj</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h1 id="Vectors">Vectors<a class="anchor-link" href="#Vectors">&#182;</a></h1>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[107]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-julia"><pre><span class="c"># row vector</span>
<span class="n">r1</span> <span class="o">=</span> <span class="p">[</span><span class="mi">1</span> <span class="mi">1</span> <span class="mi">1</span><span class="p">];</span> 

<span class="c"># column vector</span>
<span class="n">c1</span> <span class="o">=</span> <span class="p">[</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">3</span><span class="p">];</span>
<span class="n">c2</span> <span class="o">=</span> <span class="p">[</span><span class="mi">4</span><span class="p">;</span><span class="mi">5</span><span class="p">;</span><span class="mi">6</span><span class="p">];</span>
<span class="n">c3</span> <span class="o">=</span> <span class="p">[</span><span class="mi">1</span> <span class="mi">1</span> <span class="mi">1</span><span class="p">]</span><span class="o">&#39;</span><span class="p">;</span>

<span class="c"># norm</span>
<span class="n">norm</span><span class="p">(</span><span class="n">r1</span><span class="p">)</span>   <span class="c"># √3 ≈ 1.7320508075688772</span>

<span class="n">sqrt</span><span class="p">(</span><span class="n">sum</span><span class="p">(</span><span class="n">r1</span><span class="o">.^</span><span class="mi">2</span><span class="p">))</span>  <span class="c"># √3 ≈ 1.7320508075688772</span>


<span class="c"># inner product</span>
<span class="n">dot</span><span class="p">(</span><span class="n">c1</span><span class="p">,</span> <span class="n">c3</span><span class="p">)</span>   <span class="c"># scalar 6</span>

<span class="n">c1</span><span class="o">&#39;*</span><span class="n">c3</span>        <span class="c"># 1x1 array, [6]</span>

<span class="n">sum</span><span class="p">(</span><span class="n">c1</span><span class="o">.*</span><span class="n">c3</span><span class="p">)</span>  <span class="c"># 6</span>


<span class="c"># vector scalar multiplication</span>
<span class="mi">3</span><span class="n">c1</span>           <span class="c"># [3,6,9]</span>

<span class="c"># vector scalar addition</span>
<span class="n">c1</span> <span class="o">+</span> <span class="mi">3</span>        <span class="c"># [4,5,6]</span>

<span class="c"># vector addition, subtraction</span>
<span class="n">c1</span> <span class="o">+</span> <span class="mi">2</span><span class="n">c3</span>      <span class="c"># [3,4,5]</span>
<span class="n">c1</span> <span class="o">-</span> <span class="mi">2</span><span class="n">c3</span>      <span class="c"># [-1,0,-1]</span>

<span class="c"># vector vector elementwise multiplication</span>
<span class="n">c1</span> <span class="o">.*</span> <span class="n">c2</span>      <span class="c"># [4,10,18]</span>


<span class="c"># angle between vectors</span>
<span class="err">∠α</span> <span class="o">=</span> <span class="n">acosd</span><span class="p">(</span><span class="n">dot</span><span class="p">(</span><span class="n">c1</span><span class="p">,</span><span class="n">c3</span><span class="p">)</span> <span class="o">/</span> <span class="p">(</span><span class="n">norm</span><span class="p">(</span><span class="n">c1</span><span class="p">)</span> <span class="o">*</span> <span class="n">norm</span><span class="p">(</span><span class="n">c3</span><span class="p">)))</span>     <span class="c"># 22.20765429859646ᵒ</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area"><div class="prompt output_prompt">Out[107]:</div>


<div class="output_text output_subarea output_execute_result">
<pre>22.20765429859646</pre>
</div>

</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Matrix">Matrix<a class="anchor-link" href="#Matrix">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[108]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-julia"><pre><span class="n">a</span> <span class="o">=</span> <span class="p">[</span><span class="mi">1</span> <span class="mi">2</span><span class="p">;</span>
    <span class="mi">3</span> <span class="mi">4</span><span class="p">]</span>
<span class="n">println</span><span class="p">(</span><span class="n">a</span><span class="p">,</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span> <span class="c"># 2×2 matrix</span>
<span class="n">println</span><span class="p">(</span><span class="n">size</span><span class="p">(</span><span class="n">a</span><span class="p">),</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="c"># determinant</span>
<span class="n">d</span> <span class="o">=</span> <span class="n">det</span><span class="p">(</span><span class="n">a</span><span class="p">)</span>
<span class="n">println</span><span class="p">(</span><span class="n">d</span><span class="p">,</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">b</span> <span class="o">=</span> <span class="n">a</span><span class="p">;</span>
<span class="n">b</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span>  <span class="c"># 1</span>
<span class="n">b</span><span class="p">[</span><span class="mi">2</span><span class="p">]</span>  <span class="c"># 3, column major same as Matlab</span>
<span class="n">b</span><span class="p">[</span><span class="mi">3</span><span class="p">]</span>  <span class="c"># 2</span>
<span class="n">b</span><span class="p">[</span><span class="mi">4</span><span class="p">]</span>  <span class="c"># 4 </span>

<span class="n">b</span><span class="p">[</span><span class="mi">1</span><span class="p">]</span> <span class="o">=</span> <span class="mi">10</span><span class="p">;</span>

<span class="n">println</span><span class="p">(</span><span class="s">&quot;a1=</span><span class="si">$</span><span class="s">(a[1])&quot;</span><span class="p">,</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>  <span class="c"># a[1] == 10 ! julia use reference sematics !</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area"><div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>[1 2
 3 4]

(2,2)

-2.0

a1=10

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Special-Matrix">Special Matrix<a class="anchor-link" href="#Special-Matrix">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[109]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-julia"><pre><span class="n">i3</span> <span class="o">=</span> <span class="n">eye</span><span class="p">(</span><span class="mi">3</span><span class="p">)</span>        <span class="c"># identity matrix, size 3×3</span>
<span class="n">println</span><span class="p">(</span><span class="n">i3</span><span class="p">,</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">z3</span> <span class="o">=</span> <span class="n">zeros</span><span class="p">(</span><span class="mi">3</span><span class="p">)</span>      <span class="c"># zero matrix, size 3×1</span>
<span class="n">println</span><span class="p">(</span><span class="n">z3</span><span class="p">,</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">z33</span> <span class="o">=</span> <span class="n">zeros</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">)</span>    <span class="c"># zero matrix, size 3×3</span>
<span class="n">println</span><span class="p">(</span><span class="n">z33</span><span class="p">,</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>


<span class="n">a33</span> <span class="o">=</span> <span class="n">ones</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">)</span>     <span class="c"># all ones, size 3×3</span>
<span class="n">println</span><span class="p">(</span><span class="n">a33</span><span class="p">,</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">d</span> <span class="o">=</span> <span class="n">diagm</span><span class="p">([</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">3</span><span class="p">])</span>
<span class="n">println</span><span class="p">(</span><span class="n">d</span><span class="p">,</span><span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="c"># inverse</span>
<span class="n">d_inv</span> <span class="o">=</span> <span class="n">inv</span><span class="p">(</span><span class="n">d</span><span class="p">)</span>
<span class="n">println</span><span class="p">(</span><span class="n">d_inv</span><span class="p">,</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area"><div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>[1.0 0.0 0.0
 0.0 1.0 0.0
 0.0 0.0 1.0]

[0.0,0.0,0.0]

[0.0 0.0 0.0
 0.0 0.0 0.0
 0.0 0.0 0.0]

[1.0 1.0 1.0
 1.0 1.0 1.0
 1.0 1.0 1.0]

[1 0 0
 0 2 0
 0 0 3]

[1.0 0.0 0.0
 0.0 0.5 0.0
 0.0 0.0 0.3333333333333333]

</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Eigenvalues-and-Eigenvectors">Eigenvalues and Eigenvectors<a class="anchor-link" href="#Eigenvalues-and-Eigenvectors">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[3]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-julia"><pre><span class="n">A</span> <span class="o">=</span> <span class="p">[</span><span class="o">.</span><span class="mi">2</span> <span class="o">.</span><span class="mi">6</span>
    <span class="o">.</span><span class="mi">8</span> <span class="o">.</span><span class="mi">4</span><span class="p">]</span>
<span class="n">vals</span> <span class="o">=</span> <span class="n">eigvals</span><span class="p">(</span><span class="n">A</span><span class="p">)</span>
<span class="n">println</span><span class="p">(</span><span class="n">vals</span><span class="p">,</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>


<span class="n">F</span> <span class="o">=</span> <span class="n">eigfact</span><span class="p">(</span><span class="n">A</span><span class="p">)</span>  <span class="c"># get all eigen-values and corresponding eigen-vectors</span>
<span class="n">println</span><span class="p">(</span><span class="n">F</span><span class="p">,</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">eigen_values</span> <span class="o">=</span> <span class="n">F</span><span class="o">.</span><span class="n">values</span>
<span class="n">eigen_vectors</span> <span class="o">=</span> <span class="n">F</span><span class="o">.</span><span class="n">vectors</span>

<span class="n">println</span><span class="p">(</span><span class="n">det</span><span class="p">(</span><span class="n">eigen_vectors</span><span class="p">),</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">println</span><span class="p">(</span><span class="n">A</span><span class="o">*</span><span class="n">eigen_vectors</span> <span class="o">-</span> <span class="n">eigen_vectors</span> <span class="o">*</span> <span class="n">diagm</span><span class="p">(</span><span class="n">eigen_values</span><span class="p">),</span> <span class="s">&quot;</span><span class="se">\n</span><span class="s">&quot;</span><span class="p">)</span>

<span class="n">println</span><span class="p">(</span><span class="n">inv</span><span class="p">(</span><span class="n">eigen_vectors</span><span class="p">)</span><span class="o">*</span><span class="n">A</span><span class="o">*</span><span class="n">eigen_vectors</span><span class="p">)</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area"><div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>[-0.3999999999999999,1.0]

Eigen{Float64,Float64}([-0.3999999999999999,1.0],[-0.7071067811865475 -0.6000000000000001
 0.7071067811865476 -0.7999999999999999])

0.9899494936611666

[1.1102230246251565e-16 1.1102230246251565e-16
 0.0 -1.1102230246251565e-16]

[-0.4 -3.885780586188048e-16
 0.0 1.0]
</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Lineary-dependent">Lineary dependent<a class="anchor-link" href="#Lineary-dependent">&#182;</a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[111]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-julia"><pre><span class="c"># judge whether a set of vectors are linearly independent using Gram Schimdt</span>

<span class="k">function</span><span class="nf"> is_linearly_independent</span><span class="p">(</span><span class="n">v</span><span class="p">)</span>        
    <span class="n">n</span> <span class="o">=</span> <span class="n">length</span><span class="p">(</span><span class="n">v</span><span class="p">)</span>    
    <span class="n">epsilon</span> <span class="o">=</span> <span class="mf">1e-8</span><span class="p">;</span>
    <span class="n">qs</span> <span class="o">=</span> <span class="p">{};</span>
    <span class="k">for</span> <span class="n">i</span> <span class="k">in</span> <span class="mi">1</span><span class="p">:</span><span class="n">n</span>
        <span class="n">q_i</span> <span class="o">=</span> <span class="n">v</span><span class="p">[</span><span class="n">i</span><span class="p">]</span>            
        <span class="k">for</span> <span class="n">j</span> <span class="k">in</span> <span class="mi">1</span><span class="p">:</span><span class="n">length</span><span class="p">(</span><span class="n">qs</span><span class="p">)</span>
            <span class="n">q_i</span> <span class="o">=</span> <span class="n">q_i</span> <span class="o">-</span> <span class="n">dot</span><span class="p">(</span><span class="n">qs</span><span class="p">[</span><span class="n">j</span><span class="p">],</span> <span class="n">q_i</span><span class="p">)</span><span class="o">*</span><span class="n">qs</span><span class="p">[</span><span class="n">j</span><span class="p">];</span>
            <span class="k">if</span> <span class="n">norm</span><span class="p">(</span><span class="n">q_i</span><span class="p">)</span> <span class="o">&lt;</span> <span class="n">epsilon</span>
                <span class="n">println</span><span class="p">(</span><span class="s">&quot;Linearly dependent!&quot;</span><span class="p">);</span>
                <span class="k">return</span>
            <span class="k">end</span>
        <span class="k">end</span>
        <span class="n">q_i</span> <span class="o">=</span> <span class="n">q_i</span> <span class="o">/</span> <span class="n">norm</span><span class="p">(</span><span class="n">q_i</span><span class="p">);</span>
        <span class="n">push</span><span class="o">!</span><span class="p">(</span><span class="n">qs</span><span class="p">,</span><span class="n">q_i</span><span class="p">)</span>
    <span class="k">end</span>    
    <span class="n">println</span><span class="p">(</span><span class="s">&quot;Linearly independent!&quot;</span><span class="p">);</span>    
<span class="k">end</span>

<span class="n">a</span> <span class="o">=</span> <span class="mi">10</span><span class="o">*</span><span class="n">rand</span><span class="p">(</span><span class="mi">3</span><span class="p">,</span><span class="mi">3</span><span class="p">);</span>
<span class="n">is_linearly_independent</span><span class="p">({</span><span class="n">a</span><span class="p">[:,</span><span class="mi">1</span><span class="p">]</span> <span class="n">a</span><span class="p">[:,</span><span class="mi">2</span><span class="p">]</span> <span class="n">a</span><span class="p">[:,</span><span class="mi">3</span><span class="p">]})</span>

<span class="n">is_linearly_independent</span><span class="p">({[</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">]</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">]</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">]</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]})</span>

<span class="n">is_linearly_independent</span><span class="p">({[</span><span class="mi">1</span><span class="p">,</span><span class="o">-</span><span class="mf">1.1</span><span class="p">]</span> <span class="p">[</span><span class="o">-</span><span class="mf">2.8</span><span class="p">,</span><span class="o">-</span><span class="mf">0.3</span><span class="p">]</span> <span class="p">[</span><span class="o">-</span><span class="mf">0.4</span><span class="p">,</span><span class="mf">1.5</span><span class="p">]})</span>

<span class="n">is_linearly_independent</span><span class="p">({[</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">]</span> <span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">]})</span>

<span class="n">is_linearly_independent</span><span class="p">({[</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">0</span><span class="p">]</span> <span class="p">[</span><span class="o">-</span><span class="mi">2</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">3</span><span class="p">]</span> <span class="p">[</span><span class="mi">1</span><span class="p">,</span><span class="mi">0</span><span class="p">,</span><span class="mi">2</span><span class="p">]})</span>
</pre></div>

</div>
</div>
</div>

<div class="output_wrapper">
<div class="output">


<div class="output_area"><div class="prompt"></div>
<div class="output_subarea output_stream output_stdout output_text">
<pre>Linearly independent!
Linearly dependent!
Linearly dependent!
Linearly independent!
Linearly independent!
</pre>
</div>
</div>

</div>
</div>

</div>
<div class="cell border-box-sizing text_cell rendered">
<div class="prompt input_prompt">
</div>
<div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="References">References<a class="anchor-link" href="#References">&#182;</a></h2><p><a href="http://stanford.edu/class/ee103/julia_files/gramschmidt.jl">http://stanford.edu/class/ee103/julia_files/gramschmidt.jl</a></p>
<p><a href="http://quant-econ.net/jl/linear_algebra.html">http://quant-econ.net/jl/linear_algebra.html</a></p>

</div>
</div>
</div>
<div class="cell border-box-sizing code_cell rendered">
<div class="input">
<div class="prompt input_prompt">In&nbsp;[112]:</div>
<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-julia"><pre><span class="c"># to be continued</span>
</pre></div>

</div>
</div>
</div>

</div>
    </div>
  </div>