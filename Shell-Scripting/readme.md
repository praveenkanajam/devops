```
#!/bin/bash
1) First and formost line

echo I/P
O/P
Command-Name {options} {I/P}
echo {options}

-e -Enable Esc Seq
    \n  - New Line
    \t  - New Tab
    \e  - New Color


        FG      BG
Red     31
Green   32
Yellow  33
Blue    34
Magneta 35
cyan    36
-n
HAI
BYE
Note: When ever you are using -e option in echo command , always provide the input in double  Quotes.

I/P: echo -e " Hi \nBYE"
O/P: HI
     Bye
```
```
# echo -e "hi \tbye"
hi      bye

To get the colour informetion man page is
# man console_codes


