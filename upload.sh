#!/bin/sh
user=username
dom=domain
pass='password'
server=servername
ano=`date +%Y`
mes=`date +%m.%B`
dia=`date +%d`
dia_semana=`date +%w`
ftp_user=username
ftp_password=password
data_server=`date +%Y%m%d`
smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/"
if [ $? != 0 ] 
then
	smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"; md $ano; cd $ano; md $mes; cd $mes;  md Segurança; cd Segurança; md Diário; md Semanal; md Mensal; cd Diário; md BackupAntivírus; md \"Checagem de vacinas dos appliances\"; md \"Horário Servidores\"; md zabbix; cd ..; cd Semanal; md Firewall; md server; md Proxy"
else
	smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes"
	if [ $? != 0 ] 
	then
		smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano; md $mes; cd $mes;  md Segurança; cd Segurança; md Diário; md Semanal; md Mensal; cd Diário; md BackupAntivírus; md \"Checagem de vacinas dos appliances\"; md \"Horário Servidores\"; md zabbix; cd ..; cd Semanal; md Firewall; md server; md Proxy"
	else
	smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes/Segurança/"
	if [ $? != 0 ] 
	then
		smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano; md $mes; cd $mes;  md Segurança; cd Segurança; md Diário; md Semanal; md Mensal; cd Diário; md BackupAntivírus; md \"Checagem de vacinas dos appliances\"; md \"Horário Servidores\"; md zabbix; cd ..; cd Semanal; md Firewall; md server; md Proxy"
	fi
fi

	smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes/Segurança/Diário"
fi
if [ $dia_semana -eq 1 ] || [ $dia_semana -eq 3 ] || [ $dia_semana -eq 5 ] 
then
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server1/periodic_reports/mga_internal_senders/calendar_day/"$data_server"??????_server01_Outgoing_Senders_Domains_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server1/periodic_reports/mga_internal_user_scheduled/calendar_day/"$data_server"??????_server01_Internal_Users_Summary_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server1/periodic_reports/mga_destination_domains/calendar_day/"$data_server"??????_server01_Outgoing_Destinations_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server1/periodic_reports/mga_incoming_mail_scheduled/calendar_day/"$data_server"??????_server01_Incoming_Mail_Summary_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server2/periodic_reports/mga_internal_senders/calendar_day/"$data_server"??????_server02_Outgoing_Senders_Domains_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server2/periodic_reports/mga_internal_user_scheduled/calendar_day/"$data_server"??????_server02_Internal_Users_Summary_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server2/periodic_reports/mga_destination_domains/calendar_day/"$data_server"??????_server02_Outgoing_Destinations_Dia_calendar_day.pdf	
	wget --ftp-user=$ftp_user --ftp-password=$ftp_password ftp://server2/periodic_reports/mga_incoming_mail_scheduled/calendar_day/"$data_server"??????_server02_Incoming_Mail_Summary_Dia_calendar_day.pdf	
	smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes/Segurança/Semanal/server/$dia"
	if [ $? != 0 ] 
	then
		smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes/Segurança/Semanal/server/; md $dia"
	fi
	smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes/Segurança/Semanal/server/$dia; mput *_server*.pdf"
fi	

smbclient //$server/share/ $pass -W $dom -U $user -c "prompt; cd COMUM/\"Procedimentos Periódicos\"/$ano/$mes/Segurança/Diário/\"Checagem de vacinas dos appliances\"/; mput *Firewall*; mput *server*.png; mput *kaspe*; cd ../\"Horário Servidores\"/; mput *horarios*; cd ../zabbix/; mput *zabbix*"
