# IRSSI Scripts

This is a collection of a few scripts for the IRC client IRSSI.

## xdccget.pl

Script for managing downloads from XDCC bots. The script supports queuing including pausing queue items and/or retriggering the download request manually.

### Commands:

	/xdccget queue <nickname> <number> [[-xdcc=<method>] <description>]

Queue the specified pack of the currently selected server and 'Nickname'. The description will be shown in the queue. With `-xdcc=<method>` it is possible to specify the method to be used in the request. Default is 'xdcc' as in `/msg <nickname> xdcc send <number>`

	/xdccget stat
	/xdccget
	/xdccget -l

List the download queue

	/xdccget list <nickname>

Request the XDCC list of `nickname`

	/xdccget cancel <number>

Cancel the download if currently downloading, request to being removed from queue if queued by the XDCC offerer, or remove pack `number` from the download queue.

	/xdccget pause <number>

Pause pack `number` within the local queue. Resume with the `reset` command..

	/xdccget reset <number>

Reset pack `number` so that it is unpaused and -- if download slots are still available -- triggers a download request.

	/xdccget offers [<options>] <description search pattern>

Display all the announced offers matching the given pattern or options. The announcements are continuously monitored by this script throughout all joined channels.

One or more of the following options can be used. Each option must start with a '-':

	-server=<server pattern>

Only show offers announced by bots on servers matching this pattern.

	-channel=<channel pattern>

Only show offers announced by bots on channels matching this pattern.

	-nick=<nick pattern>

Only show offers announced by bots with nicks matching this pattern.

Examples:

	/xdccget offers iron.*bluray
	/xdccget offers -nick=bot iron.*bluray
	/xdccget offers -channel=beast-xdcc iron.*bluray

Regular expressions are used to match each of the parameters.

	/xdccget help

Display help.

You can also simply use /x instead of /xdccget ;-)

### Configuration:

	xdccget_config_path

Path where this script is storing its files (queue and finished downloads). Default is `$HOME/.irssi`.

	xdccget_max_downloads

Maximum number of parallel downloads. Default is 2. A download request which is queued by the XDCC offer bot does not count against the limit. The next item in the download queue is being requested as long as download slots are available. Also other downloads not controlled by this script do not count either. It is also possible to exceed this limit if a bot sends the previously requested and queued file while there are downloads running already.

	xdccget_retry_time

Time in seconds between retries. Default is 900 (15 minutes). Retries are necessary for full offer queues of bots, bots being/becoming offline, or not getting the requested download or any understandable message regarding the request. Please DO NOT set this value to less than 300 (5 minutes) or risk being banned from the channels for spamming the bots.

## clearwin.pl

Script to clear the content of all windows. This is sometimes necessary to avoid excessive memory consumption.

The windows are cleared every x seconds whereas x is defined by the setting 'cleartimer'. Default value is 600 (5 minutes).

