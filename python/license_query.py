import win32net, NetworkAdaptor, os, sys, psycopg
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
	exclusionList = []
	sessionList = []
	verbose = 0

	def __init__(self):
		self.collatedSourceDoc = xml.dom.minidom.Document()
		self.collatedSourceDoc.appendChild(self.collatedSourceDoc.createElement("product_key_list"))
		self.xmlFileOutput = open("all.xml", "w")
		self.exclusionList += ["jaredcarr", "kimweissner", "donaldcarson", "richardbessey"]
		
	def __del__(self):
		self.xmlFileOutput.close()				
	

	def getLicenses(self):
		for machine in self.sessionList:
			if self.verbose == 1: print """user_name: %s pcname: %s"""%(machine["user_name"], machine["client_name"])

			if machine["user_name"] not in self.exclusionList:
				command = "produkey.exe /sxml %s.xml /remote %s"%(machine["user_name"], machine["client_name"])
				os.system(command)
			#	for attr, atval in machine.iteritems():
			#		print attr + " => " + str(atval)
			#	print NetworkAdaptor.listMacs(machine["client_name"])
		self.collateOutput()
#		print "colatedSourceDoc %s"%self.collatedSourceDoc.toprettyxml()
		self.xmlFileOutput.write(self.collatedSourceDoc.toprettyxml())

	def collateOutputSax(self):
		parser = xml.sax.make_parser()
		handler = mySaxHandler()
		parser.setContenthandler(handler)
		parser.parse("scottnoel-hemming.xml")

	def collateOutput(self):
		for file in os.listdir("."):
			if "xml" in file and "Roster" not in file and "all.xml" not in file:
#				print "file %s"%file
				self.parseFile(file)
			
	def parseFile(self, file):
		dom = xml.dom.minidom.parse(file)
#		print "file %s"%file
		for node in dom.getElementsByTagName("item"):
			userNode = self.collatedSourceDoc.createElement("user")
			userNode.appendChild(self.collatedSourceDoc.createTextNode(file[0:-4]))
			node.insertBefore(userNode, node.childNodes[0])
			print dir(node)
			self.collatedSourceDoc.childNodes[0].appendChild(node)
#			print "node.toxml() %s"%node.toxml()
		self.removeFile(file)

	def removeFile(self, file):
		os.remove(file)

	def platform(self, wksName=None):
		return win32net.NetWkstaGetInfo(wksName, 100)["platform_id"]
		
	def loadNetworkNames(self, name=None):
			self.sessionList += win32net.NetSessionEnum(1, "lumberjack", name)

	def loadNamesFile(self, nfile):
		namesFile = file(nfile)
		names = namesFile.readlines()
		namesFile.close()

		for name in names:
			self.loadNetworkNames(name)


if __name__ == "__main__":
	q = LicenseQuery()
	q.loadNamesFile("machines")
	q.getLicenses()
	q.collateOutput()
