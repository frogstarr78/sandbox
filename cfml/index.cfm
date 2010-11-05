<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Sampler</title>
		<style type="text/css">
			#nav {
				position: absolute;
				top: 0px;
				width: 65%
				text-align: center;
			}
		</style>
	</head>

	<body id="body">
		<cfinclude template = "navigation.cfm" >
		<ol>
			<li>
				Web
				<ol>
					<li>DNS</li>
					<li>Program</li>
					<li>Config</li>
				</ol>
			</li>
			<li>
				Email
				<ol>
					<li>DNS</li>
					<li>Spam</li>
					<li>Config</li>
				</ol>
			</li>
			<li>Database</li>
				<ol>
					<li>Program</li>
				</ol>
			</li>
			<li>Firewall</li>
		</ol>
	</body>
	<cfdump var="#server#" />
</html>
