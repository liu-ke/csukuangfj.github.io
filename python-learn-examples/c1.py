class HelloWorld(object):
	def __init__(self):
		print "in constructor function __init__"

	def greet(self):
		print "hello world"

a = HelloWorld()
a.greet()