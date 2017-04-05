---
layout: post
title:  Linux tools
categories:
- Notes
tags:
- programming
- linux
---

# od
 - `man od`
```
$ od -t x1z -A x -j 0x00 -N 0x18 a  
000000 7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00  >.ELF............<  
000010 02 00 3e 00 01 00 00 00                          >..>.....<  
000018
```

 - the first column is the address, `-A x` means to show the address in hexadecimal
 - `7f 45 4c` is the contents in the memory in hexdecimal, which is controlled by `-t x1`, `x`
 means showing the content in hexadecima, `1` means to show 1 address at a time. 
 - `-t x1z`, `z` means to show the ascii code
 - `-j 0x00`, 0x00 is the file offset, default is 0
 - `-N 0x18` means to show `0x18` bytes

The string table starts at offset `0x17d0` and has a size of `0x231` bytes. The following statements shows the strings:

```
~/test$ od -Ax -S 3 -j 0x17d0 -N 0x231 a
0017d1 crtstuff.c
0017dc __JCR_LIST__
0017e9 deregister_tm_clones
```
