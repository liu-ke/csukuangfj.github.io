---
layout: post
title:  C/C++ notes
categories:
- Notes
tags:
- c/c++
- programming
---



# TODO
 - IDA Pro: <https://www.hex-rays.com/products/ida/index.shtml>
 - Historic Documents in Computer Science  <http://www.eah-jena.de/~kleine/history/>
 - Compatibility of C and C++ <https://en.wikipedia.org/wiki/Compatibility_of_C_and_C%2B%2B>
 - Incompatibilities Between ISO C and ISO C++ <http://david.tribble.com/text/cdiffs.htm>
 - C Craft <http://crypto.stanford.edu/~blynn/etc.html>, by Ben Lynn <http://crypto.stanford.edu/~blynn/>,
 there are many technical notes of him, such as git <http://crypto.stanford.edu/~blynn/gitmagic/> !
 - The function pointer tutorials <http://www.newty.de/fpt/index.html>
 - Tips on Programming <http://users.bestweb.net/~ctips/>
 - **C puzzles** <http://www.gowrikumar.com/c/index.php>, useful for testing (i.e, exam questions)
 - Technical & HR Interview Questions of Google,Microsoft,Yahoo and many more Companies. <http://placementsindia.blogspot.de>
 - 关于开发/编程工具 <http://guoshaoguang.com/blog/tag/github/>


# courses
 - [Effective Programming in C and C++][72] at MIT

# history
 - [self education and historical research of the C++ compiler cfront v3][42] at github
 - [A History of C++: 1979−1991][43], pdf, by Bjarne Stroustrup
 - [Classes: an abstract data type facility for the C language][44]
 - Adding Classes to the C Language: An Exercise in Language Evolution Software Practice and Experience, pp 139-161. February, 1983, by Bjarne Stroustrup
 - [Data Abstraction in C, technical report][45], pdf, by Bjarne Stroustrup
 - [The c++ reference manual][46], pdf,  by Bjarne Stroustrup
 - [A c++ tutorial, technical report][47], pdf, by Bjarne Stroustrup

# http://en.cppreference.com
## preprocessing
 - [Preprocessor][50], `#define`, `#`, `##`, and some predefined marcos, such as `__FILE__`, `__LINE__`
 - [Conditional inclusion][51], `#if`, `#ifdef`, `#ifndef`, `#elif`, `#else`, `#endif` 
 - [Source file inclusion][52], differences between `#include <>` and `#include “”`
 - [Error directive][53], `#error`
 - [Implementation defined behavior control][56], such as `#pragma`
 - [Filename and line information][57]
## Comments
 - [Comments][58], note that C also supports `//` style comment from C99 !!!
## Enumerations
 - [Enumerations][59], `enum`
## types
 - [size_t][60], note that `size_t` is unsigned!
 - [sizeof operator][61]
 - [alignof][69]
 - [offsetof][62] and its possible [implementation][63]
 - [Struct declaration][64], it discusses `flexible array element` as the last member of a `struct`, see also [6.17 Arrays of Length Zero][65] of GCC. Examples: [Flexible array member in C-structure][66]
 - [Array initialization][67], pay attention to the last example: use `enum` as the array index, which may be useful for defining an array of error description string.
 - [Struct and union initialization][68], specifies the member name while it is initialised (which is not supported in C++!!)! Note that padding bytes are initialised to 0 !!!

# Variadic functions
 - [Variadic functions][71]
## printf
 - float -> double
 - char, short -> int
 - long, long long, size_t, and so on, keep the same.
 - `size_t` -> `%zu` (since c99)
 - `long` -> `%ld`
 - pay attention to the type of the argument and the format specifier!

