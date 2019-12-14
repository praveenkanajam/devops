#!/bin/bash
#Author : Praveen k
clear
echo "Serching of files 01* 02* 100*" 
ls 01* 02* 100*
echo " copying output to out1.txt"
ls 01* 02* 100* > out1.txt
cat out1.txt
echo -e "\e[31m error not copied to out1.txt\e[0m"
echo " --------------------------------------   "
echo -e "\e[32mcopying Output to out2.txt & error to err.txt\e[0m"
ls 01* 02* 100* >out2.txt 2>err.txt
echo "output to out2.txt"
cat out2.txt
echo "error to error.txt"
cat err.txt
echo "-----------------------------------"
echo -e " \e[33mcopying Output & error to out.txt \e[0m"
ls 01* 02* 100* &>out.txt
echo "output of out.txt file"
cat out.txt
echo "________________________________________"
echo -e "\e[35mNullifiy the output\e[0m"
ls 01* 02* 100* &>/dev/null 
echo -e "\e[36m Exit status $(echo $?)\e[0m"
