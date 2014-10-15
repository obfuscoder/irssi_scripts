
use strict;
use warnings;

use vars qw($VERSION %IRSSI);
$VERSION = "20030208";
%IRSSI = (
    authors     => "Obfuscoder",
    contact     => "obfuscoder\@obfusco.de",
    name        => "clearwins",
    description => "clears all windows periodically",
    license     => "GPLv2",
    changed     => "$VERSION",
    commands	=> "clearwin"
);

use Irssi 20020324;

use vars qw($timer $timeout);

sub clear_timeout {
	my @wins = Irssi::windows();
	for my $win (@wins) {
		$win->command("sb clear");
	}
	print "Cleared.";
}

Irssi::settings_add_int($IRSSI{'name'}, 'cleartimer', 600);

$timeout = Irssi::settings_get_int('cleartimer');

print CLIENTCRAP '%B>>%n '.$IRSSI{name}." $VERSION loaded. Clearing every $timeout seconds.";
$timer = Irssi::timeout_add($timeout*1000, 'clear_timeout', 0);
