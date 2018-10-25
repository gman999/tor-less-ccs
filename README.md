##Not that these inelegant scripts were replaced by https://github.com/torbsd/tdp-onion-stats##

"tor-less-ccs.sh" is a portable shell script that lists the ISO 3166-1 two-digit country codes that are without public Tor relays.

The script merely peforms a diff(1) of sorts between the official ISO 3166-1 country codes and the currently available list of public Tor relays from a specified "TorStatus" web site.

In its present form, it's ugly and needs to do a lookup to translate the two-digit country codes into full country names. But it does work.
