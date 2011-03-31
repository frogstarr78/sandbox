<cfif IsDefined("who") and IsDefined("code")>
	<cfquery name="User" dataSource="#request.dataSource#">
		SELECT email, confirmation_code, confirmation_expire
		  FROM users
		 WHERE id = <cfqueryparam value = "#who#" cfsqltype="cf_sql_integer">
	</cfquery>

	<cfif User.RecordCount eq 0>
		<cflocation url="register.cfm">
	<cfelse>
		<cfset VARIABLES.isExpired = DateDiff(NOW(), User.confirmation.expire) lt 0>
		<cfset VARIABLES.isEqual   = User.confirmation_code eq code>

		<cfif VARIABLES.isExpired or not VARIABLES.isEqual >
			<cfquery name="UpdateConfirmation" dataSource="#request.dataSource#">
				UPDATE users SET confirmation_code = Hash(User.email & REQUEST.salt), confirmation_expire = NOW() + '1 hour'::INTERVAL
				 WHERE id = <cfqueryparam value = "#who#" cfsqltype="cf_sql_integer">
			</cfquery>

			<cfif VARIABLES.isExpired>
				<cfoutput>
					The confirmation time has expired.
					<a href="index.cfm">Click</a> to re-send a new confirmation code.
				</cfoutput>
				<cfset VARIABLES.isExpired = void>
			<cfelse>
				<cfoutput>
					The supplied confirmation code does not match.<br />
					<a href="index.cfm">Click</a> to re-send a new confirmation code.
				</cfoutput>
				<cfset VARIABLES.isEqual = void>
			</cfif>
		<cfelse>
			<cfoutput>
				Thank you for registering.<br />
				<a href="index.cfm">Click</a> to continue.
			</cfoutput>
		</cfif>
	</cfif>
<cfelse>
	<cflocation url="register.cfm">
</cfif>
