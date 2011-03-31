<div id="nav">
	<cfif IsDefined("REQUEST.loggedIn") AND REQUEST.loggedIn>
		<cfoutput>
			Logged in as #User.name# <a href="login.cfm?action=logout">Logout</a>
		</cfoutput>
	<cfelse>
		<cfoutput>
			<a href="login.cfm?action=login">Login or Register</a>
		</cfoutput>
	</cfif>
</div>
