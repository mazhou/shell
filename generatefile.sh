#! /bin/sh  

read -d '' file1 << EOF
select c1, c2 from foo
where c1='something'
EOF

read -d '' file2 << EOF
{
	"comment": "",
	"ignore": "test",
	"package": [
		{
			"checksumSHA1": "b5bkSc2hlmUV7PlLY6JlLwiJpiE=",
			"path": "bazil.org/fuse",
			"revision": "371fbbdaa8987b715bdd21d6adc4c9b20155f748",
			"revisionTime": "2016-08-11T21:22:31Z"
		},
		{
			"checksumSHA1": "Yx1MU40fyGe7hhqW9+dkv8kXa60=",
			"path": "gopkg.in/urfave/cli.v1",
			"revision": "cfb38830724cc34fedffe9a2a29fb54fa9169cd1",
			"revisionTime": "2017-08-11T01:42:03Z"
		}
	],
	"rootPath": "ethereum/go-ethereum"
}

EOF


echo "$file1" >> file1.sql \
&& \
echo "$file2" >> file2.json
