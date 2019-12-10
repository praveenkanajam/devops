```
           ***** SHEBANG *****
#!/bin/bash
1) First and formost line - SHEBANG
Shell - Interpreter.
```
```
        ***** COMMENTS ******
# ANY LINE STARTS WITH # IS CALLED COMMENT AND IF IT IS 1ST LINE THEN IT WILL BE SHEBANG

```
```
       ****** PRINTING ******
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


````
````
ReDirectors:

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

````




````
ssh-pass
https://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/