##----------------------------- enumerators made global for js ----------------------------- */
##TVApplicationType
#tvApplicationTypeClient = 0
#tvApplicationTypeAdministrator = 1
#
##TVServerConnectionLevel. Default 0.
#tvServerConnectionLevelBasic = 0xffffffff
#tvServerConnectionLevelFull = 0
#
#
##CheckVersions Default -1 (true).
#CheckVersionsTrue = -1
#CheckVersionsFalse = 0
#
#
##TVStationUsage
#tvStationUsageOwner = 0
#tvStationUsageOwnerAndForwardCalls = 1
#tvStationUsageVisitor = 2
#
##TVAddressType. Default 1.
#tvAddressTypePhoneNumber = 1
#tvAddressTypeIP = 2
#tvAddressTypeStation = 3
#tvAddressTypeUser = 4
#tvAddressTypeEmail = 5
#tvAddressTypeCustom = 6
#tvAddressTypeExtension = 6
#tvAddressTypeName = 7
#tvAddressTypeApplication = 8
#tvAddressTypePlugin = 8
#tvAddressTypeAutoAttendant = 9
#tvAddressTypeWorkgroup = 10
#tvAddressTypeQueue = 11
#tvAddressTypeUnused = 12
#tvAddressTypeDID = 12
#tvAddressTypeUserDefaultLocation = 13
#tvAddressTypeVoiceMail = 14
#tvAddressTypeVoiceMailAccess = 15
#tvAddressTypeAccountLogon = 15
#tvAddressTypeHoldMenu = 16
#tvAddressTypeUnparkMenu = 21
#
##TVAddressSubType. 
#tvAddressSubTypeDoNotUseRules = 0
#tvAddressSubTypeUseRules = 8
#tvAddressSubTypePager = 16
#
##Service as IDialingService. Optional.
## this is the hard part. not impossible but difficult
## for internal calls this would be something like 
## [Session Object].User.[user specific params]
#
##TVAddressCategory.
#tvAddressCategoryNone = 0
#tvAddressCategoryBusiness = 1
#tvAddressCategoryHome = 2
#tvAddressCategoryMobile = 3
#tvAddressCategoryBusiness2 = 4
#tvAddressCategoryHome2 = 5
#tvAddressCategoryOther = 6
#
##TVDefaultFolders
#tvFolderAgents = 100
#tvFolderAgentStats = 2300
#tvFolderCallHistory = 400
#tvFolderCallRules = 1000
#tvFolderCalls = 300
#tvFolderContacts = 500
#tvFolderCurrentUser = 0xffffffff
#tvFolderDeleted = 0
#tvFolderGreetings = 1500
#tvFolderMessages = 700
#tvFolderPersonalStatus = 1600
#tvFolderQueueStats = 2200
#tvFolderRoutingLists = 1800
#tvFolderServices = 1100
#tvFolderSystemTarget = 1700
#tvFolderUsers = 1300
#tvFolderWorkgroups = 2100
#
##TVExportFormatType
#tvExportFormatTypeXML = 0
#TVExportFormatTypeCSV = 1
#
##TVExportType
#tvExportTypeView = 0
#tvExportTypeData = 1
#
##TVObjectClass
#tvClassSession = 1
#tvClassFolder = 10
#tvClassSystem = 11
#tvClassPermission = 20
#tvClassAddress = 21
#tvClassSetting = 22
#tvClassView = 23
#tvClassShortcut = 24
#tvClassSchedule = 27
#tvClassScheduledDay = 28
#tvClassScheduledDate = 29
#tvClassVariable = 33
#tvClassNotification = 34
#tvClassParty = 35
#tvClassAudioClip = 36
#tvClassField = 41
#tvClassColumn = 42
#tvClassNotifyScheduleItem = 43
#tvClassRoutingListAction = 44
#tvClassRoutingListFinalAction = 45
#tvClassReportingCategory = 46
#tvClassSystemSetting = 47
#tvClassShortcutGroup = 48
#tvClassStationType = 49
#tvClassStationFeature = 50
#tvClassStationParameter = 51
#tvClassAgent = 101
#tvClassAgentStat = 2301
#tvClassAutoAttendant = 201
#tvClassCall = 301
#tvClassCallHistory = 401
#tvClassCallHistoryParty = 402
#tvClassCallRule = 1001
#tvClassContact = 501
#tvClassDeviceStation = 601
#tvClassGreeting = 1501
#tvClassIVRPlugIn = 1401
#tvClassMessage = 701
#tvClassPersonalStatus = 1601
#tvClassQueue = 901
#tvClassQueueStat = 2201
#tvClassRoutingList = 1801
#tvClassServiceInternet = 1101
#tvClassServicePhone = 1102
#tvClassServicePhoneGateway = 1103
#tvClassServiceSwitch = 1104
#tvClassServiceSwitchGateway = 1105
#tvClassServiceRouting = 1106
#tvClassSystemTarget = 1701
#tvClassUser = 1301
#tvClassUserGroup = 1302
#tvClassRole = 1302
#tvClassWorkgroup = 2101
#
##TVSearchType
#tvSearchDefault = 0
#tvSearchID = 1
#tvSearchOrdinal = 2
#tvSearchKey = 3
#

