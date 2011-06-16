<html>
<head>
<title>R1Api Test Page</title>
</head>
<body>

<form method="post" action="<?php echo $PHP_SELF;?>">
Username: 
<input type="text" name="username">
<br>
Email Address: 
<input type="text" name="emailAddress">
<br>
Password:
<input type="text" name="password">
<br>
<input type="submit" value="AddNewUser">
</form>

<?php

require_once('xmlrpc.inc');

$username = $_POST["username"];
$emailAddress = $_POST["emailAddress"];
$password = $_POST["password"];

$r1admin = "admin";
$r1pass = "r1soft";

$client = new xmlrpc_client('http://10.50.6.13:8084/xmlrpc');
$client->setCredentials($r1admin, $r1pass);
#$client->debug = true;

$xmlrpc_msg = new xmlrpcmsg('user.addBasicUser', array(
        new xmlrpcval($username, 'string'),
        new xmlrpcval($emailAddress, 'string'),
        new xmlrpcval($password, 'string')
));


$reply = $client->send($xmlrpc_msg);
if (!$reply) {
    print "<p>Could not connect to HTTP server.</p>";
} elseif ($reply->faultCode()) {
    print "XML-RPC Fault #" . $reply->faultCode() . ": " .
        $reply->faultString();
} else  {

$val = $reply->value();

print "The UID is " . $val->scalarval();
}
?>

</body>
</html>

