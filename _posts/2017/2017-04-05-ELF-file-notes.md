---
layout: post
title:  ELF file notes
categories:
- Notes
tags:
- c/c++
- programming
- linux
---

# References
 - The ERESI Reverse Engineering Software Interface, at [GitHub][1], The ELF reverse engineering system interface
 - [specification pdf][2]
 - [specification txt][3]
 - `man elf`
 
## Components
 - header
 - program header table
 - section header table
 - sections and segments
 - symbol table
 - relocation entries
 - dynamic segment
 
 
 1. view file header
 > readelf --file-header a.o



[3]: http://www.muppetlabs.com/%7Ebreadbox/software/ELF.txt
[2]: http://www.skyfree.org/linux/references/ELF_Format.pdf
[1]: https://github.com/thorkill/eresi
