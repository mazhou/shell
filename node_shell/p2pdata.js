var url = require('url');
var qs = require('querystring');
var http = require('http');
var url = require("url");
var path = require("path");
var fs = require("fs");
var Http = require('http');

var saveData = function (file,content){
	fs.appendFile(file, content, function (err) {
	  	if (err) throw err;
	  	// console.log('It\'s saved!');
	});
}


var from = new Date('2017-03-01');
var to = new Date('2017-03-01');

console.log(from);
var dateToPattern=function(time,fmt) {
	this.date = new Date(time);
    var o = {
    "M+" : this.date.getMonth()+1, //月份
    "d+" : this.date.getDate(), //日
    "h+" : this.date.getHours(),//%12 == 0 ? 12 : this.date.getHours()%12, //小时
    "H+" : this.date.getHours(), //小时
    "m+" : this.date.getMinutes(), //分
    "s+" : this.date.getSeconds(), //秒
    "q+" : Math.floor((this.date.getMonth()+3)/3), //季度
    "S" : this.date.getMilliseconds() //毫秒
    };
    var week = {
    "0" : "/u65e5",
    "1" : "/u4e00",
    "2" : "/u4e8c",
    "3" : "/u4e09",
    "4" : "/u56db",
    "5" : "/u4e94",
    "6" : "/u516d"
    };
    if(/(y+)/.test(fmt)){
        fmt=fmt.replace(RegExp.$1, (this.date.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
    if(/(E+)/.test(fmt)){
        fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "/u661f/u671f" : "/u5468") : "")+week[this.date.getDay()+""]);
    }
    for(var k in o){
        if(new RegExp("("+ k +")").test(fmt)){
   fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
    return fmt;
}
var getStockInfo = function(){
	var headers = {
		 'Cookie': 'sso_curr_country=US; language=en-us; tj_uuid=-_14979538462220435445; tj_lc=bbfa8751c44ebe2a40d2bbc5c67f26fc; tj_env=1; ark_uuid=92a9c6baa04c4284b7546d7218208e9d; bd_xid=bbfa8751c44ebe2a40d2bbc5c67f26fc; tj_v2c=-864922_1; unLogPlayTime=1; ssoCookieSynced=1; sID=SESS_656151_90; user=zhangsan; authorized=true; Secure' 
		 ,'Accept-Encoding': 'gzip, deflate' 
		 ,'Accept-Language': 'zh-CN,zh;q=0.8,en;q=0.6,la;q=0.4' 
		 ,'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36' 
		 ,'Content-Type': 'application/json; charset=utf-8' 
		 ,'Accept': 'application/json, text/javascript, */*; q=0.01' 
		 ,'Referer': 'http://stats.webp2p.le.com:20080/main' 
		 ,'X-Requested-With': 'XMLHttpRequest' 
		 ,'Connection': 'keep-alive' 
	};
	var options ={
		hostname: 'stats.webp2p.le.com',
		port: 20080,
		//path: '/q=sz000001,sz000002,sz000004,sz000005,sz000006,sz000007',
		path: '/query/table_all_share?type=min&from='+encodeURI(from)+'&to='+encodeURI(to)+'&typVar=-1&verVar=-1&idcVar=-1&gid=-1&terminalId=-1&platid=-1&splatid=501&appid=-1&methods=-1&p=-1&sid=-1&table_all_share=1&p1=undefined&p2=undefined',
		method: 'GET',
		headers: headers
	};

	http.get(options,function(res){
		var _bufData = '';
		res.on(
		'data',
		function(chunkData) {
			_bufData += chunkData;
		});

		res.on('end', function () {
			var data = JSON.parse(_bufData);
			var exl_data = '';
			if(data.data.length>0){
				for(var i=0; i<data.data.length;i++){
					exl_data += (data.data[i]+'\n')
				}
			}

			saveData(dateToPattern(new Date(from),"yyyy-MM")+".csv",exl_data);
			
			to = from = new Date(from.setTime( from.getTime() +  1* 86400000 ));
		

			if( (new Date('2017-07-26')).getTime() <  from.getTime() )
			// if( (new Date('2017-03-03')).getTime() <  from.getTime() )
			{
				console.log("it is over!")
				return
			}else{
				getStockInfo()
			}

		})
	}).on("error",function(err){
		if(callback){
			callback(null);
		}
		console.log("error>>>",'/q=');
	});
	
};


getStockInfo()