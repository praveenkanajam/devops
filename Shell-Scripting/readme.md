
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

----
# cat script1.sh
date
echo "Message1"
exit
echo "Message2"
[root@desktop ~]# chmod +x script1.sh
[root@desktop ~]# ./script1.sh
Sun Dec  8 22:17:51 IST 2019
Message1
[root@desktop ~]# echo $?
0

----
# cat script1.sh
date
echo "Message1"
exit 1
echo "Message2"
[root@desktop ~]# ./script1.sh
Sun Dec  8 22:19:41 IST 2019
Message1
[root@desktop ~]# echo $?
1
Note: Hear we Had exproted the exit status 1 in script

Importance of exit status:
IN this example one command is exited but it will not stoped, it continued to execute the next command.
Example:
# cat exit_test.sh
#!/bin/bash
echo Hai
eeho Hello
echo bye
[root@desktop ~]# chmod +x exit_test.sh
[root@desktop ~]# ./exit_test.sh
Hai
./exit_test.sh: line 3: eeho: command not found
bye

NOte: hear exit status will helps.
```
# ***** Quotes ****************
```
Meta-Characters: 
a-z,0-9,_ (Normal characters)
~!@#$%^&*() (Special Character) space
        1) Backslash (\) -- to disable to special characers, But it is difficult to apply for every character.
        2) Single Quotes ('') -- It will completely disable the special charactes.
        3) Double Quotes (" ")-- It will treat only Dollar ($) and Command Quotes(``) as special character. 
        Again if you want to disable the special character we need to use \$  \`.
        ---------------------------------------------------------------
        1) BackSlach(\) --- it will escape the special character.

        # echo *
        CentOS-7-x86_64-DVD-1810.iso etc_bkp etc_bkp1 passwd SampleWebApp.war Testfile1.txt Testfile.txt
        
        # echo \*
        *

        # echo $$
        17514
        [root@desktop Desktop]# echo \$\$
        $$
        [root@desktop Desktop]# echo \* \$\$
        * $$
        -------------------------------------------------------------------------
        2) Single Quotes('')
        # cat script3.sh
        #!/bin/bash
        echo 'Today Date is `date`'

        [root@desktop Desktop]# ./script3.sh
        Today Date is `date`
        [root@desktop Desktop]# vim script3.sh
        [root@desktop Desktop]# ./script3.sh
        Today Date is Sun Dec  8 23:08:24 IST 2019
        [root@desktop Desktop]# cat script3.sh
        #!/bin/bash
        echo "Today Date is `date`"
        Note: `` is command qutoes
        
        -----
        # echo "the status of prvious command = $?"
        the status of prvious command = 0
        [root@desktop Desktop]# echo 'the status of prvious command = $?'
        the status of prvious command = $?
        [root@desktop Desktop]# echo "the status of prvious command = `$?`"
        bash: 0: command not found...
        the status of prvious command =
        -----------------------------------------------
        # echo '$$'="$$"
        $$=17514
        -----------------------------------------------
        # echo a                            b
        a b
        [root@desktop Desktop]# echo 'a                           b'
        a                           b
        [root@desktop Desktop]# echo "a                           b"
        a                           b
        3) Double quotes
        It is alos covered in the above. Please refer.
```
# ****** Text Filters ***********

