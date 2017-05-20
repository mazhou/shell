# shell
<pre>
eg1:
sed =  test.txt|grep 'parse get data:'|tee test2.txt
#test.txt file 
#'parse get data:' the file include those letter
#out test2.txt
#>>>test.txt
...
heartbeat 

broadcast 1
prase count 5 sz000796,sz000797,sz
prase count 4 sz000702,sz000703,sz
prase count 3 sz000609,sz000610,sz
prase count 2 sz000531,sz000532,sz
parse get data: 1495258399000 v_sz000702="51~正虹科技~000702~9.59~9.45~9.39~50020~28
master process msg 2 0
prase count 1 sz000099,sz000100,sz
prase count 0 sz000001,sz000002,sz
parse get data: 1495258399000 v_sz000531="51~穗恒运Ａ~000531~9.79~9.71~9.71~33249~20
master process msg 2 0
parse clear  1495258399000
parse after length 61
parse get data: 1495258399000 v_sz000001="51~平安银行~000001~8.69~8.73~8.74~294270~1
master process msg 2 0

heartbeat 
...

#<<<
test.txt

test2.txt
parse get data: 1495258399000 v_sz000702="51~正虹科技~000702~9.59~9.45~9.39~50020~28
parse get data: 1495258399000 v_sz000531="51~穗恒运Ａ~000531~9.79~9.71~9.71~33249~20
parse get data: 1495258429000 v_sz000001="51~平安银行~000001~8.69~8.73~8.74~294270~1
<pre>