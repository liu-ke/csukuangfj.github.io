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

```
$ od -t x1z -A x -j 0x17d0 -N 0x231 a
0017d0 00 63 72 74 73 74 75 66 66 2e 63 00 5f 5f 4a 43  >.crtstuff.c.__JC<
0017e0 52 5f 4c 49 53 54 5f 5f 00 64 65 72 65 67 69 73  >R_LIST__.deregis<
0017f0 74 65 72 5f 74 6d 5f 63 6c 6f 6e 65 73 00 72 65  >ter_tm_clones.re<
001800 67 69 73 74 65 72 5f 74 6d 5f 63 6c 6f 6e 65 73  >gister_tm_clones<
001810 00 5f 5f 64 6f 5f 67 6c 6f 62 61 6c 5f 64 74 6f  >.__do_global_dto<
```
