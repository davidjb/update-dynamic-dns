# Update Duck DNS

Very simple shell script for updating Duck DNS with your IP address from a
given interface (or letting Duck figure out your public IP).

## Usage

    ./update-duckdns.sh domain token [interface]

Both `domain` and `token` are required and `interface` is required if you'd
like to use a local interface's IP address (such as `eth2` or `wlan0`). If
`interface` is omitted, Duck DNS will determine your public IP address and use
that.
