<?php

$h = array(
	$a = 'a' => array(
		$b = 'b' => array(
			'c' => 1
		)	
	)	
);

print_r($h);

print "$h[a] ";
print_r($h['a']);
print "\n";

print "\$h[a][b] ";
print_r($h['a']['b']);
print "\n";

print "\$h[a][b][c] ";
print_r($h['a']['b']['c']);
print "\n";

print "\$h[a][b] ";
$href &= $h['a']['b'];
print_r($href);
print "\n";

?>
