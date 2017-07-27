# shell
<pre>
curl 'http://stats.webp2p.le.com:20080/query/table_all_share?type=min&from=Wed%20Mar%2001%202017%2008:00:00%20GMT+0800%20(CST)&to=Thu%20Mar%2002%202017%2008:00:00%20GMT+0800%20(CST)&typVar=-1&verVar=-1&idcVar=-1&gid=-1&terminalId=-1&platid=-1&splatid=501&appid=-1&methods=-1&p=-1&sid=-1&table_all_share=1&p1=undefined&p2=undefined' \
-H 'Cookie: sso_curr_country=US; language=en-us; tj_uuid=-_14979538462220435445; tj_lc=bbfa8751c44ebe2a40d2bbc5c67f26fc; tj_env=1; ark_uuid=92a9c6baa04c4284b7546d7218208e9d; bd_xid=bbfa8751c44ebe2a40d2bbc5c67f26fc; tj_v2c=-864922_1; unLogPlayTime=1; ssoCookieSynced=1; sID=SESS_656151_90; user=zhangsan; authorized=true; Secure' \
-H 'Accept-Encoding: gzip, deflate' \
-H 'Accept-Language: zh-CN,zh;q=0.8,en;q=0.6,la;q=0.4' \
-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36' \
-H 'Content-Type: application/json; charset=utf-8' \
-H 'Accept: application/json, text/javascript, */*; q=0.01' \
-H 'Referer: http://stats.webp2p.le.com:20080/main' \
-H 'X-Requested-With: XMLHttpRequest' \
-H 'Connection: keep-alive' --compressed
</pre>

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