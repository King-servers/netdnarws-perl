#!/usr/bin/perl -w

#NetDNA API Sample Code - Perl
#Version 2.0 Beta
#Fork from Sindbad911
#Supported by king-servers.com

package NetDNARWS;
use NetDNA;
use strict;
use warnings;
use JSON;
use Net::OAuth;
use LWP::UserAgent;
use URI;
use Data::Dumper;
$Net::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0A;
our @ISA = qw(NetDNA);    # inherits from NetDNA
my $base_url = "https://rws.netdna.com/";
my $debug;

# Override constructor
sub new {
	my ($class) = @_;
	# Call the constructor of the parent class, NetDNA.
	my $self = $class->SUPER::new( $_[1], $_[2], $_[3] );
	# Add few more attributes
	bless $self, $class;
	return $self;
}

sub execute{
	my( $self, $address, $type, $debug, @data ) = @_;
	$address = $base_url . $self->{_myalias} . $address;


	if($debug){
		print "Making " .  uc($type) . " request to " . $address . "\n";
	}


	my $url = shift;
	my $ua = LWP::UserAgent->new;
	my $res;
			if($type eq "post" || $type eq "put"){

			my %hash_data = ();

				for(my $i = 0; $i < scalar(keys $data[0]); $i++){
					if($i % 2 == 0){
						$hash_data{$data[0][$i]} = $data[0][$i+1];
					}

				}

			# Create request (POST, PUT)
			my $request = Net::OAuth->request("request token")->new(
									consumer_key => $self->{_consumer_key},
									consumer_secret => $self->{_consumer_secret},
									request_url => $address,
									request_method => uc($type),
									signature_method => 'HMAC-SHA1',
									timestamp => time,
									nonce => '',
									callback => '',
									extra_params => \%hash_data);

			# Sign request
			$request->sign;

				# Get message to the Service Provider
				if($type eq "post"){
					$res = $ua->post($request->to_url, \@data);
				}elsif($type eq "put"){

					# Create param string
					my $param_string;
					for(my $i = 0; $i < scalar(keys $data[0]); $i++){
						if($i % 2 == 0){
							$param_string .= $data[0][$i] . "=" . $data[0][$i+1] . "&";
						}
					}

				my $req = HTTP::Request->new("PUT", $request->to_url);
				$req->content($param_string);
				$res = $ua->request($req);


				}

			}else{
				my $request;
				if( $type eq "delete"){
					$request = Net::OAuth->request("request token")->new(
										consumer_key => $self->{_consumer_key},
										consumer_secret => $self->{_consumer_secret},
										request_url => $address,
										request_method => 'DELETE',
										signature_method => 'HMAC-SHA1',
										timestamp => time,
										nonce => '',
										callback => '');

					$request->sign;
					$res = $ua->delete($request->to_url);
				}elsif( $type eq "get"){
					# Create request (GET)
					$request = Net::OAuth->request("request token")->new(
										consumer_key => $self->{_consumer_key},
										consumer_secret => $self->{_consumer_secret},
										request_url => $address,
										request_method => 'GET',
										signature_method => 'HMAC-SHA1',
										timestamp => time,
										nonce => '',
										callback => '');

					$request->sign;
					$res = $ua->get($request->to_url);
				}

			}

	# Decode JSON
	my $decoded_json = decode_json($res->content);

	if($debug){
		print "Response code: " . $decoded_json->{code} . "\n";
	}



	if($decoded_json->{code} == 200 || $decoded_json->{code} == 201) {
		if($debug){
			print Dumper $decoded_json->{data};
		}
			return $decoded_json->{data};
	} else {
		if($debug){
			print Dumper $decoded_json->{error};
		}
			return $decoded_json->{error};
	}



}

1;