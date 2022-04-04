#!/bin/bash

service_name=nginx # service name && service_name is a variable 

nginx_status=dead  # service running or dead find

s1_nginx=$(systemctl status nginx | grep  Active:) # check nginx status only Active part

s2_nginx=$(systemctl status nginx)  # show all status nginx

# I am Using While Loop && if else in bash script

systemctl status $service_name | grep -i 'Active\|running\|dead' | while read output; # while read save in output  variable

do

#echo $output  # optional hahah

if [ "$output" == "$nginx_status" ];then
    systemctl start $service_name

    else

    echo "$s1_nginx \n $s2_nginx" | mail -s "$service_name Service is Down and Restarted now on $(hostname)" <ENTER_YOUR_EMAIL_ID>
fi

done

