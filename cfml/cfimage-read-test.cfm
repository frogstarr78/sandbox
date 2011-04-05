spawn ssh -p 10022 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@bellsofireland.viviotech.net cat /home/davidboyer/cffocus.com/bugtest/test2.cfm
Warning: Permanently added '[bellsofireland.viviotech.net]:10022,[205.210.188.25]:10022' (RSA) to the list of known hosts.
root@bellsofireland.viviotech.net's password: 
<cfscript> 
writeoutput("Temp Dir : " & createobject("java","java.lang.System").getProperty("java.io.tmpdir") ); 
</cfscript>
<cfoutput>
	#GetTempDirectory()#
</cfoutput>
<cftry>
<!--- Make sure the file isn't already there --->
<cfif FileExists(GetTempDirectory() & 'me.jpg')>
	<cfset FileDelete(GetTempDirectory() & 'me.jpg') />
	* Removed previous version<br />
</cfif>
<!--- Copy the file to the temp directory, mimics the uploading done by mura --->
<cffile action="copy" source="#ExpandPath('./me.jpg')#" destination="#GetTempDirectory()#me.jpg" />
* Copied<br />
<!--- Perform imageread function --->
<cfset img = ImageRead(GetTempDirectory() & 'me.jpg') />
* Read the image<br />
<cfcatch type="any">
<cfdump var="#cfcatch#" />
<cfabort>
</cfcatch>
</cftry>
