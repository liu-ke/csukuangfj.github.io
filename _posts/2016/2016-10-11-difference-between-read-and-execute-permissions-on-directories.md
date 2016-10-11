---
layout: post
title: Differences between read and execute permissions on directories
useMath: [latex]
showSource: 'no'
categories:
- Research
tags:
- Linux
- Unix
---

# Summary
 - `r`: user could access the filenames in the directory entries.
 - `x`: user could access the inode of a filename in the directory entries.

# Example

```
fangjun@fangjun:/tmp$ mkdir -p junk/sub
fangjun@fangjun:/tmp$ echo Hallo > junk/1
fangjun@fangjun:/tmp$ echo Welt > junk/sub/2
fangjun@fangjun:/tmp$ ls -lid junk/
2490418 drwxrwxr-x 3 fangjun fangjun 4096 Кст 11 21:30 junk/

fangjun@fangjun:/tmp$ ls -li junk/
total 8
2490421 -rw-rw-r-- 1 fangjun fangjun    6 Кст 11 21:30 1
2490420 drwxrwxr-x 2 fangjun fangjun 4096 Кст 11 21:30 sub

fangjun@fangjun:/tmp$ chmod -wr junk/
fangjun@fangjun:/tmp$ ls -ld junk/
d--x--x--x 3 fangjun fangjun 4096 Кст 11 21:30 junk/

fangjun@fangjun:/tmp$ ls -lid junk/
2490418 d--x--x--x 3 fangjun fangjun 4096 Кст 11 21:30 junk/

fangjun@fangjun:/tmp$ ls -li junk/
ls: cannot open directory junk/: Permission denied
```
Because the user does not have read permission on the directory, he cannot access filenames in the directory table.

```
fangjun@fangjun:/tmp$ ls -lid junk/1
2490421 -rw-rw-r-- 1 fangjun fangjun 6 Кст 11 21:30 junk/1
```

But if we know the filename, then we can access it. This strategy, i.e., only giving `x` permission to `others`, is widely used in FTP servers.

```
fangjun@fangjun:/tmp$ ls -lid junk/sub
2490420 drwxrwxr-x 2 fangjun fangjun 4096 Кст 11 21:30 junk/sub

fangjun@fangjun:/tmp$ ls -li junk/sub
total 4
2490422 -rw-rw-r-- 1 fangjun fangjun 5 Кст 11 21:30 2
fangjun@fangjun:/tmp$ cd junk/sub
fangjun@fangjun:/tmp/junk/sub$ ls -li
total 4
2490422 -rw-rw-r-- 1 fangjun fangjun 5 Кст 11 21:30 2
```

As we can get the inode of the subdirectory, we can change into it.

```
fangjun@fangjun:/tmp/junk/sub$ cd ..
fangjun@fangjun:/tmp/junk$ ls
ls: cannot open directory .: Permission denied

fangjun@fangjun:/tmp/junk$ cd ..
fangjun@fangjun:/tmp$ chmod a=r junk/
fangjun@fangjun:/tmp$ ls -ld junk/
dr--r--r-- 3 fangjun fangjun 4096 Кст 11 21:30 junk/

fangjun@fangjun:/tmp$ ls -lid junk/
2490418 dr--r--r-- 3 fangjun fangjun 4096 Кст 11 21:30 junk/

fangjun@fangjun:/tmp$ ls -l junk/
ls: cannot access junk/sub: Permission denied
ls: cannot access junk/1: Permission denied
total 0
-????????? ? ? ? ?            ? 1
d????????? ? ? ? ?            ? sub

fangjun@fangjun:/tmp$ ls junk/
ls: cannot access junk/sub: Permission denied
ls: cannot access junk/1: Permission denied
1  sub
```
Now we have only read permission, so we can only list the filenames in the directory but not its inodes. Thus it is impossible to get file information about the files.

```
fangjun@fangjun:/tmp$ cd junk/sub
bash: cd: junk/sub: Permission denied
```
Since we do not know the inode of the sub directory, it can not `cd` into it.
 
 
