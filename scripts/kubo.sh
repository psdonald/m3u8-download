rm -v curlresult.txt
read -p "How many episodes are there in total? " ep
for (( i=1; i<="$ep"; i++ )); do
	while read -r line; do
		echo "$line" >> curlresult.txt
	done <<< $(curl `echo $1 | sed -e 's/nid\-./nid\-'$i'/g'` | grep -ohP https.*?index\.m3u8 | sed -e '/\:.*?\:/d' | sed -e 's/https.*\%24//g' -e 's/\\//g')
done
echo "created curlresult.txt"