# `#pragam`
 - [Structure-Packing Pragmas][54], in gcc,
 - [What's the difference between “#pragma pack” and “__attribute__((aligned))”][55]
 
## References
 - a book [Computer Science from the Bottom Up][33]
 - [MODULE 000-1 gcc, g++, gdb and friends 1][2]
 - [Compiler, assembler, linker and loader: a brief history][1]
 - [C/C++ and Buffer Overflow Topics][4]
 - [Intro to Linux Shared Libraries (How to Create Shared Libraries)][8]
 - [Journey of a C Program to Linux Executable in 4 Stages][9]
 - [How to mix C and C++][14], <https://isocpp.org/wiki/faq/mixing-c-and-cpp>

## stack layout
 - <https://www.win.tue.nl/~aeb/linux/hh/stack-layout.html>

## Crt0
 - see [Wikipedia][12]
 - [Main function][70]

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
 - **[Program Library HOWTO][34]**, pdf at TLDP
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
 - [Better understanding Linux secondary dependencies solving with examples][41]


### GOT and PLT
 - GOT: global offset table
 - PLT: procedure linkage table
 - [PLT and GOT - the key to code sharing and dynamic libraries][28], **excellant tutorial** to GOT and PLT step by step!
 - [Position Independent Code and x86-64 libraries][30]


### Library search path (load time, Windows)
 - [Dynamic-Link Library Search Order][38], MSDN

### Library search path (load time, Linux)
Note that `LD_PRELOAD` is searched before `LD_LIBRARY_PATH` !

 - refer to manual of `ld.so`, [here][39], or use `man ld.so`
 - see also `man ldconfig`
 - rpath at [wikipedia][40]

## Memory
 - [What Every Programmer Should Know About Memory][35] by [Ulrich Drepper][36], pdf
 - [Anatomy of a Program in Memory][37]


[72]: https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-s096-effective-programming-in-c-and-c-january-iap-2014/index.htm
[71]: http://en.cppreference.com/w/c/variadic
[70]: http://en.cppreference.com/w/c/language/main_function
[69]: http://en.cppreference.com/w/c/language/_Alignof
[68]: http://en.cppreference.com/w/c/language/struct_initialization
[67]: http://en.cppreference.com/w/c/language/array_initialization
[66]: http://stackoverflow.com/questions/3047530/flexible-array-member-in-c-structure
[65]: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[64]: http://en.cppreference.com/w/c/language/struct
[63]: http://lxr.free-electrons.com/source/scripts/kconfig/list.h#L8
[62]: http://en.cppreference.com/w/c/types/offsetof
[61]: http://en.cppreference.com/w/c/language/sizeof
[60]: http://en.cppreference.com/w/c/types/size_t
[59]: http://en.cppreference.com/w/c/language/enum
[58]: http://en.cppreference.com/w/c/comment
[57]: http://en.cppreference.com/w/c/preprocessor/line
[56]: http://en.cppreference.com/w/c/preprocessor/impl
[55]: http://stackoverflow.com/questions/14179748/whats-the-difference-between-pragma-pack-and-attribute-aligned
[54]: https://gcc.gnu.org/onlinedocs/gcc-4.5.1/gcc/Structure_002dPacking-Pragmas.html
[53]: http://en.cppreference.com/w/c/preprocessor/error
[52]: http://en.cppreference.com/w/c/preprocessor/include
[51]: http://en.cppreference.com/w/c/preprocessor/conditional
[50]: http://en.cppreference.com/w/c/preprocessor
[47]: http://www.eah-jena.de/~kleine/history/languages/Stroustrup-CplusplusTutorial.pdf
[46]: http://www.eah-jena.de/~kleine/history/languages/Stroustrup-CplusplusReferenceManual.pdf
[45]: http://www.eah-jena.de/~kleine/history/languages/Stroustrup-DataAbstractionInC.pdf
[44]: /pdf/programming/Classes-an-abstract-data-type-facility-for-the-C-language.pdf
[43]: http://www.stroustrup.com/hopl2.pdf
[42]: https://github.com/csukuangfj/cfront-3
[41]: http://www.kaizou.org/2015/01/linux-libraries/
[40]: https://en.wikipedia.org/wiki/Rpath
[39]: http://man7.org/linux/man-pages/man8/ld.so.8.html
[38]: https://msdn.microsoft.com/en-us/library/windows/desktop/ms682586(v=vs.85).aspx
[37]: http://duartes.org/gustavo/blog/post/anatomy-of-a-program-in-memory/
[36]: https://www.akkadia.org/drepper/
[35]: https://www.akkadia.org/drepper/cpumemory.pdf
[34]: http://www.tldp.org/HOWTO/pdf/Program-Library-HOWTO.pdf
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
