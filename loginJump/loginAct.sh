#!/bin/bash

user=$1
ip=$2
port=$3
pwd=$4

if [ -z "$port"  ];then
    portArg=""
elif [ "$port" == "80" ];then
     portArg=""
else
    portArg=" -p $port"
fi
# echo "
#     spawn ssh -o StrictHostKeyChecking=no $user@$ip $portArg;
#     set timeout 10;
#     expect \"*assword*\";
#     send \"$pwd\r\";
    
#     expect {
#       \"*yes/no*\" {set timeout 10;send \"yes\r\";}
#       \"#\" {}
#     }


#     interact;
#     "
/usr/bin/expect -c "
    spawn ssh -o StrictHostKeyChecking=no $user@$ip $portArg;
    set timeout 10;
    expect \"*assword*\";
    send \"$pwd\r\";
    
    expect {
      \"*yes/no*\" {set timeout 10;send \"yes\r\";}
      \"#\" {}
    }


    interact;
    "
