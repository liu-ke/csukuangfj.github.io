---
layout: post
title: Programming Languages References
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- Programming
---

## Persons
 - [Eric S. Raymond's Home Page][10]
 - [Scott Meyers][53], writes a lot of tutorials and books
 - [Bruce Eckel][57]

## Assembly
 - [**Professional Assembly Language**][1], Richard Blum (see cloud disk)
 - [x86 Disassembly][8] Exploring the relationship between C, x86 Assembly, and Machine Code, and HTML format [wiki-book][9]

## C/C++
 - [Books by Bjarne Stroustrup][33], his personal homepage
 - [An Overview of the C++ Programming Language][34] by Bjarne Stroustrup
 - [The C Programming Language][2], K&R, Kernighan, Ritchie
 - [The development of the C language][31]<-webpage, or =--[pdf][32]
 - [Advanced Programming in the UNIX Environment (2nd Edition)][3]
 - [My collection of C and C++ funny programs][5]
 - [The Lost Art of C Structure Packing][11]
 - A Guide to Undefined Behavior in C and C++ [Part 1][12], [Part 2][13], [Part 3][14]
 - [Time, Clock, and Calendar Programming In C][15]
 - [Writing Efficient C and C Code Optimization][16]
 - [Real-time and Embedded Software Design][17]
 - [Optimization of Computer Programs in C][18]
 - [Harvey notes on C][19]
 - [FFTW3 library][28] for FFT, which is implemented in C. A example file can be bound under [here][29] or my [local copy][30]

 - [64-bit and Data Size Neutrality][35], data size of int, long and pointer in 32 bits
    and 64 bits architecture
 - [64-Bit Programming Models: Why LP64?][37]
 
 - [The Definitive Guide to GCC][40]
 - [GCC online documentation][51]
 
 - [The Definitive C++ Book Guide and List][61]
 
 
### C internals
 - [System V Application Binary Interface][60], generic ABI

### C++ internals
 - [Inside C++ object model][56]
 - [C++: Under the hood][36]
 - [C++ Tutorial: Pointer-to-Member Function][38]
 - [Reversing C++][39]
 - [C++ Under the Hood][52], another version
 - [Memory Layout for Multiple and Virtual Inheritance][54]
 - Thinking in C++, 2nd ed. Volume 1, [15: Polymorphism & Virtual Functions][55]
 
 - [C++ ABI Summary][58]
 - [Itanium C++ ABI][59]

 #### Todo
  - What is the RTTI (Runtime type identification ) and its relationship with virtual table?
  - a book: Ruminations on C++


## Python
 - [Anaconda Scientific Python Distribution][27], including **spyder** editor
 - [Core Python Programming (2nd Edition)][23]
 - [How methods work in Python][24]
 - [Difference between @staticmethod and @classmethod in Python][25]
 - [Regular Expression HOWTO][26]


## Operating system
 - [System V Application Binary Interface Intel386 Architecture Processor Supplement Version 1.0][6] and my [local copy][7]
 - [Hilfinger notes on Memory Management][20]
 - [You can be a kernel hacker!][21]

## Compiler
 - [Compilers: Principles, Techniques, and Tools (2nd Edition)][22]

## Git
 - [Advanced use of Git][4]



[61]: http://stackoverflow.com/questions/388242/the-definitive-c-book-guide-and-list
[60]: http://www.sco.com/developers/devspecs/gabi41.pdf
[59]: http://mentorembedded.github.io/cxx-abi/abi.html
[58]: https://mentorembedded.github.io/cxx-abi/
[57]: http://www.mindviewinc.com/Index.php
[56]: /pdf/programming/inside.the.c++.object.model.pdf
[55]: http://www.drbio.cornell.edu/pl47/programming/TICPP-2nd-ed-Vol-one-html/Chapter15.html
[54]: http://www.phpcompiler.org/articles/virtualinheritance.html
[53]: http://www.aristeia.com
[52]: http://www.han-ese.nl/~ewout/ESE/INF2/CPP_onder_de_motorkap.pdf
[51]: https://gcc.gnu.org/onlinedocs/
[40]: https://sensperiodit.files.wordpress.com/2011/04/hagen-the-definitive-guide-to-gcc-2e-apress-2006.pdf
[39]: https://www.blackhat.com/presentations/bh-dc-07/Sabanal_Yason/Paper/bh-dc-07-Sabanal_Yason-WP.pdf
[38]: http://www.codeguru.com/cpp/cpp/article.php/c17401/C-Tutorial-PointertoMember-Function.htm
[37]: http://www.unix.org/version2/whatsnew/lp64_wp.html 
[36]: http://www.openrce.org/articles/files/jangrayhood.pdf
[35]: http://www.unix.org/whitepapers/64bit.html
[34]: http://www.stroustrup.com/crc.pdf
[33]: http://www.stroustrup.com/books.html
[32]: http://delivery.acm.org/10.1145/160000/155580/p201-ritchie.pdf?ip=141.72.245.91&id=155580&acc=ACTIVE%20SERVICE&key=2BA2C432AB83DA15%2EA83A5A66E0DD4B84%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35&CFID=564615910&CFTOKEN=99021349&__acm__=1451509704_b42fa3dadd0c7f655eb790047bc4b9ea
[31]: https://www.bell-labs.com/usr/dmr/www/chist.html
[30]: /src/cpp-and-c/fftw3_prb.c
[29]: https://people.sc.fsu.edu/~jburkardt/c_src/fftw3/fftw3_prb.c
[28]: http://www.fftw.org/
[27]: https://store.continuum.io/cshop/anaconda/
[26]: https://docs.python.org/2/howto/regex.html
[25]: http://www.pythoncentral.io/difference-between-staticmethod-and-classmethod-in-python/
[24]: https://julien.danjou.info/blog/2013/guide-python-static-class-abstract-methods
[23]: http://www.amazon.com/Core-Python-Programming-2nd-Edition/dp/0132269937
[22]: http://www.amazon.com/Compilers-Principles-Techniques-Tools-2nd/dp/0321486811
[21]: http://jvns.ca/blog/2014/09/18/you-can-be-a-kernel-hacker/
[20]: http://www-inst.eecs.berkeley.edu/~cs61c/resources/pnh.stg.mgmt.pdf
[19]: http://www-inst.eecs.berkeley.edu/~cs61c/resources/HarveyNotesC1-3.pdf
[18]: http://leto.net/docs/C-optimization.php
[17]: https://www.eventhelix.com/RealtimeMantra/basics/#.VSrcMPmUcXc
[16]: http://www.codeproject.com/Articles/6154/Writing-Efficient-C-and-C-Code-Optimization
[15]: http://www.catb.org/esr/time-programming/
[14]: http://blog.regehr.org/archives/232
[13]: http://blog.regehr.org/archives/226
[12]: http://blog.regehr.org/archives/213
[11]: http://www.catb.org/esr/structure-packing/
[10]: http://www.catb.org/~esr/
[9]: http://en.wikibooks.org/wiki/X86_Disassembly
[8]: /pdf/programming/x86%20Disassembly.pdf
[7]: /pdf/programming/psABI-i386.pdf
[6]: http://www.uclibc.org/docs/psABI-i386.pdf
[5]: http://www-verimag.imag.fr/~moy/c/c_collection/
[4]: http://www-verimag.imag.fr/~moy/IMG/pdf/advanced-git-slides.pdf
[3]: http://www.amazon.com/Programming-Environment-Addison-Wesley-Professional-Computing/dp/0201433079/ref=sr_1_2?ie=UTF8&s=books&qid=1218650542&sr=1-2
[2]: http://www.amazon.com/Programming-Language-Prentice-Hall-Software/dp/0131103628/ref=pd_sim_b_1
[1]: http://www.amazon.com/Professional-Assembly-Language-Richard-Blum/dp/0764579010