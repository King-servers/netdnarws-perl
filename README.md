#We're Hiring!




# NetDNA REST Web Services Perl Client

## Requirements (open cpan)

`install JSON`

`install Net::OAuth`

`install LWP::UserAgent`

`install URI`

`install Data::Dumper`

`install IO::Socket::SSL`

`install LWP::Protocol::https`


## Installation
`wget https://github.com/King-servers/netdnarws-perl/zipball/master`

`unzip master`

`cd netdna-netdnarws-perl-*/`

Optionally, repository can be cloned.

`git clone git@github.com:King-servers/netdnarws-perl.git`


## Usage
```perl
#!/usr/bin/perl -w

use NetDNARWS;
use Data::Dumper;
           
$api = new NetDNARWS( 'companyalias', 'fbe242bcaf4c95ed39a56da', 'e1429ab0873d0f13b62');

											##Examples##
	
# list users
print Dumper $api->execute("/users.json", "get", 0); 

#user info
print Dumper $api->execute("/users.json/9076", "get", 0);  # 9076 - user id

#create user
print Dumper $api->execute("/users.json", "post", 0, \@array_params); 

#update user
$api->execute("/users.json/46629", "put", 1 ,  \@array_edit); # 46629 - user id

#delete user 
$api->execute("/users.json/46576", "delete", 1);
```

## Methods
It has support for `GET`, `POST`, `PUT` and `DELETE` OAuth 1.0a signed requests.

## Syntax "execute" function 


```perl    
$api->execute("url", "type request", "debug mode", "data");
```
**url** - REST API path. For example "/users.json", returns a list users  
**type request** -  "get" or "post" or "put" or "delete". Only lower case!    
**debug mode** - mode debug output. option 1 - active mode, option 0 - deactive mode. Required option!  
**data** - information for "post" or "put" method. Only array! Required for above method request.  

## Help

If your IO Socket doesn't install properly then run:

`CPAN::Shell->force(qw(install IO::Socket::SSL));`
