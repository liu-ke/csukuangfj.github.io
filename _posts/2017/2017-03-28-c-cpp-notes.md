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
 - [MODULE 000-1 gcc, g++, gdb and friends 1][2]
 - [Compiler, assembler, linker and loader: a brief history][1]
 - [C/C++ and Buffer Overflow Topics][4]
 - [Intro to Linux Shared Libraries (How to Create Shared Libraries)][8]
 - [Journey of a C Program to Linux Executable in 4 Stages][9]

## Crt0
 - see [Wikipedia][12]

## C++ name mangling
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
