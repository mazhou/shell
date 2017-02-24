#!/bin/bash

ip_csv="serverIp.csv"


if [ $# == 0 ];then
    echo "no param"
    exit 0
fi

[ ! -f $ip_csv ] && { echo "$INPUT file not found"; exit 0; }

if [ "$1" == "show" ];then
    if [ $# == 2 ];then
        ip2="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$2")"
        if [ "$ip2" == "" ];then
            while IFS=, read name ssh
            do
                if test "${name#*$2}" != "$name"
                then
                    echo $name
                fi
            done < $ip_csv
        else
            echo "ip:$2"
            while IFS=, read dscb ssh jump port name userpwd shell
            do
               
                if test "${dscb#*$2}" != "$dscb"
                then
                    # echo $dscb
                    IFS=:
                    set $shell
                    password="$3"
                    echo "pwd:$password"
                    # echo $ip
                    # echo $name
                    
                    break    # $substring is in $string
                fi
            done < $ip_csv
        fi
    else
        while IFS=, read name ssh
        do
            echo $name
        done < $ip_csv
    fi
    exit 0
fi

ip="$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$1")"

if [ "$ip" == "" ];then
    echo "no record or ip err";
    exit 0
else    
    while IFS=, read dscb ssh jump port name userpwd shell
    do
       
        if test "${dscb#*$1}" != "$dscb"
        then
            # echo $dscb
            IFS=:
            set $shell
            password="$3"
            # echo $password
            # echo $ip
            # echo $name
            # echo $userpwd
            break    # $substring is in $string
        fi
    done < $ip_csv
fi

./login.sh $name $userpwd $ip $password
