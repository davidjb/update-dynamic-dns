# Update Dynamic DNS platforms

Very simple shell script for updating Duck DNS or Namecheap with your IP
address from a given interface (or letting the remote side figure out your
public IP).

## Usage

    ./update-duckdns.sh domain token [interface]
    ./update-namecheap.sh host domain password [interface]

Both `domain` and `token` are required and `interface` is required if you'd
like to use a local interface's IP address (such as `eth2` or `wlan0`). If
`interface` is omitted, the remote side will determine your public IP address
and use that.
