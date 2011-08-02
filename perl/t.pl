#!/usr/bin/env perl

my $ip_assoc = {};

while (<>) {
	($ip, $useragent) = split('  ');
	$ip_assoc{$ip} ||= 0;
	$ip_assoc{$ip} += 1;
}

while ( my ($key, $value) = each(%ip_assoc) ) {
	print "$key => $value\n";
}

