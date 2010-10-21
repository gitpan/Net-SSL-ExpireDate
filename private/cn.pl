#!/usr/bin/env perl
use strict;
use warnings;
use Net::SSL::ExpireDate;
use Crypt::OpenSSL::X509;

my @cert_files = @ARGV;

for my $cert_file (@cert_files) {
    my $x509 = Crypt::OpenSSL::X509->new_from_file($cert_file);
    print $x509->subject, "\n";

    my $ed = Net::SSL::ExpireDate->new( file  => $cert_file );
    print $ed->begin_date , "\n";
    print $ed->expire_date, "\n";
}

__END__
$ ./cn.pl mail.google.com.pem
C=US, ST=California, L=Mountain View, O=Google Inc, CN=mail.google.com
2008-05-02T16:32:54
2009-05-02T16:32:54
