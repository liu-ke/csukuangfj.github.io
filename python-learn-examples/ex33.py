i = 0
numbers = []

while i < 6:
	print "At the top i is %s" % i
	numbers.append(i)
	
	i = i + 1
	print "Numbers now: ", numbers
	print "At the bottom i is %d" % i
	
print "The numbers: "
for num in numbers:
	print num
