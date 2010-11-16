<cfsetting EnableCFOutputOnly="no">

<cfset confirmationCode = Hash(FORM.email & REQUEST.salt)>
<cfparam name="FORM.password" type="string" min="32" max="32" default="##">

<cfquery name="CreateUser" dataSource="#request.dataSource#" result="queryResult">
	INSERT INTO users 
	          (
					email
					, password
					, zipcode
					, confirmation_code
			  ) VALUES (
					 <cfqueryparam value="#FORM.email#"       cfsqltype="cf_sql_char">
				   , <cfqueryparam value="#FORM.password#"    cfsqltype="cf_sql_char" maxlength="32">
				   , <cfqueryparam value="#FORM.zipcode#"     cfsqltype="cf_sql_char" maxlength="5">
	               , <cfqueryparam value="#confirmationCode#" cfsqltype="cf_sql_char" maxlength="32">
			  )
</cfquery>

<cfif queryResult.id neq 0>
	<cfmail to="#FORM.email#" from="frogstarr78@gmail.com" subject="Registration Confirmation">

		<cfmailpart type="html">
			Thank you for registering with <a href="cfml.example.com" target="_new">CFML Example</a>
			Please follow or copy and past this url to confirm you submission.

			<a href="http://cfml.example.com/confirmation_check.cfm?who=#queryResult.id#&code=#confirmationCode#">http://cfml.example.com/confirmation_check.cfm?who=#queryResult.id#&code=#confirmationCode#</a>
			Confirmation will expire in 1 hour.
		</cfmailpart>

		<cfmailpart type="text">
			Thank you for registering with cfml.example.com
			Please copy and past this url to confirm you submission.

			http://cfml.example.com/confirmation_check.cfm?who=#queryResult.id#&code=#confirmationCode#
			Confirmation will expire in 1 hour.
		</cfmailpart>
	</cfmail>

	<cfoutput>
		An email has been sent to your email address.
		Please check your email before continuing.
	</cfoutput>
</cfif>
