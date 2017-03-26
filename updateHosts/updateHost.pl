#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;
use Data::Dumper;

my $backupFile = '/etc/hosts_backup';
if(-e $backupFile)
{
	# Do nothing
	;
}
else
{
	# Backup /etc/hosts
	print "/etc/hosts => $backupFile\n";
	`sudo cp /etc/hosts $backupFile`;
}

my $url = 'https://raw.githubusercontent.com/racaljk/hosts/master/hosts';

# Fetch file
my $content = get($url);

# Check if fetching file successfully
if(not defined($content))
{
	print "Cloudn't get it!\n";
	exit 1;
}


my $homeDir = $ENV{HOME};
my $hostName = `hostname`;

if(-e "$homeDir/hosts")
{
	print "Delete old hosts file ...\n";
	unlink "$homeDir/hosts";
}

open my $backupFd, '<', "$backupFile";
open my $fd, '>>', "$homeDir/hosts";

print $fd "#"x20 ." Original Hosts File " ."#"x20 ."\n";
while(my $line = <$backupFd>)
{
	print $fd $line;
}

print $fd "\n\n"."#"x20 ." GitHub Hosts File " ."#"x20 ."\n";
print $fd $content;

close $fd;
close $backupFd;

print "$homeDir/hosts => /etc/hosts\n";
`sudo cp $homeDir/hosts /etc/hosts`;
print "Success!\n";
exit 0;
