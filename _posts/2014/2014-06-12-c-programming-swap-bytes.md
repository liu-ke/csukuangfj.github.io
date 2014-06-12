---
layout: post
title:  C 语言 大小端 交换字节顺序
categories:
- Notes
tags:
- c/c++
- programming
---

## 代码如下

```language-c


typedef uint64_t u_int64_t;
typedef uint32_t u_int32_t;
typedef uint16_t u_int16_t;
typedef uint8_t  u_int8_t;

#define ___my_swab16(x) \
((u_int16_t)( \
		(((u_int16_t)(x) & (u_int16_t)0x00ffU) << 8) | \
		(((u_int16_t)(x) & (u_int16_t)0xff00U) >> 8) ))
#define ___my_swab32(x) \
((u_int32_t)( \
		(((u_int32_t)(x) & (u_int32_t)0x000000ffUL) << 24) | \
		(((u_int32_t)(x) & (u_int32_t)0x0000ff00UL) <<  8) | \
		(((u_int32_t)(x) & (u_int32_t)0x00ff0000UL) >>  8) | \
		(((u_int32_t)(x) & (u_int32_t)0xff000000UL) >> 24) ))
#define ___my_swab64(x) \
((u_int64_t)( \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x00000000000000ffULL) << 56) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x000000000000ff00ULL) << 40) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x0000000000ff0000ULL) << 24) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x00000000ff000000ULL) <<  8) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x000000ff00000000ULL) >>  8) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x0000ff0000000000ULL) >> 24) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0x00ff000000000000ULL) >> 40) | \
			(u_int64_t)(((u_int64_t)(x) & (u_int64_t)0xff00000000000000ULL) >> 56) ))
```
