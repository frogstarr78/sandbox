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
		<cfform method="POST">
			<center>
				<fieldset>
					<legend>
						<span class="signin_button signin_down"><a href="login.cfm">login?</a></span> | <span class="signin_button"><a href="register.cfm">register?</a></span>
					</legend>
					<div id="signin_login_content" class="signin_show">
						<cfinput name="username"               tabIndex="1" type="text"     value="Email"                                                                  required="yes" message="Missing or invalid username."                                                                 validate="email"                       /> <br />
						<cfinput name="login_password_default" tabIndex="2" type="text"     value="Password"   class="login_password_w_default subdued"     maxLength="20"                                                                                                                                                              />
						<cfinput name="password"               tabIndex="3" type="Password"                    class="login_password_w_default signin_hide" maxLength="20" required="Yes"                                        onBlur="if(this.value != '' ) this.value = calcMD5(this.value)"                  validateAt="onServer" /><br />
						<cfinput name="submit"                 tabIndex="4" type="Submit"   value="Lemmie In!"                                                                                                                                                                                                                          />
					</div>
				</fieldset>
			</center>
		</cfform>

		<cfif IsDefined("FORM.username") and IsDefined("FORM.password")>
			<cfoutput>
				username: #FORM.username#; password: #FORM.password#<br />
			</cfoutput>
		</cfif>
	</body>
</html>
