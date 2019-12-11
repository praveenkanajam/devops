
#           ***** SHEBANG *****
```
#!/bin/bash
1) First and formost line - SHEBANG
Shell - Interpreter.
```

#        ***** COMMENTS ******
```
# ANY LINE STARTS WITH # IS CALLED COMMENT AND IF IT IS 1ST LINE THEN IT WILL BE SHEBANG

```

#       ****** PRINTING ******
```
Command-Name {options} {I/P}
echo {options}

-e -Enable Esc Seq
    \n  - New Line
    \t  - New Tab
    \e  - New Color
                    
echo I/P : echo -e "HI \n BYE"
O/P:    HAI
        BYE

Note: When ever you are using -e option in echo command , always provide the input in double  Quotes.

I/P: echo -e " Hi \nBYE"
O/P: HI
     Bye

# echo -e "hi \tbye"
hi      bye

To get the colour informetion man page is
# man console_codes

FG      BG
Black   30      40        
Red     31      41
Green   32      42
Yellow  33      43    
Blue    34      44
Magneta 35      45
cyan    36      46
White   37      47
echo -e "\e[color-codemI/P"

Red colour:
# echo -e "\e[31mHellow world"
Hellow world

Green: 
# echo -e "\e[32mHellow world"
Hellow world

To disable the  colours:
# echo -e "\e[0mHellow world"                                                                 
Hellow world

---- TO DISABLE NEW LINE -----
echo -n option: To disable the new line.

# echo -n "Hi Hellow"
Hi Hellow[root@desktop ~]#
                
                OR

# ls -ltr searchfile testfile &>out
[root@desktop ~]# cat out
ls: cannot access testfile: No such file or directory
-rw-r--r-- 1 root root 14 Dec  8 17:31 searchfile

Case 6: to append the output and error to same file.
# ls -ltr searchfile testfile &>>out
[root@desktop ~]# cat out
ls: cannot access testfile: No such file or directory
-rw-r--r-- 1 root root 14 Dec  8 17:31 searchfile
ls: cannot access testfile: No such file or directory
-rw-r--r-- 1 root root 14 Dec  8 17:31 searchfile

Case 7: To display the output and copy to file.
# cat script1.sh
date
[root@desktop ~]# chmod 755 script1.sh
[root@desktop ~]# ./script1.sh
Sun Dec  8 19:07:54 IST 2019
[root@desktop ~]# ./script1.sh >out
[root@desktop ~]# ./script1.sh | tee out
Sun Dec  8 19:08:18 IST 2019
[root@desktop ~]# cat out
Sun Dec  8 19:08:18 IST 2019

case 8: to append the output using tee -a
# ./script1.sh | tee -a out
Sun Dec  8 19:10:07 IST 2019
[root@desktop ~]# cat out
Sun Dec  8 19:08:18 IST 2019
Sun Dec  8 19:10:07 IST 2019



```

