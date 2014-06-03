#!/usr/bin/perl -w

#NetDNA API Sample Code - Perl
#Version 2.0 Beta
#Fork from Sindbad911
#Supported by king-servers.com


package NetDNA;
use strict;

# Constructor
sub new {
        my $class = shift;
        my $self = {
                _myalias                => shift,
                _consumer_key           => shift,
                _consumer_secret        => shift,
        };
        
        bless $self, $class;
        return $self;
}

# Set the Alias
sub setAlias {
        my ( $self, $alias ) = @_;
        $self->{_myalias} = $alias if defined($alias);
        return $self->{_myalias};
}

# Set the Consumer Key
sub setKey {
        my ( $self, $alias ) = @_;
        $self->{_myalias} = $alias if defined($alias);
        return $self->{_consumer_key};
}

# Set the Consumer Secret
sub setSecret {
        my ( $self, $secret ) = @_;
        $self->{_myalias} = $secret if defined($secret);
        return $self->{_consumer_secret};
}

# Get the Alias
sub getAlias {
        my( $self ) = @_;
        return $self->{_myalias};
}

# Get the Consumer Key
sub getKey {
        my( $self ) = @_;
        return $self->{_consumer_key};
}

# Get the Consumer Secret
sub getSecret {
        my( $self ) = @_;
        return $self->{_consumer_secret};
}

1;