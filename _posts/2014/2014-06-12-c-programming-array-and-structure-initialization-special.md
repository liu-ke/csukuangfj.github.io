---
layout: post
title:  C 语言 数组下标初始化
categories:
- Notes
tags:
- c/c++
- programming
---

## 程序:

{% gist 47e722f89c7635bbec97 %}

```language-c
#include <stdio.h>

enum header_type
{
	TYPE1 = 15,
	TYPE2 = 16,
	TYPE3 = 17,
	TYPE_END = 22,
};

const static unsigned char abc[] = 
{
	[0] = 1,
	[1] = 3,
	[2] = 4,
	[3] = 11,
	[6] = 2,
	[5] = 3,
	[10 ... 12] = 13,
	[TYPE1] = 155,
	[TYPE2] = 166,
	[TYPE3] = 177,
};


struct point 
{
	int x;
	int y;
};

struct point pa = { .x = 1, .y = 2};
struct point pb = { .y = 33, .x = 100};

struct point parray[] = 
{
	[0].x = 0, [0].y = 0,
	[1].x = 1,
	[5].x = 5, [5].y = 5,
};

void main()
{
	int i = 0;

	
	for(i = 0; i < sizeof(abc) / sizeof(abc[0]); i++)
	{
		printf("abc[%d] = %d\n",i, abc[i]);
	}

	printf("pa: (%d, %d)\n", pa.x, pa.y);
	printf("pb: (%d, %d)\n", pb.x, pb.y);

	for(i = 0; i < sizeof(parray) / sizeof(parray[0]); i++)
	{
		printf("parray[%d]: (%d, %d)\n", i, parray[i].x, parray[i].y);
	} 
}
```

## 输出
    abc[0] = 1
    abc[1] = 3
    abc[2] = 4
    abc[3] = 11
    abc[4] = 0
    abc[5] = 3
    abc[6] = 2
    abc[7] = 0
    abc[8] = 0
    abc[9] = 0
    abc[10] = 13
    abc[11] = 13
    abc[12] = 13
    abc[13] = 0
    abc[14] = 0
    abc[15] = 155
    abc[16] = 166
    abc[17] = 177
    pa: (1, 2)
    pb: (100, 33)
    parray[0]: (0, 0)
    parray[1]: (1, 0)
    parray[2]: (0, 0)
    parray[3]: (0, 0)
    parray[4]: (0, 0)
    parray[5]: (5, 5)




## 参考资料
 - [Designated Initializers][1]






[1]: http://gcc.gnu.org/onlinedocs/gcc-4.0.1/gcc/Designated-Inits.html#Designated-Inits