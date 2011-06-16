#!/usr/bin/env python

import xmlrpclib

s = xmlrpclib.ServerProxy('https://tim.viviotech.net')
#print s.pow(2,3)  # Returns 2**3 = 8
#print s.add(2,3)  # Returns 5
#print s.div(5,2)  # Returns 5//2 = 2

# Print list of available methods
print s.system.listMethods(), "\n"
user = 'root'
password = 'VPS!itwtg'
try: 
    session = s.session.login_with_password(user, password) 
    if session['Status']  == "Success":
        session_uuid = session['Value']
        print session_uuid
    print s.VM.get_all_records(session_uuid)
    s.session.logout(session_uuid) 
except Exception as e:
    print "didn't connect %s"% e

