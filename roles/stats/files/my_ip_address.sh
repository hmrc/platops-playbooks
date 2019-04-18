#!/usr/bin/env sh

outfile=my_ip_address.html

echo "<html>" > $outfile
echo "<style>" >> $outfile
echo "body { background: #2e3440 }" >> $outfile
echo "section { font-size: 12em; color: #ebcb8b; border-radius: 1em; padding: 1em; position: absolute; top: 50%; left: 50%; margin-right: -50%; transform: translate(-50%, -50%) }" >> $outfile
echo "</style>" >> $outfile
echo "<section>" >> $outfile
curl ipinfo.io/ip >> $outfile
echo "</section>" >> $outfile
echo "</html>" >> $outfile
