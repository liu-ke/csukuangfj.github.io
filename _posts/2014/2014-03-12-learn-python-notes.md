---
layout: post
title: python 学习笔记
categories:
- Notes
- Programming
tags:
- python
---

## 参考资料

[Learn Python The Hard Way](http://learnpythonthehardway.org/)


<center>ex1.py</center>
```python
print "Hello World!"
print "Hello Again"
print "I like typing this."
print "This is fun."
print 'Yay! Printing.'
print "I'd much rather you 'not'."
print 'I "said" do not touch this.'
```
<center>Output of ex1.py</center>

    Hello World!  
    Hello Again  
    I like typing this.  
    This is fun.  
    Yay! Printing.  
    I'd much rather you 'not'.  
    I "said" do not touch this.  

- 使用 print 进行输出，类似 printf
- 用双引号或单引号括住字符串

<center>ex2.py</center>
```python
# A comment, this is so you can read your program later.
# Anything after the # is ingored by python.

print "I could have code like this." # and the comment after is ignored

# You can also use a comment to "disable" or comment out a piece of code:
# print "This won't run."

print "This will run."
```
<center>Output of ex2.py</center>

    I could have code like this.  
    This will run.

- `#` 后面的内容是注释

<center>ex3.py</center>
```python
print "I will now count my chickens:"

print "Hens", 25 + 30 / 6
print "Roosters", 100 - 25 * 3 % 4

print "Now I will count the eggs:"

print 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

print "Is it true that 3 + 2 < 5 - 7?"

print 3 + 2 < 5 - 7

print "What is 3 + 2?", 3 + 2
print "What is 5 - 7?", 5 - 7

print "Oh, that's why it's False."

print "How about some more."

print "Is it greater?", 5 > -2
print "Is it greater or equal?", 5 >= -2
print "Is it less or equal?", 5 <= -2
```
<center>Output of ex3.py</center>

    I will now count my chickens:  
    Hens 30  
    Roosters 97  
    Now I will count the eggs:  
    7  
    Is it true that 3 + 2 < 5 - 7?  
    False  
    What is 3 + 2? 5  
    What is 5 - 7? -2  
    Oh, that's why it's False.  
    How about some more.  
    Is it greater? True  
    Is it greater or equal? True  
    Is it less or equal? False  

- False, True
- 1/4 = 0
- 1/4.0 = 0.25
- 运算时注意浮点数

<center>ex4.py</center>
```python
cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven


print "There are", cars, "cars available."
print "There are only", drivers, "drivers available."
print "There will be", cars_not_driven, "empty cars today."
print "We can trasport", carpool_capacity, "people today."
print "We have", passengers, "to carpool today."
print "We need to put about", average_passengers_per_car, "in each car."
```
<center>Output of ex4.py</center>

    There are 100 cars available.  
    There are only 30 drivers available.  
    There will be 70 empty cars today.  
    We can trasport 120.0 people today.  
    We have 90 to carpool today.  
    We need to put about 3 in each car.  

- 变量的使用
- 可以使用下划线做单词之间的分隔，易读

<center>ex5.py</center>
```python
my_name = 'Zed A. Shaw'
my_age = 35 # not a lie
my_height = 74 # inches
my_weight = 180 # lbs
my_eyes = 'Blue'
my_teeth = 'White'
my_hair = 'Brown'


print "Let's talk about %s." % my_name
print "He's %d inches tall." % my_height
print "He's %s pounds heavy." % my_weight
print "Actually that's not too heavy."
print "He's got %s eyes and %s hair." % (my_eyes, my_hair)
print "His teeth are usually %s depending on the coffee." % my_teeth

# this line is tricky, try to get it exactly right
print "If I add %d, %d, and %d I get %d." % (
	my_age, my_height, my_weight, my_age + my_height + my_weight)
```
<center>Output of ex5.py</center>

    Let's talk about Zed A. Shaw.  
    He's 74 inches tall.  
    He's 180 pounds heavy.  
    Actually that's not too heavy.  
    He's got Blue eyes and Brown hair.  
    His teeth are usually White depending on the coffee.  
    If I add 35, 74, and 180 I get 289.  

- 格式化输出字符串
- 注意输出多个参数时，用小括号括住


 

<center>ex6.py</center>
```python
x = "There are %d types of people." % 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." % (binary, do_not)

print x
print y

print "I said: %r." % x
print "I also said: '%s'." % y

hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

print joke_evaluation % hilarious

w = "This is the left side of ..."
e = "a string with a right side."

print w + e
```
<center>Output of ex6.py</center>

    There are 10 types of people.   
    Those who know binary and those who don't.  
    I said: 'There are 10 types of people.'.  
    I also said: 'Those who know binary and those who don't.'.  
    Isn't that joke so funny?! False  
    This is the left side of ...a string with a right side.  

- 使用 %r 可以输出任意形式的变量。注意输出时的**单引号**
- 字符处串可以用 + 号连接
- 可以把一个带格式的字符串赋给一个变量，类似 sprintf


<center>ex7.py</center>
```python
print "Mary had a little lamb."
print "Its fleece was white as %s." % 'snow'
print "And everywhere that Mary went."
print "." * 10 # what'd that do?

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

# watch that comma at the end. try removing it to see what happens
print end1 + end2 + end3 + end4 + end5 + end6,
print end7 + end8 + end9 + end10 + end11 + end12
```
<center>Output of ex7.py</center>

    Mary had a little lamb.  
    Its fleece was white as snow.  
    And everywhere that Mary went.  
..........  
Cheese Burger  

- print 输出后，会输出一个回车，若后面带逗号的话，就不会输出回车

<center>ex8.py</center>
```python
formatter = "%r %r %r %r"

print formatter % (1, 2, 3, 4)
print formatter % ("one", "two", "three", "four")
print formatter % (True, False, False, True)
print formatter % (formatter, formatter, formatter, formatter)
print formatter % (
	"I had this thing.",
	"That you could type up right.",
	"But it didn't sing.",
	"So I said goodnight."
)
```
<center>Output of ex8.py</center>

    1 2 3 4  
    'one' 'two' 'three' 'four'  
    True False False True  
    '%r %r %r %r' '%r %r %r %r' '%r %r %r %r' '%r %r %r %r'  
    'I had this thing.' 'That you could type up right.' "But it didn't sing." 'So I said goodnight.'  

- 这个例子显示出了 %r 的用法

<center>ex9.py</center>
```python
# Here's some new strange stuff, remeber type it exactly.

days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

print "Here are the days: ", days
print "Here are the months: ", months

print """
There's something going on here.
with the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
"""
```
<center>Output of ex9.py</center>

    Here are the days:  Mon Tue Wed Thu Fri Sat Sun  
    Here are the months:  Jan  
    Feb  
    Mar  
    Apr  
    May  
    Jun  
    Jul  
    Aug  
    
    There's something going on here.  
    with the three double-quotes.  
    We'll be able to type as much as we like.  
    Even 4 lines if we want, or 5, or 6.  

- 用三个双引号，其中的字符串可以分行写
- 也可以用 \n 输出分行的字符串

<center>ex10.py</center>
```python
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

print tabby_cat
print persian_cat
print backslash_cat
print fat_cat
```
<center>Output of ex10.py</center>

    	I'm tabbed in.
    I'm split
    on a line.
    I'm \ a \ cat.
    
    I'll do a list:
    	* Cat food
    	* Fishies
    	* Catnip
    	* Grass


```
