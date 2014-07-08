---
layout: post
title: 验证面试中的题目
categories:
- Notes
tags:
- c
---


今天参加了一个公司的面试，碰到一些 c 语言的概念问题。现在根据笔试中碰到的一些问题，写一个
程序验证一下看做的对不对：


```language-c
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

/*
 * 用到了数学库
 * 要指定生成文件名为 test
 * 
 * 编译方式为  
 * 	gcc test.c -lm -o test
 * 
 */

int main()
{

	unsigned short int a = -1;
	unsigned int b = -1;
	unsigned char c = -1;

	
	printf("1 - unsigned short int 占用的字节: %d\n", sizeof(unsigned short int));	
	printf("2 - 2字节 -1 的补码: %x\n", a);
	
	printf("3 - unsigned int 占用的字节: %d\n", sizeof(unsigned int));	
	printf("4 - 4字节 -1 的补码: %x\n", b);
	
	printf("5 - unsigned char 占用的字节: %d\n", sizeof(unsigned char));	
	printf("6 - 1字节 -1 的补码: %x\n", c);
	
	char str[100];
	char *p = str;
	printf("7 - 指针 p 占用的空间: %d\n", sizeof(p));
	printf("8 - 字符串 str 占用的空间: %d\n", sizeof(str));
	
	strcpy(str, "1234");
	printf("9 - 字符串 str 占用的空间: %d\n", sizeof(str));
	
	p = (char *)malloc(20);
	printf("10 - 指针 p 占用的空间: %d\n", sizeof(p));
	free(p);	
	
	printf("11 - square root of 2 is %.4f\n", sqrt(2));
	
	printf("-----下面测试大小端-------\n");
	
	int d = 0x12345678;
	p = (char *)&d;
	printf("p[0] = 0x%x\n", p[0]);
	printf("p[1] = 0x%x\n", p[1]);
	printf("p[2] = 0x%x\n", p[2]);
	printf("p[3] = 0x%x\n", p[3]);
	
	printf("----下面测试地址是否对齐----\n");
	int a1 = 3;
	int a2 = 3;
	char a3 = 3;
	unsigned short a4 = 3;
	char a5 = 3;
	int a6 = 3;
	char a7 = 3;
	char a8 = 3;
	printf("address int a1 = %p\n", &a1);
	printf("address int a2 = %p\n", &a2);
	printf("address char a3 = %p\n", &a3);
	printf("address unsigned short a4 = %p\n", &a4);
	printf("address char a5 = %p\n", &a5);
	printf("address int a6 = %p\n", &a6);
	printf("address char a7 = %p\n", &a7);
	printf("address char a8 = %p\n", &a8);
	
	unsigned short aa[10];
	printf("aa[0] address: %p\n", aa+0);
	printf("aa[1] address: %p\n", aa+1);
	printf("aa[2] address: %p\n", aa+2);
	
	printf("另一种方法测试大小端\n");
	union 
	{
		int a;
		char c[4];
	}u1;
	
	printf("address of u1.c[0]: %p\n", u1.c+0);
	printf("address of u1.c[1]: %p\n", u1.c+1);
	printf("address of u1.c[2]: %p\n", u1.c+2);
	printf("address of u1.c[3]: %p\n", u1.c+3);
	
	u1.c[0] = 0x12;
	u1.c[1] = 0x34;
	u1.c[2] = 0x56;
	u1.c[3] = 0x78;
	
	printf("u1.a = 0x%x\n", u1.a); // 如果时大端，则输出 0x12345678
	
	return 0;
}
```

输出结果为：

    1 - unsigned short int 占用的字节: 2
    2 - 2字节 -1 的补码: ffff
    3 - unsigned int 占用的字节: 4
    4 - 4字节 -1 的补码: ffffffff
    5 - unsigned char 占用的字节: 1
    6 - 1字节 -1 的补码: ff
    7 - 指针 p 占用的空间: 4
    8 - 字符串 str 占用的空间: 100
    9 - 字符串 str 占用的空间: 100
    10 - 指针 p 占用的空间: 4
    11 - square root of 2 is 1.4142
    -----下面测试大小端-------
    p[0] = 0x78
    p[1] = 0x56
    p[2] = 0x34
    p[3] = 0x12
    ----下面测试地址是否对齐----
    address int a1 = 0xbfadcffc
    address int a2 = 0xbfadd000
    address char a3 = 0xbfadcfef
    address unsigned short a4 = 0xbfadcff4
    address char a5 = 0xbfadcff0
    address int a6 = 0xbfadd004
    address char a7 = 0xbfadcff1
    address char a8 = 0xbfadcff2
    aa[0] address: 0xbfadd010
    aa[1] address: 0xbfadd012
    aa[2] address: 0xbfadd014
    另一种方法测试大小端
    address of u1.c[0]: 0xbfadd024
    address of u1.c[1]: 0xbfadd025
    address of u1.c[2]: 0xbfadd026
    address of u1.c[3]: 0xbfadd027
    u1.a = 0x78563412


 - 大小端格式问题， linux 和 windows 下默认时小端，即平常见到的格式。
 - 主要看低字节存在哪。低字节存在地地址，则为小端。低字节存在高地址，则为大端。
 - 今天忘记 short int 占几个字节了，现在测试了一下，占两个字节， int 占 4 字节
 - 32 位的机器， 指针占 4 字节。 字符串数组分配了多少个空间，使用 sizeof 时，就返回相应的值