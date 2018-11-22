#!/bin/bash

jump_user=$1
jump_pwd=$2
target_server=$3
target_pwd=$4

/usr/bin/expect -c "
    spawn ssh -o StrictHostKeyChecking=no $jump_user@jumpserverip -p jumpserverport;
    set timeout 10;
    expect \"*assword*\";
    send \"$jump_pwd\r\";
    expect \"USMshell\";
    send \"ssh root@$target_server\r\";
    set timeout 10;
    expect \"*assword*\";
    send \"$target_pwd\r\";

    expect {
      \"*yes/no*\" {set timeout 10;send \"yes\r\";}
      \"#\" {}
    }


    interact;
    "
