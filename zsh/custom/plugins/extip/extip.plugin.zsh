alias extip='echo "ipv4: $(dig +short myip.opendns.com @resolver1.opendns.com)\nipv6: $(dig +short -6 myip.opendns.com aaaa @resolver1.opendns.com)"'
