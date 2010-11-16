<cfsetting EnableCFOutputOnly="no">

<!--
	Client hashes password before submit. 
	Sending username and password here ensures
	that we aren't hinting to the login in user agent
	that the supplied user may exist.
-->
<cfquery name="AuthenticateUser" datasource="#request.dataSource#">
	SELECT *
	  FROM users
	 WHERE email = #FORM.username#
	   AND password = #FORM.password#
</cfquery>

<cfif AuthenticateUser.RecordCount eq 0>
	<!-- Index is 0 so Allow 5 attempts before locking user -->
	<cfif SESSION.loginAttempts eq 4> 
		<cfquery name="HasUser" datasource="#request.dataSource#">
			SELECT id
			  FROM users
			 WHERE email = #FORM.username#
		</cfquery>
		<!-- Ensure we have a user by that name to update -->
		<cfif HasUser.RecordCount neq 0>
			<cfquery name="LockUser" datasource="#request.dataSource#">
				UPDATE users
				   SET locked = 'true'
				 WHERE id = #HasUser.id#
			</cfquery>
		</cfif>
		<cfset variables.errorMessage = "The user <b>" & FORM.username & "</b> is locked.<br />Please contact support if you think this is incorrect or to resolve this.">
	<cfelse>
		<cfset SESSION.loginAttempts = SESSION.loginAttempts + 1>
		<cfset variables.errorMessage = "The password supplied for user <b>" & FORM.username & "</b> was incorrect.<br />Please try again.">
		<cfinclude template="login.cfm">
		<cfabort>
	</cfif>
<cfelse>
	<cfset SESSION.loginAttempts = 1>
	<cfset COOKIE.userID = AuthenticateUser.id>
	<cflocation url="index.cfm">
</cfif>
