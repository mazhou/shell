#!/bin/bash

ip_csv="/Users/mazhou/workspace/git/shell/loginJump/asset/ipxshellIP.csv"

if [ $# == 0 ];then
    echo "no param,you can type show"
    exit 0
fi

[ ! -f $ip_csv ] && { echo "$INPUT file not found"; exit 0; }

if [ "$1" == "show" ];then
    if [ $# == 2 ];then
        ip2="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$2")"
        if [ "$ip2" == "" ];then
            while IFS=, read desc user ip port pwd inIp inPort 
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
            while IFS=, read desc user ip port pwd inIp inPort 
            do
                if test "${ip#*$2}" != "$ip"
                then
                    echo "$desc $ip:$port $pwd $inIp $inPort"
                    break    # $substring is in $string
                fi
            done < $ip_csv
        fi
    else
        while IFS=, read desc user ip port pwd inIp inPort 
        do
            # 判断变量是否为空
            if [ -z "$port" ];then
                echo "$desc $ip"
            else
                echo "$desc $ip:$port"
            fi
            
        done < $ip_csv
    fi
    exit 0
fi

ip="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$1")"

if [ "$ip" == "" ];then
    echo "no record or ip err";
    exit 0
else    
    while IFS=, read desc user ip port pwd inIp inPort
    do
        if test "${ip#*$1}" != "$ip"
        then
            break    # $substring is in $string
        fi
    done < $ip_csv
fi


loginAct="$(cd "$(dirname "$0")" && pwd)/loginAct.sh"
$loginAct $user $ip "$port" "$pwd"
