---
layout: post
title:  C 语言 结构体 长度为 0 的指针
categories:
- Notes
tags:
- c/c++
- programming
---

## 代码如下

```language-c
#include <stdio.h>
#include <stdlib.h>

#define LEN 10
struct test
{
	int len;
	int a[0];
};

struct test *t1;


struct test2
{
	int len;
	int *a;
};


void main()
{
	int i = 0;
	char *temp;
	temp = (char *) malloc(sizeof(struct test) + LEN);
	t1 = (struct test*)temp;
	t1->len = LEN;

	printf("sizeof(struct test) = %d\n", sizeof(struct test));
	printf("sizeof(struct test2) = %d\n", sizeof(struct test2));


	for(i = 0; i < t1->len; i++)
	{		
		t1->a[i] = i;
	}

	for(i = 0; i < t1->len; i++)
	{		
		printf("a[%d] = %d\n", i, t1->a[i]);
	}
}
```

## 输出结果如下
    sizeof(struct test) = 4
    sizeof(struct test2) = 8
    a[0] = 0
    a[1] = 1
    a[2] = 2
    a[3] = 3
    a[4] = 4
    a[5] = 5
    a[6] = 6
    a[7] = 7
    a[8] = 8
    a[9] = 9



## mdk3 中代码片段

        int net_send(int s, int command, void *arg, int len)
    {
    	struct net_hdr *pnh;
    	char *pktbuf;
    	size_t pktlen;
    
    	pktlen = sizeof(struct net_hdr) + len;
    
    	pktbuf = (char*)calloc(sizeof(char), pktlen);
    	if (pktbuf == NULL) {
    		perror("calloc");
    		goto net_send_error;
    	}
    
    	pnh = (struct net_hdr*)pktbuf;
    	pnh->nh_type = command;
    	pnh->nh_len = htonl(len);
    	
    	memcpy(pktbuf + sizeof(struct net_hdr), arg, len);
	

struct net_hdr 结构体最后一个为长度为 0  的指针，其定义如下

        struct net_hdr {
        	uint8_t		nh_type;
        	uint32_t	nh_len;
        	uint8_t		nh_data[0];
        } __packed;

先分配一个缓冲区，长度为结构体长度 + 缓冲区的长度。然后进行类型转换，赋给结构体指针.

最后把要发送的数据从 arg 指向的缓冲区复制到结构体最后一个成员指向的缓冲区。


## 快速注释

        #if 0
        static int queue_len(struct queue *head)
        {
        	struct queue *q = head->q_next;
        	int i = 0;
        
        	while (q != head) {
        		i++;
        		q = q->q_next;
        	}
        
        	return i;
        }
        #endif
        


## 内存操作
 - bzero
 - memset
 - memcpy

## 利用字符串自动连接
        #define VERSION "v6"
        
        char use_head[]="\nMDK 3.0 " VERSION " - \"Yeah, well, whatever\"\n"
        		"by ASPj of k2wrlz, using the osdep library from aircrack-ng\n"
        		"And with lots of help from the great aircrack-ng community:\n"
        		"Antragon, moongray, Ace, Zero_Chaos, Hirte, thefkboss, ducttape,\n"
                        "telek0miker, Le_Vert, sorbo, Andy Green, bahathir and Dawid Gajownik\n"
        		"THANK YOU!\n\n"
        		"MDK is a proof-of-concept tool to exploit common IEEE 802.11 protocol weaknesses.\n"
        		"IMPORTANT: It is your responsibility to make sure you have permission from the\n"
                        "network owner before running MDK against it.\n\n"
        		"This code is licenced under the GPLv2\n\n"
        		"MDK USAGE:\n"
        		"mdk3 <interface> <test_mode> [test_options]\n\n"
        		"Try mdk3 --fullhelp for all test options\n"
        		"Try mdk3 --help <test_mode> for info about one test only\n\n"
        		"TEST MODES:\n"
        		"b   - Beacon Flood Mode\n"
        		"      Sends beacon frames to show fake APs at clients.\n"
        		"      This can sometimes crash network scanners and even drivers!\n"
        		"a   - Authentication DoS mode\n"
        		"      Sends authentication frames to all APs found in range.\n"
        		"      Too much clients freeze or reset some APs.\n"
        		"p   - Basic probing and ESSID Bruteforce mode\n"
        		"      Probes AP and check for answer, useful for checking if SSID has\n"
        		"      been correctly decloaked or if AP is in your adaptors sending range\n"
        		"      SSID Bruteforcing is also possible with this test mode.\n"
        		"d   - Deauthentication / Disassociation Amok Mode\n"
        		"      Kicks everybody found from AP\n"
        		"m   - Michael shutdown exploitation (TKIP)\n"
        		"      Cancels all traffic continuously\n"
        		"x   - 802.1X tests\n"
        		"w   - WIDS/WIPS Confusion\n"
        		"      Confuse/Abuse Intrusion Detection and Prevention Systems\n"
        		"f   - MAC filter bruteforce mode\n"
        		"      This test uses a list of known client MAC Adresses and tries to\n"
        		"      authenticate them to the given AP while dynamically changing\n"
        		"      its response timeout for best performance. It currently works only\n"
        		"      on APs who deny an open authentication request properly\n"
        		"g   - WPA Downgrade test\n"
        		"      deauthenticates Stations and APs sending WPA encrypted packets.\n"
        		"      With this test you can check if the sysadmin will try setting his\n"
        		"      network to WEP or disable encryption.\n";

        printf(use_head);
        



## 参考资料
- [结构体中最后一个成员为[0]或[1]长度数组(柔性数组成员)的用法][1]
- mdk3 中的 network.c 53行中的 net_send 函数，network.h 中的 struct net_hdr



[1]: http://blog.csdn.net/fengbingchun/article/details/24185217