---
layout: post
title:  C/C++ notes
categories:
- Notes
tags:
- c/c++
- programming
---

## References
 - a book [Computer Science from the Bottom Up][33]
 - [MODULE 000-1 gcc, g++, gdb and friends 1][2]
 - [Compiler, assembler, linker and loader: a brief history][1]
 - [C/C++ and Buffer Overflow Topics][4]
 - [Intro to Linux Shared Libraries (How to Create Shared Libraries)][8]
 - [Journey of a C Program to Linux Executable in 4 Stages][9]
 - [How to mix C and C++][14], <https://isocpp.org/wiki/faq/mixing-c-and-cpp>

## Crt0
 - see [Wikipedia][12]

## C++ name mangling
 - [Name mangling][13] at Wikipedia
 - `main` is not mangled, as if it is declared with `extern "C"`
 - `int a;`, `a` is not mangled
 - `const int a = 3`, `a` is mangled, `_ZL1a` (a const global variable is static implicitly)
 - `const static b`, `b` is mangled, `_ZL1b`
 - `static int c;`, `c` is mangled, `_ZL1c`
```.cpp
#ifdef _cplusplus
extern "C"
#endif
void not_mangled()
{}
```
  - For a given object file `a.o`, use `nm -C a.o` to demangle the symbols, or use `nm a.o | c++filt`
  - Difference between `extern` and `extern "C"`
     - `extern`: a function or a variable is defined elsewhere
     - `extern "C"`: do not do name mangling
 
 
## Tools
 - make, cmake
 - gcc, g++
 - readelf, objdump, ldd, nm
 - [GNU Binutils][11] at Wikipedia
 
## Executable and Linkable Format (ELF)
 - [Wikipedia][5]
 - [Specification Version 1.2][6]
 - [ELF Tutorial][7] at osdev.org
 - [The ELF Object File Format by Dissection][10]
 - [libelf by Example][11], pdf file, <ftp://ftp2.uk.freebsd.org/sites/downloads.sourceforge.net/e/el/elftoolchain/Documentation/libelf-by-example/20120308/libelf-by-example.pdf>

## gcc notes.
 - [3.20 Environment Variables Affecting GCC][3], 
   - Useful variables: **C_INCLUDE_PATH**, **CPLUS_INCLUDE_PATH**
 - Use option `-v` to view the verbose output, such as the searching directories for header files, example: `gcc -v a.c`


## Styles
 - **[C++ Programming Practice Guidelines][15]**
 - **[C++ Programming Style Guidelines][16]**
 - [Allman style][17]

 - class, struct, enum: MyClass
 - abstract class: IMyInterface
 - functions, methods: myFunction()
 - local variable: isStudent
 - member variable: _isStudent
 - constants, enum values, defines: MAX_NUMBER
 - namespace: cv, std, kfj
 - template: `<class TType1>`
 
 
## Shared libraries
 - [How to write shared libraries][18], pdf
 - [The inside story on shared libraries and dynamic loading][19], pdf
 - [Anatomy of Linux dynamic libraries][20]
 - [Resolving ELF Relocation Name / Symbols][21]
 - [Linkers and Loaders][22]
 - [Dynamic Linking (x86) Internals][23]
 - [Static Linking (x86_64) Internals][24]
 - [A Whirlwind Tutorial on Creating Really Teensy ELF Executables for Linux][25]
 - [The Art Of ELF: Analysis and Exploitations][26]
 - [What is the difference between `-fpic` and `-fPIC` gcc parameters?][27]
 - [**Why symbol visibility is good**][29]
 - **[Stripping shared libraries][31]**, `--strip-unneeded`, `--strip-all`


#### GOT and PLT
 - GOT: global offset table
 - PLT: procedure linkage table
 - [PLT and GOT - the key to code sharing and dynamic libraries][28], **excellant tutorial** to GOT and PLT step by step!
 - [Position Independent Code and x86-64 libraries][30]





[33]: http://www.bottomupcs.com/
[31]: https://www.technovelty.org/linux/stripping-shared-libraries.html
[30]: https://www.technovelty.org/category/c.html
[29]: https://www.technovelty.org/code/why-symbol-visibility-is-good.html
[28]: https://www.technovelty.org/linux/plt-and-got-the-key-to-code-sharing-and-dynamic-libraries.html
[27]: http://stackoverflow.com/questions/3544035/what-is-the-difference-between-fpic-and-fpic-gcc-parameters
[26]: http://fluxius.handgrep.se/2011/10/20/the-art-of-elf-analysises-and-exploitations/
[25]: http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
[24]: http://sploitfun.blogspot.de/2013/07/static-linking-x8664-internals.html
[23]: http://sploitfun.blogspot.de/2013/06/dynamic-linking-internals.html
[22]: http://www.linuxjournal.com/article/6463
[21]: http://em386.blogspot.de/2006/10/resolving-elf-relocation-name-symbols.html
[20]: https://www.ibm.com/developerworks/library/l-dynamic-libraries/
[19]: https://cseweb.ucsd.edu/~gbournou/CSE131/the_inside_story_on_shared_libraries_and_dynamic_loading.pdf
[18]: https://www.akkadia.org/drepper/dsohowto.pdf
[17]: https://en.wikipedia.org/wiki/Indent_style#Allman_style
[16]: http://geosoft.no/development/cppstyle.html
[15]: http://geosoft.no/development/cpppractice.html
[14]: https://isocpp.org/wiki/faq/mixing-c-and-cpp
[13]: https://en.wikipedia.org/wiki/Name_mangling#Name_mangling_in_C.2B.2B
[12]: https://en.wikipedia.org/wiki/Crt0
[11]: https://en.wikipedia.org/wiki/GNU_Binutils
[10]: http://www.linuxjournal.com/article/1060
[9]: http://www.thegeekstuff.com/2011/10/c-program-to-an-executable/
[8]: http://www.thegeekstuff.com/2012/06/linux-shared-libraries/
[7]: http://wiki.osdev.org/ELF_Tutorial
[6]: http://refspecs.linuxbase.org/elf/elf.pdf
[5]: https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[4]: http://www.tenouk.com/cncplusplusbufferoverflow.html
[3]: https://gcc.gnu.org/onlinedocs/gcc/Environment-Variables.html
[2]: http://www.tenouk.com/Module000.html
[1]: http://www.tenouk.com/ModuleW.html