```
Why ?
hear everthing is a file.
To deal with file, need to sort of data,based on requirement.

Filters:
    1) Line Numbers : head, tail
    2) Row Based    : grep ( -c count,-e multiple words,-f search list from file,-v, invert search,-i ignore case sensitive,-l matched files,-h matched output,-w to search with exact word , -x only that pattern)
    3) Coloum Based : 

1)Head: 
By default it will display 10 lines

# cat -n passwd | head
     1  root:x:0:0:root:/root:/bin/bash
     2  bin:x:1:1:bin:/bin:/sbin/nologin
     3  daemon:x:2:2:daemon:/sbin:/sbin/nologin
     4  adm:x:3:4:adm:/var/adm:/sbin/nologin
     5  lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
     6  sync:x:5:0:sync:/sbin:/bin/sync
     7  shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
     8  halt:x:7:0:halt:/sbin:/sbin/halt
     9  mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
    10  operator:x:11:0:operator:/root:/sbin/nologin

To display top 3 lines # head -n3 <file name> or as below.
# cat -n passwd | head -n3
     1  root:x:0:0:root:/root:/bin/bash
     2  bin:x:1:1:bin:/bin:/sbin/nologin
     3  daemon:x:2:2:daemon:/sbin:/sbin/nologin


2) Tail: 
# cat -n passwd | tail
    41  ntp:x:38:38::/etc/ntp:/sbin/nologin
    42  tcpdump:x:72:72::/:/sbin/nologin
    43  student:x:1000:1000:student:/home/student:/bin/bash
    44  vboxadd:x:988:1::/var/run/vboxadd:/bin/false
    45  tom:x:1001:1001::/home/tom:/bin/bash
    46  nscd:x:28:28:NSCD Daemon:/:/sbin/nologin
    47  nslcd:x:65:55:LDAP Client User:/:/sbin/nologin
    48  tom1:x:1002:1002::/home/tom1:/bin/bash
    49  tom2:x:1003:1002::/home/tom2:/bin/bash
    50  apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin

To display last 3 lines
# cat -n passwd | tail -n3
    48  tom1:x:1002:1002::/home/tom1:/bin/bash
    49  tom2:x:1003:1002::/home/tom2:/bin/bash
    50  apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin


Lines between 10 to 15:

# cat -n passwd |head -n15|tail -n6
    10  operator:x:11:0:operator:/root:/sbin/nologin
    11  games:x:12:100:games:/usr/games:/sbin/nologin
    12  ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
    13  nobody:x:99:99:Nobody:/:/sbin/nologin
    14  systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
    15  dbus:x:81:81:System message bus:/:/sbin/nologin
----------------------------------------------------------------------
3) Grep: to search words from a file. 

To search a word root from the file passwd
# grep root passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin

To invert the search : list the line words which is not "root" in passwd file.
# grep -v root passwd

To search with the word root and ssh
# grep -e root -e ssh passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin

To search words from a file input.
# grep -f search.grep passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin

# cat search.grep
root
ssh

To search words from a file and show the no of lines which is matched.
# grep -f search.grep passwd -c
3

To search a root word from multiple files.

# grep root /etc/passwd /etc/passwd- /etc/group /etc/group- /etc/shadow /etc/shadow-
/etc/passwd:root:x:0:0:root:/root:/bin/bash
/etc/passwd:operator:x:11:0:operator:/root:/sbin/nologin
/etc/passwd-:root:x:0:0:root:/root:/bin/bash
/etc/passwd-:operator:x:11:0:operator:/root:/sbin/nologin
/etc/group:root:x:0:
/etc/group-:root:x:0:
/etc/shadow:root:$6$2qXWJx6j$P2Mm.8XSI.Fb8r9HJEqbvIf5MPdW9xZqY1VbLDeWfVYps4dMEw79pse/botqzBOw7Da8evGsz0JWim5eQu1Fa.:18144:0:99999:7:::
/etc/shadow-:root:$6$2qXWJx6j$P2Mm.8XSI.Fb8r9HJEqbvIf5MPdW9xZqY1VbLDeWfVYps4dMEw79pse/botqzBOw7Da8evGsz0JWim5eQu1Fa.:18144:0:99999:7:::

To search a word from file input in different files.

# grep -f search.grep /etc/passwd /etc/shadow
/etc/passwd:root:x:0:0:root:/root:/bin/bash
/etc/passwd:operator:x:11:0:operator:/root:/sbin/nologin
/etc/passwd:sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
/etc/shadow:root:$6$2qXWJx6j$P2Mm.8XSI.Fb8r9HJEqbvIf5MPdW9xZqY1VbLDeWfVYps4dMEw79pse/botqzBOw7Da8evGsz0JWim5eQu1Fa.:18144:0:99999:7:::
/etc/shadow:sshd:!!:18122::::::

To search a word and list the words which are matched with out output.
# grep -f search.grep /etc/passwd /etc/shadow -l 
/etc/passwd
/etc/shadow

To search a word and list the words which are matched with out output.
# grep -f search.grep /etc/passwd /etc/shadow /etc/hosts -L
/etc/hosts


To search a word and list the words which are matched with count.
# grep -f search.grep /etc/passwd /etc/shadow -c
/etc/passwd:3
/etc/shadow:2

To grep the file get the output with out file name.
# grep root /etc/passwd /etc/shadow /etc/hosts -h
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
root:$6$2qXWJx6j$P2Mm.8XSI.Fb8r9HJEqbvIf5MPdW9xZqY1VbLDeWfVYps4dMEw79pse/botqzBOw7Da8evGsz0JWim5eQu1Fa.:18144:0:99999:7:::


To grep the files with some text 
# cat -n text
     1  abc
     2  ABC
     3  abcE
     4  XadcX
     5  ABCAAAA
[root@desktop Desktop]# cat -n text | grep abc
     1  abc
     3  abcE
[root@desktop Desktop]# cat -n text | grep -i abc
     1  abc
     2  ABC
     3  abcE
     5  ABCAAAA

To get the only the lines text abc matched.
# cat -n text | grep abc -w
     1  abc
To get the only lines with starting abc
# grep ^abc text
abc
abcE

To get the exact pattern : we need to use -x in that line
# cat text
abc
ABC
abcE
XadcX
ABCAAAA
[root@desktop Desktop]# grep abc text -x
abc
[root@desktop Desktop]# grep abc text -x -i
abc
ABC
[root@desktop Desktop]#

To grep the file and list lines after the lines also. using "-A n"
# cat -n passwd | grep root -A 1
     1  root:x:0:0:root:/root:/bin/bash
     2  bin:x:1:1:bin:/bin:/sbin/nologin
--
    10  operator:x:11:0:operator:/root:/sbin/nologin
    11  games:x:12:100:games:/usr/games:/sbin/nologin
[root@desktop Desktop]# cat -n passwd | grep root -A 2
     1  root:x:0:0:root:/root:/bin/bash
     2  bin:x:1:1:bin:/bin:/sbin/nologin
     3  daemon:x:2:2:daemon:/sbin:/sbin/nologin
--
    10  operator:x:11:0:operator:/root:/sbin/nologin
    11  games:x:12:100:games:/usr/games:/sbin/nologin
    12  ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin




```
ssh-pass
https://www.cyberciti.biz/faq/noninteractive-shell-script-ssh-password-provider/