#     *** ReDirectors ***
![redirector](Redirector.PNG)
```
Standard Input (Start):
# mail --help
mail: illegal option -- -
Usage: mail -eiIUdEFntBDNHRVv~ -T FILE -u USER -h hops -r address -s SUBJECT -a FILE -q FILE -f FILE -A ACCOUNT -b USERS -c USERS -S OPTION users

# mail -s "Test Mail" root@localhost
GM
.
EOT

NOte: for sending multiple users we need to use a file. like a template hear Input Redirector, works.

# vim BodyMessage
[root@desktop ~]# cat BodyMessage
Hellow,

How are you Doing

see you.

Thanks,
KPK
[root@desktop ~]# mail -s "TestMail" root@localhost <BodyMessage
[root@desktop ~]# mail
Heirloom Mail version 12.5 7/5/10.  Type ? for help.
"/var/spool/mail/root": 6 messages 2 new
    1 user@localhost.local  Wed Aug 14 08:35 1012/76676 "[abrt] open-vm-tools: vmtoolsd killed by SIGTRAP"
    2 root                  Sun Dec  8 16:34  20/650   "Laptop"
    3 root                  Sun Dec  8 16:38  19/660   "Payment"
    4 root                  Sun Dec  8 16:39  19/625   "Payment Remainder"
>N  5 root                  Sun Dec  8 16:43  18/606   "Test Mail"
 N  6 root                  Sun Dec  8 17:15  25/652   "TestMail"

 ---- Message to Users ----

# wall Machine will be rebooted after 10 minutes
[root@desktop ~]#
Broadcast message from root@desktop.example.com (pts/1) (Sun Dec  8 17:21:10 2019):

Machine will be rebooted after 10 minutes
/* Note: in the above wall message shows to all the users */

[root@desktop ~]# tty
/dev/pts/1
[root@desktop ~]# echo -e "\e[31mMachine will be rebooted after 10 minutes\e[0m">/dev/pts/1
Machine will be rebooted after 10 minutes
/* Note: Hear this message will be redirected to terminal 1 */
[root@desktop ~]# echo -e "\e[31mMachine will be rebooted aafter 10 minutes\e[0m">/dev/pts/2
/* Note: Hear this message will be redirected to terminal 2 */

Note: all the commands wont accepts standard inputs.

Ex 1: 
NOte: Grep commnad works for the standard input
# grep root /etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
[root@desktop ~]# grep root</etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin

Ex 2:
# rm -f <searchfile
# ls searchfile
searchfile
NOte: hear rm command will not accept the input.

Standard Input (End)..

---------- Standard OUtput --------------
Case 1: 
It will redirect the output.
# date > out
[root@desktop ~]# cat out
Sun Dec  8 17:40:30 IST 2019

Case 2: hear lss is not a command,error not redirected.
# lss >out
bash: lss: command not found...
Similar command is: 'ls'
[root@desktop ~]# cat out
[root@desktop ~]#

Case 3: To redirect erros to a file.
# lss 2>err
[root@desktop ~]# cat err
bash: lss: command not found...
Similar command is: 'ls'

Case 4: Hear we had done that output --> re-directed to out file and error --> redirected to err file

# ls -l searchfile testfile
ls: cannot access testfile: No such file or directory
-rw-r--r-- 1 root root 14 Dec  8 17:31 searchfile
[root@desktop ~]# ls -l searchfile testfile 1>out 2>err
[root@desktop ~]# cat out
-rw-r--r-- 1 root root 14 Dec  8 17:31 searchfile
[root@desktop ~]# cat err
ls: cannot access testfile: No such file or directory

Note: 1> or > is same.

** Case 5: ** hear output and error copied to same file.
# ls searchfile testfile >out 2>&1 or ls -ltr searchfile testdoc &>out
[root@desktop ~]# cat out
ls: cannot access testfile: No such file or directory
searchfile

case 6: Hear output redirected and appended to file.
# ./script1.sh | tee out
Sun Dec  8 19:08:18 IST 2019
[root@desktop ~]# cat out
Sun Dec  8 19:08:18 IST 2019
[root@desktop ~]# ./script1.sh | tee -a out
Sun Dec  8 19:10:07 IST 2019
[root@desktop ~]# cat out
Sun Dec  8 19:08:18 IST 2019
Sun Dec  8 19:10:07 IST 2019
```

#           ****    PIPES   ****
![Pipes](Pipes.PNG)

```

 command1 > out ---> Hear it will save the output which utilizes Storage
 command  < out ---> Hear it will utilize the input form file which also utilzes the storage

When comming to pipes, i will utilize the ram and very faster than disk.

Pipes - Symbol - |

# cat /etc/passwd | grep root
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
```
#           ***** Exit Status *****
![kill](Exit_status.PNG)
```

# ls >/dev/null
[root@desktop ~]# echo $?
0
[root@desktop ~]# lss &>/dev/null

Note: Hear /dev/null --> it will nullify the output.
[root@desktop ~]# echo $?
127
[root@desktop ~]# sleep 400
╚
[root@desktop ~]# echo $?
130

```
ssh-pass
https://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/