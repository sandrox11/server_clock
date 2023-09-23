#!/bin/sh
echo ======================================================================================== > report.txt
echo ======================================================================================== >> report.txt
echo       PROCEDIMENTO OPERACIONADO DIÁRIO de HORÁRIO DOS SERVIDORES `date`		      >> report.txt
echo ======================================================================================== >> report.txt
echo ======================================================================================== >> report.txt
/usr/bin/python3 data_hora_ironport.py >> report.txt
/usr/bin/python3 data_hora_proxy.py >> report.txt
echo HORA DO SERVIDOR Server1 = `curl -X GET 'https://serverip1/api/?type=op&cmd=<show><clock></clock></show>&key=putyourkeyhere' --insecure | cut -d\> -f3` >> report.txt
echo HORA DO SERVIDOR Server2 = `curl -X GET 'https://serverip2/api/?type=op&cmd=<show><clock></clock></show>&key=putyourkeyhere' --insecure | cut -d\> -f3` >> report.txt
echo HORA DO SERVIDOR  Server3 = `ssh -p 2222 username@server3 date` >> report.txt
echo HORA DO SERVIDOR  Server4 = `ssh -p 2222 username@server4 date` >> report.txt
clear
cat report.txt
sleep 10
scrot -u -b '%d%m - horarios dos servidores.png'
sleep 5
/usr/bin/python3 print_screen.py 
./upload.sh
