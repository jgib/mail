#!/usr/bin/perl
use strict;
use warnings;

my ($from, $to, $cc, $bcc, $subject, $attachment);

&check;


sub input {
	print "From: ";
	chomp($from = <>);

	print "To: ";
	chomp($to = <>);

	print "CC: ";
	chomp($cc = <>);

	print "BCC: ";
	chomp($bcc = <>);

	print "Subject: ";
	chomp($subject = <>);

	print "Text: ";
	&mail;
}

sub mail {
	system("mail","-r $from","-c $cc","-b $bcc","-s $subject","$to");	
}

sub check {
	system("which", "mail");
	my $x = $?;
	system("which", "mailx");
	my $y = $?;
	if (($x==0)||($y==0)) {
		&input;
	} else {
		print "\nmailx is not installed.\n";
		exit;
	}

}
exit;
