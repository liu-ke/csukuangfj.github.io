from sys import argv

script, filename = argv

def printall(f):
	print f.read()

def rewind(f):
	f.seek(0)

def print_one_line(linecount, f):
	print linecount, f.readline()

current_file = open(filename)

print "output the whole file."
printall(current_file)

rewind(current_file)

print "output three line"

line = 1
print_one_line(line, current_file)

line = line + 1
print_one_line(line, current_file)

line = line + 1
print_one_line(line, current_file)
	