#!/usr/bin/perl -W

use strict;

use Net::SFTP::Foreign;

my $s = Net::SFTP::Foreign->new("192.168.1.100", autodie => 1, user => "user"); 

$s->error and die "Unable to connect to remote host: " . $s->error;

# return all directories
my $ls = $s->ls("/home/USER/", wanted => qr/^[A-Z]/)
    or die "Unable to retrieve directory: " . $s->error;

print "$_->{filename}\n" for(@$ls);
