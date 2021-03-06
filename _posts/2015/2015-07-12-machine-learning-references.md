---
layout: post
title: Machine Learning References
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- Machine Learning
---

## People
 - [Marc Toussaint][29]
 - [Aaron Hertzmann][27]

## Blogs
 - [Machine Learning Rumination][31]

## Probability and statistics
 - [**Introduction to STAT 414**][45]
 - [**Probability, Mathematical Statistics, Stochastic Processes**][46]
 - [ECO 21: Introduction to Econometrics][47]

## Lecture Notes
 - [Machine Learning lecture notes][26] by [Aaron Hertzmann][27]
 - [Pattern recogition, speech processing][30]
 - [BST 764 Applied Statistical Modeling for Medicine and Public Health][36]
 - [Max Welling's Classnotes in Machine Learning][37]
 - [Machine Learning CS5350/6350 Fall 2011][39]

## Kernal Tricks
 - [Lecture 15 - Kernel Methods][33], youtube videos or from the [course website][35]
 - [Lecture 16 - Radial Basis Functions][34], youtube videos, or 

### [Woodbury Identity][32]
`\[
(\mathbf{A}+\mathbf{J}^T \mathbf{B} \mathbf{J})^{-1} 
\mathbf{B} = \mathbf{A}^{-1} \mathbf{J}^T
(\mathbf{B}^{-1} + \mathbf{J} \mathbf{A}^{-1} \mathbf{J}^T)^{-1} 
\]`

`\[
 (\lambda  \mathbf{I}_k + \mathbf{X}^T \mathbf{X})^{-1} 
 \mathbf{X}^T \mathbf{y}
\]`


`\[
\mathbf{X} \in  \mathbb{R}^{n \times k }, \,\,
\mathbf{B} = \mathbf{I}_n,\,\,
\mathbf{A} = \lambda \mathbf{I}_k
\]`

`\[
 (\lambda  \mathbf{I}_k + \mathbf{X}^T \mathbf{X})^{-1} 
 \mathbf{X}^T \mathbf{y} =
 (\lambda  \mathbf{I}_k)^{-1} \mathbf{X}
 (\mathbf{I}_n + \mathbf{X} (\lambda \mathbf{I}_k)^{-1} \mathbf{X}^T)^{-1}
 \mathbf{y} = \mathbf{X}
 (\lambda \mathbf{I}_n + \mathbf{X}  \mathbf{X}^T)^{-1}
 \mathbf{y}
\]`



## Tutorials
 - [Statistical Data Mining Tutorials][6], **very good** !

## Gaussian Mixture Model
 - [Gaussian Mixture Models][43], a paper
 - [Maximum likelihood from incomplete data via the EM algorithm][44]

## kNN Tutorial
 - [Implement kNN using Julia][41], use Leave-One-Out-Fold-Cross-Validation (LOOF-CV) to determine k.
 - [Tutorial To Implement k-Nearest Neighbors in Python From Scratch][42]

## Tools
 - [Pattern Recognition Toolbox for MATLAB][20]
 - [BRMLtoolbox (matlab)][22], accompanied by a book, this toolbox is moving to Julia !

## Videos
 - [Embracing Uncertainty: The New Machine Intelligence][21], **Christopher M. Bishop**

## Pattern Recognition
 - [**Celebi Tutorial: Neural Networks and Pattern Recognition Using MATLAB**][24]
 - [Courses on Statistical Pattern Recognition][11], a list of courses
 - [CSE 802 - Pattern Recognition and Analysis][16], exercises, **programming practice**, data set
     - [**EE E6887 Statistical Pattern Recognition**][14], exercises and **SOLUTIONS**
     - [CSci 6966: Statistical and Learning Techniques for Computer Vision][18], exercises
     - [CISC 859 Pattern Recognition, Fall 2014][15], exercises, projects and useful links
     - [CS 551 Pattern Recognition][12]
     - [Introduction to Pattern Recognition][13], CS3555, exam papers !
     - [Engineering 8801/9881 Pattern Recognition, Spring 2006, MUN][17], exercises and past exam papers



## Machine Learning Courses
 - [Courses of Interest to the SLMC group][50], **University fo Edinburgh**
 - [PROBABILISTIC MODELLING AND REASONING][51], **University fo Edinburgh**
 - [**MACHINE LEARNING AND PATTERN RECOGNITION**][52], **University fo Edinburgh**
 - [CS229  Machine Learning  Autumn 2014][7], **Stanford**
 - [**Machine Learning CS 273A Fall 2011**][38]
 - [Machine Learning Fall 2007 10-701 and 15-781 Carlos Guestrin School of Computer Science, Carnegie Mellon University][8], **CMU**
 - [CS221: Artificial Intelligence: Principles and Techniques][9], **Stanford**
 - [Intro to Artificial Intelligence][10], online course, udacity
 - [STA561 COMPSCI571: Probabilistic Machine Learning: Fall 2014][19], many useful video links
 - [CS 277: Reference Texts on Data Mining and Machine Learning][23]

## Books
 - [**Bayesian Reasoning and Machine Learning**][53], available online, an **excellant** book
 - [The Gaussian Processes Web Site][1] contains many resources, including a book [Gaussian Processes for Machine Learning][2]
 - [Mathematics for Econometrics][4], chapter 5 introduces vector and matrix differentiation
 - [The Elements of Statistical Learning][5]

## Math Basics
 - [Matrix Differentiation][3], very basic!
 - [Linear Algebra Review and Reference][28], cs229
 


## SVM
 - [A training algorithm for optimal margin classifiers][25], 1992
 - [Machine Learning Software: Design and Practical Use][40]


[53]: http://web4.cs.ucl.ac.uk/staff/D.Barber/pmwiki/pmwiki.php?n=Brml.HomePage
[52]: http://www.inf.ed.ac.uk/teaching/courses/mlpr/
[51]: http://www.inf.ed.ac.uk/teaching/courses/pmr/
[50]: http://wcms.inf.ed.ac.uk/ipab/slmc/courses
[47]: http://www.stat.ucla.edu/~nchristo/introeconometrics/
[46]: http://www.math.uah.edu/stat/index.html
[45]: https://onlinecourses.science.psu.edu/stat414/node/287
[44]: http://web.mit.edu/6.435/www/Dempster77.pdf
[43]: https://www.ll.mit.edu/mission/cybersec/publications/publication-files/full_papers/0802_Reynolds_Biometrics-GMM.pdf
[42]: http://machinelearningmastery.com/tutorial-to-implement-k-nearest-neighbors-in-python-from-scratch/
[41]: https://www.kaggle.com/c/street-view-getting-started-with-julia/details/knn-tutorial
[40]: http://www.csie.ntu.edu.tw/~cjlin/talks/mlss_kyoto.pdf
[39]: http://www.cs.utah.edu/~piyush/teaching/cs5350.html
[38]: http://www.ics.uci.edu/~welling/teaching/ICS273Afall11/ICS273Afall11.html
[37]: http://www.ics.uci.edu/~welling/classnotes/classnotes.html
[36]: http://web.as.uky.edu/statistics/users/pbreheny/764-F11/notes.html
[35]: http://work.caltech.edu/lectures.html
[34]: https://www.youtube.com/watch?v=O8CfrnOPtLc
[33]: https://www.youtube.com/watch?v=XUj5JbQihlU&t=25m53s
[32]: https://ipvs.informatik.uni-stuttgart.de/mlr/marc/notes/gaussians.pdf
[31]: https://statinfer.wordpress.com/
[30]: http://psi.cse.tamu.edu/teaching/lecture_notes/
[29]: https://ipvs.informatik.uni-stuttgart.de/mlr/marc/
[28]: http://cs229.stanford.edu/section/cs229-linalg.pdf
[27]: http://www.dgp.toronto.edu/~hertzman/index.html
[26]: http://www.dgp.toronto.edu/~hertzman/411notes.pdf
[25]: http://w.svms.org/training/BOGV92.pdf
[24]: https://www.byclb.com/TR/Tutorials/neural_networks/
[23]: http://www.ics.uci.edu/~smyth/courses/cs277/data_mining_texts.xhtml
[22]: http://web4.cs.ucl.ac.uk/staff/D.Barber/pmwiki/pmwiki.php?n=Brml.Software
[21]: http://scpro.streamuk.com/uk/player/Default.aspx?wid=7739
[20]: https://github.com/covartech/PRT
[19]: https://stat.duke.edu/~sayan/561/
[18]: http://www.cs.rpi.edu/~stewart/sltcv/
[17]: http://www.engr.mun.ca/~charlesr/9881/index.html
[16]: http://www.cse.msu.edu/~rossarun/courses/sp15/cse802/index.html#details
[15]: http://research.cs.queensu.ca/~blostein/859.html
[14]: http://www.ee.columbia.edu/~sfchang/course/spr/
[13]: http://www.cedar.buffalo.edu/~srihari/CSE555/
[12]: http://www.cs.bilkent.edu.tr/~saksoy/courses/cs551/index.html
[11]: http://homepages.inf.ed.ac.uk/rbf/IAPR/researchers/PPRPAGES/pprcourses.htm
[10]: https://www.udacity.com/course/progress#!/c-cs271
[9]: http://web.stanford.edu/class/cs221/
[8]: http://www.cs.cmu.edu/~guestrin/Class/10701/schedule.html
[1]: http://www.gaussianprocess.org/
[2]: http://www.gaussianprocess.org/gpml/chapters/RW.pdf
[3]: http://www.atmos.washington.edu/~dennis/MatrixCalculus.pdf
[4]: http://pan.baidu.com/wap/shareview?&shareid=3544987238&uk=136268530&dir=%2F%E6%95%B0%E7%90%86%E7%BB%8F%E6%B5%8E%E5%AD%A6%E4%B8%8E%E8%AE%A1%E9%87%8F%E7%BB%8F%E6%B5%8E%E5%AD%A6&page=1&num=20&fsid=4014951445&third=0
[5]: http://statweb.stanford.edu/~tibs/ElemStatLearn/
[6]: http://www.autonlab.org/tutorials/
[7]: http://cs229.stanford.edu/