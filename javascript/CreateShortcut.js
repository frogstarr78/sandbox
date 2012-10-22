function FindDriveLetter() {
	var DriveTypes = new Array("Unknown", "Removable", "Fixed", "Network", "CD-ROM", "RAM Disk");
	var fso, string, enm, currentDrive;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	enm = new Enumerator(fso.Drives);
	soughtAfterdriveLetter = undefined;
	for (; !enm.atEnd(); enm.moveNext()) {
		currentDrive = enm.item();
		
		switch( currentDrive.DriveLetter ){
			case "C":
				break;
	        	case "D":
				break;
	        	case "A":
				break;
	        	case "B":
				break;
			default:
				if( DriveTypes[currentDrive.DriveType] == "Removable" && currentDrive.IsReady ) {
				//if( DriveTypes[currentDrive.DriveType] == "Fixed" && currentDrive.IsReady ) {
					soughtAfterdriveLetter = currentDrive.DriveLetter;
					break;
				}
		}
	}
	return soughtAfterdriveLetter;
}

flashDrive = FindDriveLetter();
if ( flashDrive == undefined ) {
	WScript.Echo("I wasn't able to find the FlashDrive in order to create the shortcut.");
} else {
	var shell = WScript.CreateObject("WScript.Shell");
	desktop = shell.SpecialFolders("Desktop");
	link = shell.CreateShortcut(desktop + "\\Insurance.lnk");
	link.TargetPath = flashDrive + ":\\clickhere.exe";
	link.WindowStyle = 1;
	link.HotKey = "CTRL+SHIFT+I";
	link.IconLocation = flashDrive + ":\\insurance.ico";
	link.Description = "Insurance";
	link.WorkingDirectory = "C:";
	link.save();
}
