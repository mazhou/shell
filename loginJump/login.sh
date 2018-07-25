#!/bin/bash

rootPath=$(dirname $0)
data="/asset1"
ip_csv=$rootPath$data"/xshellIP.csv"
# echo $ip_csv
if [ $# == 0 ];then
    echo "请输入登录IP,你可以通过 show 显示IP,可以通过 add 添加IP"
    exit 0
fi

# echo "$1"

if [ "$1" == "show" ]; then
    #显示IP
    if [ $# == 2 ];then
        #显示IP所有信息,匹配可能的IP地址
        ip2="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$2")"
        if [ "$ip2" == "" ];then
            #显示IP全部信息，匹配可能的IP地址
            while IFS=, read ip port user pswd desc inIp inPort
            do
                if test "${ip#*$2}" != "$ip"
                then
                    echo "$desc $ip:$port"
                fi
                if test "${desc#*$2}" != "$desc"
                then
                    echo "$desc $ip:$port"
                fi
            done < $ip_csv
        else
            #显示单个IP全部信息
           
            while IFS=, read ip port user pswd desc inIp inPort
            do
                if test "${ip#*$2}" != "$ip"
                then
                    echo "$desc $ip:$port $pswd $inIp $inPort"
                    break    # $substring is in $string
                fi
            done < $ip_csv
        fi
    else
        #显示ip简短信息  127.0.0.1 80 root password 备注
        while IFS=, read ip port user pswd desc inIp inPort 
        do
            
            if [ -z "$port" ];then
                echo "$desc $ip"
            elif [ "$port" == "80" ];then
                echo "$desc $ip"
            else
                echo "$desc $ip:$port "
            fi
            
        done < $ip_csv
    fi
    exit 0

elif [ "$1" == "add" ]; then
    #添加IP
    if [ $#  -ge  6 ];then
        #判断IP格式是否正确
        ip="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< $2)"
        
        if [ -z $ip ];then
            echo "IP错误 正确的格式类似 127.0.0.1 "
            exit 0
        fi
        #判断端口是否正确
        port="$(grep -oE '([0-9]|[1-9]\d{1,3}|[1-5]\d{4}|6[0-5]{2}[0-3][0-5])' <<< $3)"
        count=0
        for var in $port
        do
            let count+=1
        done
        
        if [ $count -ne 1 ]; then
            echo "端口错误 正确的格式 8080 取值范围为0-65535"
            exit 0
        fi
        #其他赋值
        user=$4
        password=$5
        comment=$6
        inIp=$7
        inPort=$8 

        if [ ! -d $rootPath$data ]; then
            mkdir -p $rootPath$data; 
            echo "创建目录$rootPath$data"
        fi
       
        echo $ip","$port","$user","$password","$comment","$inIp","$inPort"\n" >> $ip_csv
        exit 0; 

    else
        echo "添加登陆信息错误，正确的格式为: 127.0.0.1 80 root password 备注, 每一项必填"
    fi

else
    ip="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$1")"
    #这没有写内网ip登陆还是外网登陆，等有时间再写
    if [ "$ip" == "" ];then
        echo "你可以通过 show 显示IP,可以通过 add 添加IP 或者输入正确的IP地址登陆服务器"
        exit 0
    else    
        while IFS=, read ip port user pswd desc inIp inPort 
        do
            if test "${ip#*$1}" != "$ip"
            then
                break    # $substring is in $string
            fi
        done < $ip_csv
    fi

    loginAct="$rootPath/loginAct.sh"
    
    $loginAct $user $ip "$port" "$pswd"

fi

#ip port user pswd密码 desc注释 inIp内网IP inPort内网端口 
