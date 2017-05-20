sed 's/^/\$\(\"\<td\>\<\/td\>\"\)\.appendTo\(tr\)\.text\(this\.policy_list_body\[elm\]\[/'  txt | tee new.txt
sed 's/,$/\]\);/'  new.txt | tee new1.txt
sed = new1.txt | sed 'N; s/\n/   /'| tee new3.txt


sed '{
	/^$/d
	$!G
}' new1.txt| tee new2.txt
