#!/usr/bin/env python

from SimpleXMLRPCServer import SimpleXMLRPCServer
from win32ui import MessageBox

def whoLoggedOff (who):
	msg = "%s just logged off."%who
	MessageBox(msg, "None")
	return 1
	

server = SimpleXMLRPCServer(("192.168.254.116", 9090))
server.register_function(whoLoggedOff)
server.register_introspection_functions()
server.serve_forever()
