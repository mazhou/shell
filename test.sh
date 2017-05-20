echo "1234567" | sed '{
	:start
	s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/p
	t start
}'
echo '\nno p: \n'
echo "1234567" | sed '{
	:start
	s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/
	t start
}'