#*----------------------------- enumerators made global for js ----------------------------- */

from win32com.client import Dispatch
 oSession = False;

def logIn():
	
	oSession = Dispatch("TeleVantage.Session")
	#get TV Session

	if oSession.Status
		oSession = Dispatch("", "TeleVantage.Session")
	else:
		oSession.Logon("PHONESERVER", "Scott Noel-Hemming", "01180331", 0, tvApplicationTypeClient, "32401", tvServerConnectionLevelFull, CheckVersionsFalse, tvStationUsageVisitor)
	return oSession

def addContact():
	logIn()

	oPublicFolder  = oSession.GetFolder(oSession.Folders.Item("Public").id)
	oContactsFolder = oPublicFolder.Folders.Item("Contacts")

	# oContactsFolder = oSession.GetFolder(oSession.Folders.Item("Public").id)
	oContact = oContactsFolder.Items.Add(tvClassContact)

	# Create a new Contact object.
	oContact = oContactsFolder.Items.Add(tvClassContact)

	#  User properties.
	oContact.FirstName = "Jim"
	oContact.LastName = "Williams"

	# Create new Address object.
	oAddress = oContact.Addresses.Add()

	#  the Address properties for the new Contact.
	oAddress.AddressType = tvAddressTypePhoneNumber
	oAddress.Category = tvAddressCategoryHome
	oAddress.Description = "Jim's home number"
	oAddress.Value = "555-1234"
	oAddress.Default = true 
	#this will make this the default address for this contact

	# Call the Validate method so that all assigned fields can be checked.
	oAddress.Validate(true)

	# Save the new Contact.
	oContact.Save(true)

	oSession.LogOff()
	#print("done")

def addUser():
	logIn()

	# Get the Users Folder.
	 oUsersFolder = oSession.GetDefaultFolder(tvFolderUsers)
	# Create a new User object.
	 oUser = oUsersFolder.Items.Add(tvClassUser)
	#  User properties.
	oUser.FirstName = "Joe"
	oUser.LastName = "Smith"
	oUser.extension = "4991"
	oUser.Company = "QualitySmith"
	# Create a new Address object.
	 oAddress = oUser.Addresses.Add()
	#  the Address properties for the new User.
	oAddress.AddressType = tvAddressTypeStation
	oAddress.Category = tvAddressCategoryBusiness
	oAddress.Description = "Address for Joe Smith"
	oAddress.Value = 0 #station 2
	oAddress.Default = true #this will make station 2 Joe’s default address
	# Call the Validate method so that all assigned fields can be checked for correctness.
	oAddress.Validate (true)
	# Save the new User.
	oUser.Save (true)
	WScript.Echo("Done!")

def print(what):
	WScript.Echo(what)
