<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Sign-in</title>
		<link rel="stylesheet" type="text/css" href="style/auth.css" />
		<cfset jsFiles = ArrayNew(1)>
		<cfset ArrayAppend( jsFiles, "javascript/md5.js" ) >
		<cfset ArrayAppend( jsFiles, "javascript/jquery.js" ) >
		<cfset ArrayAppend( jsFiles, "javascript/form_magic.js" ) >
		<cfjavascript src="#jsfiles#" minimize="true">
	</head>

	<body id="body">
		<cfform method="POST" action="do_register.cfm">
			<center>
				<fieldset>
					<legend>
						<span class="signin_button"><a href="login.cfm">login?</a></span> | <span class="signin_button signin_down"><a href="register.cfm">register?</a></span>
					</legend>
					<div id="signin_register_content" class="signin_show signin_hide">
						I would like to access the features of your totally awesome site!! I would like to provide my
						<cfinput name="email"                 tabIndex="5" type="text"     value="email address"     required="yes"                                                            message="Missing or invalid username." validate="email"                                                                                 onclick="if(this.value == this.defaultValue) this.value = '';"                                />
						as my username. I would like to provide my
						<cfinput name="zipcode"               tabIndex="6" type="text"     value="zip code"          required="yes"                                                            message="Missing or invalid zip."      validate="zipcode" maxlength="5"                                                                                                                                size="5"                       />
						for location based service. I can provide an
						<cfinput name="join_password_default" tabIndex="7" type="text"     value="optional password"                class="join_password_w_default subdued"     maxLength="20"                                                                                                                                                                                                                                       />
						<cfinput name="password"              tabIndex="8" type="Password"                           required="no"  class="join_password_w_default signin_hide" maxLength="20"                                                                         onBlur="if(this.value != '' ) this.value = calcMD5(this.value)"                                                                         validateAt="onServer" />
						or one will be generated and sent to me. Please
						<cfinput name="submit"                tabIndex="9" type="Submit"   value="sign me up"                                                                                                                                                                                                                                                                                                                        /> for your service.
					</div>
				</fieldset>
			</center>
		</cfform>

		<cfoutput>
			Salt = '#REQUEST.salt#'
		</cfoutput>
		<cfif IsDefined("FORM.username") and IsDefined("FORM.password")>
			<cfoutput>
				username: #FORM.username#; password: #FORM.password#<br />
			</cfoutput>
		</cfif>
	</body>
</html>
