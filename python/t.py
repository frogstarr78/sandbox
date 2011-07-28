#!/usr/bin/env python

class Me:
	def __init__(self):
		self.a = 'a'
	
	def hello(self, n):
		print "Hello %s"% n
	
	def _world(self, n):
		print "Hello %s"% n
	
	def __bye(self, n):
		print "Bye %s"% n

if __name__ == "__main__":
	t = Me()
	t.hello("world")
	t._world("bob")
	t.__bye("all!")
