#!/usr/bin/perl -w

#NetDNA API Sample Code - Perl
#Version 1.1a

use NetDNARWS;
use Data::Dumper;

$api = new NetDNARWS( 'bastosventures', '8eead644a4614b99bcd', 'ab81cf43397eb0e');

$api->get("/account.json");

$api->get("/account.json", 1);
