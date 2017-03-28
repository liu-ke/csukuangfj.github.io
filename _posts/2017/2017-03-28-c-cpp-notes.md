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


## Tools
 - make, cmake
 - gcc, g++
 - readelf, objdump, ldd, nm
 
## Executable and Linkable Format (ELF)
 - [Wikipedia][5]
 - [Specification Version 1.2][6]
 - [ELF Tutorial][7] at osdev.org

## gcc notes.
 - [3.20 Environment Variables Affecting GCC][3], 
   - Useful variables: **C_INCLUDE_PATH**, **CPLUS_INCLUDE_PATH**
 - Use option `-v` to view the verbose output, such as the searching directories for header files, example: `gcc -v a.c`


[7]: http://wiki.osdev.org/ELF_Tutorial
[6]: http://refspecs.linuxbase.org/elf/elf.pdf
[5]: https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[4]: http://www.tenouk.com/cncplusplusbufferoverflow.html
[3]: https://gcc.gnu.org/onlinedocs/gcc/Environment-Variables.html
[2]: http://www.tenouk.com/Module000.html
[1]: http://www.tenouk.com/ModuleW.html
