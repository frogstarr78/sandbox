<!--

	Author: Scott Noel-Hemming
	Date: June 16, 2010
	Function: Standard Application Variables

-->

<cfcomponent output="false">

	<cfset this.name              = "ColdFusion Sampler">

	<!-- Visitor Variable Storage -->
	<cfcookie name="VisitStart" value="#NOW()#" domain="example.com">
	<!--cfset this.applicationTimeout = CreateTimeSpan(0, 0, 0, 45)-->

	<!-- client Storage options -->
	<cfset this.clientManagement  = "no">


	<!-- Session options -->
	<cfset this.sessionManagement = "yes">
	<!--cfset this.sessionTimeout    = CreateTimeSpan(0, 0, 0, 30)-->
	<!-- Visitor Variable Storage -->

	<!-- Includes -->
	<!-- Includes -->

	<!-- Start Application Special functions -->
	<cffunction name="onApplicationStart">
		<!--cfset Application.currentSessions = 0-->
	</cffunction>

	<cffunction name="onRequestStart">
		<cfset REQUEST.dataSource = "pgSampler">
		<!--cfset REQUEST.loggedIn = "APPLICATION.isLoggedIn" -->
		<cfinvoke name="APPLICATION" method="isLoggedIn" returnVariable="REQUEST.loggedIn">
		</cfinvoke>

		<cfif REQUEST.loggedIn>
			<cfquery name="User" dataSource="#required.dataSource#">
				SELECT *
				  FROM users
				 WHERE id = #COOKIE.userID#
			</cfquery>
		</cfif>

		<cfset REQUEST.salt = DateFormat(NOW(), "ddd dd mmmm yyyy ") & TimeFormat(NOW(), "HH:mm:ss t") & " add some salt">	
	</cffunction>
	<!-- End Application Special functions -->

	<cffunction name="onSessionStart">
		<cfset SESSION.loginAttempts = 0>
	</cffunction>

	<cffunction name="onError">
		<cfargument name="Exception" required="yes" type="any"    />
		<cfargument name="EventName" required="yes" type="string" />
	
		<!--- Log all errors in an application-specific log file. --->
		<cflog file="#This.Name#" text="Event Name: #EventName#"   type="error" >
		<cflog file="#This.Name#" text="Message: #Exception.message#" type="error" >

		<!--- Throw validation errors to ColdFusion for handling. --->
		<cfif Find("org.postgresql.util.PSQLException", Arguments.Exception.Detail)>
			<cfoutput>
				<p><cfdump var=#queryResult.sql#></p>
			</cfoutput>
		<cfelseif Find("coldfusion.filter.FormValidationException", Arguments.Exception.Detail)>
			<cfthrow object="#Exception#">
		<cfelse>
			<!--- You can replace this cfoutput tag with application-specific error-handling code. --->
			<cfoutput>
				<p>Error Event: <b>#EventName#</b></p>
				<p>Error details:<br />
					<cfdump var=#Exception#>
				</p>
			</cfoutput>
		</cfif>
	</cffunction>

	<cffunction name="isLoggedIn" returnType="boolean" >
		<!-- Need to add check that a user with this ID is valid -->
		<cfreturn IsDefined("COOKIE.userID")>
	</cffunction>
</cfcomponent>
