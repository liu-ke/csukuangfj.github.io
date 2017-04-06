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
 - [Auxiliary Vector][6] at Linux Standard Base Specification for the Itanium™ Architecture 1.3
 - [About ELF Auxiliary Vectors][5]
 - [Code reading auxiliary vector present in executable binary.][7] at gist
 
 
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
2. view the program headers
> --program-headers
3. view the section headers
> --section-headers
4. view the section header string table (use -x secitionName)
> -x .shstrtab
```
$ readelf -x .shstrtab b.o

Hex dump of section '.shstrtab':
  0x00000000 002e7379 6d746162 002e7374 72746162 ..symtab..strtab
  0x00000010 002e7368 73747274 6162002e 74657874 ..shstrtab..text
  0x00000020 002e6461 7461002e 62737300 2e636f6d ..data..bss..com
  0x00000030 6d656e74 002e6e6f 74652e47 4e552d73 ment..note.GNU-s
  0x00000040 7461636b 002e7265 6c612e65 685f6672 tack..rela.eh_fr
  0x00000050 616d6500                            ame.
```
5. show the section header string table as strings (use -p sectionName)
> -p .shstrtab
```
$ readelf -p .shstrtab b.o
String dump of section '.shstrtab':
  [     1]  .symtab
  [     9]  .strtab
  [    11]  .shstrtab
  [    1b]  .text
  [    21]  .data
  [    27]  .bss
  [    2c]  .comment
  [    35]  .note.GNU-stack
  [    45]  .rela.eh_frame
```

## string table
 - seciton `.strtab`, (no flags)
 - section `.dynstr`, (with flag `ALLOC`)

## symbol table
 - section `.symtab` (no flags)
 - section `.dynsym` (with flag `ALLOC`)
 
 
## Relocation
 - [System V Application Binary Interface AMD64 Architecture Processor Supplement][4],pdf



[7]: https://gist.github.com/mina86/3880154
[6]: https://refspecs.linuxfoundation.org/LSB_1.3.0/IA64/spec/auxiliaryvector.html
[5]: http://articles.manugarg.com/aboutelfauxiliaryvectors
[4]: http://refspecs.linuxbase.org/elf/x86_64-abi-0.98.pdf
[3]: http://www.muppetlabs.com/%7Ebreadbox/software/ELF.txt
[2]: http://www.skyfree.org/linux/references/ELF_Format.pdf
[1]: https://github.com/thorkill/eresi
