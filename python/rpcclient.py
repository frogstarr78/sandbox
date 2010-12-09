#!/usr/bin/env python

import xmlrpclib, sys
# Create an object to represent our server.

betty = xmlrpclib.Server("http://192.168.254.116:96453")
#betty = xmlrpclib.ServerProxy("http://192.168.254.116:96451")
#t = betty.addContact({"firstName":"Joe", "lastName":"Bob", "company":"QualitySmithPro", "email":"joe.bob@qualitysmith.com", "jabber":"jobbob@jabber.89glass.com", "title":"CSS"})
print betty.system.listMethods()	
#t.addContact(firstname="joe", lastname="bob", company="qualitysmithpro", email="joe.bob@qualitysmith.com", jabber="jobbob@jabber.89glass.com", title="css")
