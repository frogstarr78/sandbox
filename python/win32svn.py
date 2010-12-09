#!/usr/bin/env python

import xmlrpclib, sys
# Create an object to represent our server.

betty = xmlrpclib.ServerProxy("http://192.168.254.116:96449")
print betty.svn_action(sys.argv[1:])
