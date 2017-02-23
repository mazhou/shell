var fs = require("fs");
var saveData = function (file,content){
	var index = file.lastIndexOf("/");
	var dir = file.substr(0,index);
	fs.exists(dir, (exists) => {
		if (!exists) {
	 		console.log(dir);
	 		fs.mkdirSync(dir);
	    }
	 
	});

	fs.appendFile(file, content, function (err) {
	  	if (err) throw err;
	  	// console.log('It\'s saved!');
	});
}
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

String.prototype.ltrim = function() {
	return this.replace(/(^\s*)/g, "");
};

String.prototype.rtrim = function() {
	return this.replace(/(\s*$)/g, "");
};

//cde
var cdelogAmerica = [
{ip:"10.120.30.84",pwd:"E3KWBBwfCcr9m7qvQC92"},
{ip:"10.120.30.85",pwd:"E3KWBBwfCcr9m7qvQC92"}
];


var 
jump="***",
port="***",
user="***",
pwd="***",
description="USMshell:/>ssh root@",
description2="assword:";

process.argv.forEach(function (val, index, array) {
  console.log(index + ': ' + val);
});

var generateByArray=function(arr,name,file){
	var content = ""
	name = name.replace(/_/g,"\.")
	name = name.trim()
	file = file.trim()
	console.log(" length:"+arr.length)
	for(var i = 0; i<arr.length;i++ ){
		if(arr[i].hasOwnProperty('ip_out')){
			content += name+"_"+arr[i]['ip'].trim()+"_"+arr[i]['ip_out'].trim()+","+
				"ssh"+","+
				jump+","+
				port+","+
				user+","+
				pwd+","+
				description+arr[i]['ip'].trim()+description2+arr[i]['pwd'].trim()+"\n"
		}else{
			content += name+"_"+arr[i]['ip'].trim()+","+
				"ssh"+","+
				jump+","+
				port+","+
				user+","+
				pwd+","+
				description+arr[i]['ip'].trim()+description2+arr[i]['pwd'].trim()+"\n"
		}
		
	}
	if(!file){file = ""}
	console.log("saveData:"+content.substr(0,10)+"......");
	saveData(file+"xshellIP.csv",content);
}


generateByArray(cdelogAmerica,"cdelogAmerica","asset/cycIp")
