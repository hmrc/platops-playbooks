#!/usr/bin/env sh

outfile=my_ip_address.html

echo "<html>" > $outfile
echo "<body>" >> $outfile
echo "<h1>" >> $outfile
curl ipinfo.io/ip >> $outfile
echo "</h1>" >> $outfile
echo "</body>" >> $outfile
echo "</html>" >> $outfile
