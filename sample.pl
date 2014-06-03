#!/usr/bin/perl -w

#NetDNA API Sample Code - Perl
#Version 2.0 Beta
#Fork from Sindbad911
#Supported by king-servers.com

use NetDNARWS;
use Data::Dumper;

$api = new NetDNARWS( 'companyalias', 'fbe242bcaf4c95ed39a56da', 'e1429ab0873d0f13b62');

my @array_params = ("email"=>'vv@vv.ru',"password"=>"pass212woAs3rd111","firstname"=>"Serg3e12121","lastname"=>"Gark3sha1112121");
my @array_edit =  ("email"=>'2fed@gmail.com',"firstname"=>"2Fed","lastname"=>"Deadman", "phone" => 1231231235);
											
											##Examples##
	
# list users
#print Dumper $api->execute("/users.json", "get", 0); 

#user info
#print Dumper $api->execute("/users.json/9076", "get", 0);  # 9076 - user id

#create user
#print Dumper $api->execute("/users.json", "post", 0, \@array_params); 

#update user
#$api->execute("/users.json/46629", "put", 1 ,  \@array_edit); # 46629 - user id

#delete user 
#$api->execute("/users.json/46576", "delete", 1);