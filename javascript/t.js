
//TVApplicationType
var tvApplicationTypeClient = 0
var tvApplicationTypeAdministrator = 1

//TVServerConnectionLevel. Default 0.
var tvServerConnectionLevelBasic = 0xffffffff
var tvServerConnectionLevelFull = 0


//CheckVersions Default -1 (true).
var CheckVersionsTrue = -1
var CheckVersionsFalse = 0


//TVStationUsage
var tvStationUsageOwner = 0
var tvStationUsageOwnerAndForwardCalls = 1
var tvStationUsageVisitor = 2

//TVAddressType. Default 1.
var tvAddressTypePhoneNumber = 1
var tvAddressTypeIP = 2
var tvAddressTypeStation = 3
var tvAddressTypeUser = 4
var tvAddressTypeEmail = 5
var tvAddressTypeCustom = 6
var tvAddressTypeExtension = 6
var tvAddressTypeName = 7
var tvAddressTypeApplication = 8
var tvAddressTypePlugin = 8
var tvAddressTypeAutoAttendant = 9
var tvAddressTypeWorkgroup = 10
var tvAddressTypeQueue = 11
var tvAddressTypeUnused = 12
var tvAddressTypeDID = 12
var tvAddressTypeUserDefaultLocation = 13
var tvAddressTypeVoiceMail = 14
var tvAddressTypeVoiceMailAccess = 15
var tvAddressTypeAccountLogon = 15
var tvAddressTypeHoldMenu = 16
var tvAddressTypeUnparkMenu = 21

//TVAddressSubType. 
var tvAddressSubTypeDoNotUseRules = 0
var tvAddressSubTypeUseRules = 8
var tvAddressSubTypePager = 16

//Service as IDialingService. Optional.
// this is the hard part. not impossible but difficult
// for internal calls this would be something like 
// [Session Object].User.[user specific params]

//TVAddressCategory.
var tvAddressCategoryNone = 0
var tvAddressCategoryBusiness = 1
var tvAddressCategoryHome = 2
var tvAddressCategoryMobile = 3
var tvAddressCategoryBusiness2 = 4
var tvAddressCategoryHome2 = 5
var tvAddressCategoryOther = 6

try{
	tvSess = GetObject("", "TeleVantage.Session")
} catch(e){
	tvSess = new ActiveXObject("TeleVantage.Session")
}

if(!tvSess.Status){
	tvSess.Logon("PHONESERVER", "Scott Noel-Hemming", "01180331", 0, tvApplicationTypeClient, "32401", tvServerConnectionLevelFull, CheckVersionsFalse, tvStationUsageVisitor)
}

// Get the Users Folder.
var oUsersFolder = tvSess.GetDefaultFolder(tvFolderUsers)
// Create a new User object.
var oUser = oUsersFolder.Items.Add(tvClassUser)
// var User properties.
oUser.FirstName = "Joe"
oUser.LastName = "Smith"
oUser.extension = "4992"
oUser.Company = "Joe’s Stuff, Inc."
// Create a new Address object.
var oAddress = oUser.Addresses.Add()
// var the Address properties for the new User.
oAddress.AddressType = tvAddressTypeStation
oAddress.Category = tvAddressCategoryBusiness
oAddress.Description = "Address for Joe Smith"
oAddress.Value = 0 
//station 2
oAddress.Default = true 
//this will make station 2 Joe’s default address
// Call the Validate method so that all assigned fields can be checked for correctness.
oAddress.Validate (true)
// Save the new User.
oUser.Save (true)
wscript.echo("done")
