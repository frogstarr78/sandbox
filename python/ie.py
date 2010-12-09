import win32com.client, md5, win32event, win32api
from string import lower

public_html = "http://demon.89glass.com/~scott/"

class ie:
	o = None
	def __init__(self):
		self.ieObj = win32com.client.Dispatch("InternetExplorer.Application")
		self.ieObj.Visible = 1
		self.nav("about:blank")

	def waitForLoad(self):
		try:
			while not self.ieObj.Document:
				win32api.Sleep(100)
			while self.ieObj.Document.readyState != 'complete':
				win32api.Sleep(100)
		except:
			win32api.Sleep(100)


	def nav(self,where):
		self.ieObj.Navigate(where)
		self.waitForLoad()
			#print "Done!"

	def _getElementsByName(self, form, nodeName):
		for node in form:
			try:
				if node.name == nodeName:
					return node
			except:
				pass
		return False

	def fillOutForm(self, form, elementList, submit=False):
		doc = self.ieObj.Document
		form = doc.getElementsByName(form)
		if form.length == 1:
			form = form[0]

		if str(type(elementList))[7:-2] == 'tuple':
			# then we want the form filled out in a particular order
			for itm in elementList:
				for elementName, elementValue in itm.iteritems():
					currentNode = self._getElementsByName(form, elementName)
					if lower(currentNode.nodeName) == "select":
						for childNode in currentNode:
							if childNode.value == elementValue:
								currentNode.value = elementValue
								currentNode.selectedIndex = childNode.index
							elif childNode.childNodes[0].nodeValue == elementValue:
								currentNode.value = elementValue
								currentNode.selectedIndex = childNode.index
					elif lower(currentNode.nodeName) == "input":
						currentNode.value = elementValue
					else: # we don't have an named element child
						pass
		else: 
			# str(type(elementList))[7:-2] == "dict":
			# we don't care about the fill order of the forms elements
			for elementName, elementValue in elementList.iteritems():
				currentNode = self._getElementsByName(form, elementName)
				currentNode.value = elementValue
		if submit:
			form.submit()
			self.waitForLoad()

	getIEObject = lambda self: self.o
	getDOM	    = lambda self: self.ieObj.Document#.parentWindow.document

	def backendLogin(self, companyName):
		password = "LyffoavIaf"
		if (companyName == "89glass"):
			passwordField = "login_password"
			usernameField = "login_username"
			#loginURL = yacp.get("backend_siteURL") + "forward_to_landing.php"
			loginURL = "http://demon.89glass.com/~scott/89glass/backend/forward_to_landing.php"
		elif (companyName == "qualitysmith"):
			passwordField = "passwd"
			usernameField = "username"
			loginURL = "http://demon.89glass.com/~scott/roofsmith/backend/admin_blank_page.html"
			#loginURL = yacp.get("qualitysmith_backend_siteURL") + "admin_blank_page.html"

		self.nav(loginURL)
		self._debugElementObjects(self.getDOM().getElementById(usernameField))
		self.getDOM().getElementById(usernameField).setAttribute("value","testing_framework")
		self.getDOM().getElementById(passwordField)[0].value = password
		#self.getDOM().forms[0].submit()

	def _debugElementObjects(self, elementObject):
		for obj in dir(elementObject):
			print obj


	def testQuoteProcess(self):
		results = {}

		# get_instant_quote.html
		self.nav("http://demon.89glass.com/~scott/89glass/frontend/get_instant_quote.html")
		self.fillOutForm("quote_entry", {"year":"1997", "make":"Volkswagen", "zip":"99362"})
		self._debugElementObjects(self.getDOM().getElementById("quote_entry"))
		self.getDOM().getElementById("quote_entry").lastChild.click()
		# We expect them to be redirected to quote_entry.html at this point
		results["locationAfterSubmittingQuotePage1"] = self.getDOM().document.location

		# quote_entry.html
		self.getDOM().getElementsByName("model")[0].value = "Cabrio"
		self.getDOM().getElementsByName("model")[0].FireEvent("onchange")
		self.getDOM().getElementsByName("car_id")[0].value = "46717"        #"2 Door Convertible"
		self.getDOM().getElementsByName("glass_type")[0].value = "windshield"
		self.getDOM().getElementById("quote_form").submit()
		# We expect them to be redirected to quote.html at this point
		results["locationAfterSubmittingQuotePage2"] = self.getDOM().window.location

		# quote.html
		self.getDOM().getElementsByName("order_online_now")[0].click()

		#if the above method doesn't work, then...
		# There's no form/button to submit us to the next page--just a link.
		# So we can just simulate following that link...
		# <order_options.html?yvd=505192418&car_id=46717&glass_type=windshield&zip=99362>
		#newURL = self.getDOM().document.location.replace("quote.html", "order_options.html")
		#self.nav(newURL)

		# order_options.html
		results["locationAfterGoingToOrderPage0"] = self.getDOM().window.location
		results["currentPageIsOrderPage1"] = self.getDOM().getElementByID("body").innerHTML.find("I want to enter my info online")
		self.getDOM().forms[0].submit()

		# order.html page 1
		results["locationAfterGoingToOrderPage1"] = self.getDOM().window.location
		self.fillOutForm("order1", {"order[customer_first_name]":"Sam", "order[customer_last_name]":"Sneed", "order[customer_address1]":"12"})
		self.getDOM().forms["order1"].submit()

		# order.html page 2
		results["locationAfterGoingToOrderPage2"] = self.getDOM().window.location
		# possible problem: the actual date referenced in the select box will change with time
		self.fillOutForm("order2", {"order[service_day]":"Monday, Aug 8th", "order[service_time]":"PM", "order[onsite_same]":"1"})
		self.getDOM().forms["order2"].submit()

		results["currentPageIsOrderConfirmationPage"] = self.getDOM().getElementByID("body").innerHTML.find("Thank you for your order!")

		return results


if __name__ == "__main__":
	t = ie()
	t.testQuoteProcess()
	#t.backendLogin("qualitysmith")
	#t.nav(public_html + "roofsmith/backend/order_detail.html?patUserAction=login&username=scottnoel-hemming&passwd=" + md5.new('aujseamGoy').hexdigest())
	#t.nav(public_html + "89glass/frontend")

	#formData = ({"year":"2005"}, {"make":"Ford"}, {"zip":"99362"})
	#formData = ({"first_name":"Bob"}, {"last_name":"Smith"})
	#formData = {"first_name":"Bob", "last_name":"Smith", "address1":"123 Here St", "city":"Nowhere", "state":"WA", "zip":"98121"}

	#t.fillOutForm("CustomerInformationForm", formData)
	#t.fillOutForm("quote_entry", formData, True)
	#t.testQuoteProcess()
	#print t.getIEObject().Document.location
	#print t.getDOM().location
	#nav(public_html + "sidingsmith/frontend/")
	#print t.Document.getElementsByTagName("body")
