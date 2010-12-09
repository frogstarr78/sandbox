import win32com.client
import sys

def WMIDateStringToDate(dtmDate):
    strDateTime = ""
    if (dtmDate[4] == 0):
        strDateTime = dtmDate[5] + '/'
    else:
        strDateTime = dtmDate[4] + dtmDate[5] + '/'
    if (dtmDate[6] == 0):
        strDateTime = strDateTime + dtmDate[7] + '/'
    else:
        strDateTime = strDateTime + dtmDate[6] + dtmDate[7] + '/'
        strDateTime = strDateTime + dtmDate[0] + dtmDate[1] + dtmDate[2] + dtmDate[3] + " " + dtmDate[8] + dtmDate[9] + ":" + dtmDate[10] + dtmDate[11] +':' + dtmDate[12] + dtmDate[13]
    return strDateTime

def listMacs(strComputer):
	objWMIService = win32com.client.Dispatch("WbemScripting.SWbemLocator")
	objSWbemServices = objWMIService.ConnectServer(strComputer,"root\cimv2")
	colItems = objSWbemServices.ExecQuery("SELECT IPAddress FROM Win32_NetworkAdapterConfiguration")
	for objItem in colItems:
		if objItem.IPAddress:
			print objItem.IPAddress	

	colItems = objSWbemServices.ExecQuery("SELECT * FROM Win32_NetworkAdapter")
	ret = "Computer - " + strComputer
	for objItem in colItems:
		if objItem.SystemName != None:
			ret += "\n\tProductName - " + ` objItem.SystemName`
		if objItem.ProductName and "Ethernet" in objItem.ProductName or \
		   objItem.Description and "Ethernet" in objItem.Description:
			if objItem.MACAddress:
				ret += "\n\tProductName - " + ` objItem.ProductName`
#				ret += "\n\t\tAdapterType - " + ` objItem.AdapterType`
				ret += "\n\t\tMACAddress - " + objItem.MACAddress
		print objItem.NetworkAddresses
	return ret

#	for objItem in colItems:
#		if objItem.AdapterType != None:
#			print "AdapterType:" + ` objItem.AdapterType`
#		if objItem.AdapterTypeId != None:
#			print "AdapterTypeId:" + ` objItem.AdapterTypeId`
#		if objItem.AutoSense != None:
#			print "AutoSense:" + ` objItem.AutoSense`
#		if objItem.Availability != None:
#			print "Availability:" + ` objItem.Availability`
#		if objItem.Caption != None:
#			print "Caption:" + ` objItem.Caption`
#		if objItem.ConfigManagerErrorCode != None:
#			print "ConfigManagerErrorCode:" + ` objItem.ConfigManagerErrorCode`
#		if objItem.ConfigManagerUserConfig != None:
#			print "ConfigManagerUserConfig:" + ` objItem.ConfigManagerUserConfig`
#		if objItem.CreationClassName != None:
#			print "CreationClassName:" + ` objItem.CreationClassName`
#		if objItem.DeviceID != None:
#			print "DeviceID:" + ` objItem.DeviceID`
#		if objItem.ErrorCleared != None:
#			print "ErrorCleared:" + ` objItem.ErrorCleared`
#		if objItem.ErrorDescription != None:
#			print "ErrorDescription:" + ` objItem.ErrorDescription`
#		if objItem.Index != None:
#			print "Index:" + ` objItem.Index`
#		if objItem.InstallDate != None:
#			print "InstallDate:" + WMIDateStringToDate(objItem.InstallDate)
#		if objItem.Installed != None:
#			print "Installed:" + ` objItem.Installed`
#		if objItem.LastErrorCode != None:
#			print "LastErrorCode:" + ` objItem.LastErrorCode`
#		if objItem.MACAddress != None:
#			print "MACAddress:" + ` objItem.MACAddress`
#		if objItem.Manufacturer != None:
#			print "Manufacturer:" + ` objItem.Manufacturer`
#		if objItem.MaxNumberControlled != None:
#			print "MaxNumberControlled:" + ` objItem.MaxNumberControlled`
#		if objItem.MaxSpeed != None:
#			print "MaxSpeed:" + ` objItem.MaxSpeed`
#		if objItem.Name != None:
#			print "Name:" + ` objItem.Name`
#		if objItem.NetConnectionID != None:
#			print "NetConnectionID:" + ` objItem.NetConnectionID`
#		if objItem.NetConnectionStatus != None:
#			print "NetConnectionStatus:" + ` objItem.NetConnectionStatus`
#		print "NetworkAddresses:"
#		strList = " "
#		try :
#			for objElem in objItem.NetworkAddresses :
#				strList = strList + `objElem` + ","
#		except:
#			strList = strList + 'null'
#		print strList
#		if objItem.PermanentAddress != None:
#			print "PermanentAddress:" + ` objItem.PermanentAddress`
#		if objItem.PNPDeviceID != None:
#			print "PNPDeviceID:" + ` objItem.PNPDeviceID`
#		print "PowerManagementCapabilities:"
#		strList = " "
#		try :
#			for objElem in objItem.PowerManagementCapabilities :
#				strList = strList + `objElem` + ","
#		except:
#			strList = strList + 'null'
#		print strList
##		if objItem.PowerManagementSupported != None:
##			print "PowerManagementSupported:" + ` objItem.PowerManagementSupported`
#		if objItem.ServiceName != None:
#			print "ServiceName:" + ` objItem.ServiceName`
#		if objItem.Speed != None:
#			print "Speed:" + ` objItem.Speed`
#		if objItem.Status != None:
#			print "Status:" + ` objItem.Status`
#		if objItem.StatusInfo != None:
#			print "StatusInfo:" + ` objItem.StatusInfo`
#		if objItem.SystemCreationClassName != None:
#			print "SystemCreationClassName:" + ` objItem.SystemCreationClassName`
#		if objItem.SystemName != None:
#			print "SystemName:" + ` objItem.SystemName`
#		if objItem.TimeOfLastReset != None:
#			print "TimeOfLastReset:" + WMIDateStringToDate(objItem.TimeOfLastReset)

if __name__ == "__main__":
	if len(sys.argv)>1:
		for machine in sys.argv[1:]:
			print listMacs(machine)

	print listMacs(".")
