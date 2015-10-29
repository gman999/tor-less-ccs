#!/bin/sh -x
# list the country codes of places without public Tor relays
# it's ugly, and needs to lookup CCs to translate to country names

get="${get:-/usr/local/bin/torsocks /usr/bin/ftp}"
torfile="${torfile:-Tor_query_EXPORT.csv}"
torsrc="${torsrc:-"https://torstatus.rueckgr.at/query_export.php/$torfile"}"
ccfile="${ccfile:-country_names_and_code_elements_txt-temp.htm}"
ccsrc="${ccsrc:-"http://www.iso.org/iso/home/standards/country_codes/$ccfile"}"
torlist="${torlist:-torccs}"
isolist="${isolist:-isoccs}"
output="${output:-tor-less-ccs.txt}"

# grab current public Tor relay list and . . .

$get $torsrc/$torfile;

# . . .output ISO 3166-1 country codes
cat $torfile | tail -n +2 | cut -d "," -f 2 | sort | uniq >$torlist;

# grab current ISO 3166-1 country codes list. . .

$get $ccsrc/$ccfile;

# and create two lists isolist and lookuplist

cat $ccfile | tail -n +2 | cut -d ";" -f 2 | sort | tail -n +2  >$isolist;

# output the country codes without public Tor relays to file

diff -b $isolist $torlist |  grep "<" | tr -d "< " >$output;
