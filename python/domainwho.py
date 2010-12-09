import win32net, sys, NetworkAdaptor, os
import xml.sax.handler
from xml.dom.minidom import parse
from xml.dom.minidom import getDOMImplementation

#class mySaxHandler(xml.sax.handler.ContentHandler):
#	keyList = []
#	currentElementName = None
#
#	def startElement(self, name, attrs): 
#		self.currentElementName = name
#		print name
#		self.keyList[-1] = {name:None}
#	def characters(self, content):
#		self.keyList[-1][self.currentElementName] = repr(content)
#

class LicenseQuery:

	collatedSourceDoc = None
	xmlFileOutput = None

	def __init__(self):
		self.collatedSourceDoc = xml.dom.minidom.Document()
		self.collatedSourceDoc.appendChild(self.collatedSourceDoc.createElement("product_key_list"))
		self.xmlFileOutput = open("all.xml", "w")
		
	def __del__(self):
		self.xmlFileOutput.close()				
	
	def getLicenses(self):
		sessionList = win32net.NetSessionEnum(1, "lumberjack")
		#print win32net.NetWkstaGetInfo("rbs-8f157f81a45", 502)
		#print sessionList
		for machine in sessionList:
			if machine["user_name"] not in ["jaredcarr", ]:
				command = "c:\\progra~1\\produkey\\produkey.exe /sxml %s.xml /remote %s"%(machine["user_name"], machine["client_name"])
				os.system(command)
			#	for attr, atval in machine.iteritems():
			#		print attr + " => " + str(atval)
			#	print NetworkAdaptor.listMacs(machine["client_name"])
		self.collateOutput()


	def collateOutputSax(self):
		parser = xml.sax.make_parser()
		handler = mySaxHandler()
		parser.setContenthandler(handler)
		parser.parse("scottnoel-hemming.xml")
#		parser = xml.sax.parse("scottnoel-hemming.xml", mySaxHandler)
		print parser.keyList
		#for file in os.listdir("."):
		#	if "xml" in file:
		#		expatParser.ParseFile(file)

	def collateOutput(self):
		for file in os.listdir("."):
			if "xml" in file and "Roster" not in file and "all" not in file:
				dom = xml.dom.minidom.parse(file)
				for node in dom.getElementsByTagName("item"):
					userNode = self.collatedSourceDoc.createElement("user")
					userNode.appendChild(self.collatedSourceDoc.createTextNode(file[0:-4]))
					node.insertBefore(userNode, node.childNodes[0])
					self.collatedSourceDoc.childNodes[0].appendChild(node)
		print self.collatedSourceDoc.toprettyxml()
		self.xmlFileOutput.write(self.collatedSourceDoc.toprettyxml())
#		self.collatedSourceDoc.writexml(self.xmlFileOutput, "\t")
#					print node.toxml()

import win32net,sys


#sessionList = win32net.NetSessionEnum(1, "lumberjack", "rbs-dcafd5fc13f")
machine = win32net.NetWkstaGetInfo("172.16.0.31", 502)

def listMachines(server):
sessionList = win32net.NetSessionEnum(1, "smb1-tc.rbsinteractive.com")#, "rbs-dcafd5fc13f")
print sessionList

for machine in sessionList:
	print machine["client_name"] + "\t" + machine["user_name"]

	objWMIService = win32com.client.Dispatch("WbemScripting.SWbemLocator")
	objSWbemServices = objWMIService.ConnectServer(strComputer,"root\cimv2")
	colItems = objSWbemServices.ExecQuery("SELECT * FROM Win32_NetworkAdapter")
	
def listMacs(strComputer):
	objWMIService = win32com.client.Dispatch("WbemScripting.SWbemLocator")
	objSWbemServices = objWMIService.ConnectServer(strComputer,"root\cimv2")
	colItems = objSWbemServices.ExecQuery("SELECT * FROM Win32_NetworkAdapter")
	ret = strComputer
	for objItem in colItems:
		if objItem.SystemName != None:
			ret += "\n\tProductName - " + ` objItem.SystemName`
		if objItem.ProductName and "Ethernet" in objItem.ProductName or \
		   objItem.Description and "Ethernet" in objItem.Description:
			if objItem.MACAddress:
				ret += "\n\tProductName - " + ` objItem.ProductName`
#				ret += "\n\t\tAdapterType - " + ` objItem.AdapterType`
				ret += "\n\t\tMACAddress - " + objItem.MACAddress
	return ret

if __name__ == "__main__":
	q = LicenseQuery()
#	q.getLicenses()
	q.collateOutput()
