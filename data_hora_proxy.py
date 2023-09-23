# -*- coding: utf-8 -*-

from paramiko import SSHClient
import paramiko
import os, subprocess
import time as time
import datetime
from time import strptime


class SSH_K:
    def __init__(self,IP,PORT,USER,PASSWORD):
        self.ssh = SSHClient()
        self.ssh.load_system_host_keys()
        self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        self.ssh.connect(hostname=IP,port=PORT,username=USER,password=PASSWORD)
    def exec_cmd(self,cmd):
        stdin,stdout,stderr = self.ssh.exec_command(cmd)
        if stderr.channel.recv_exit_status() != 0:
            out = stderr.read()
        else:
            out = stdout.read()
            return out            

def data_atual():
  now = datetime.datetime.today()
  data = now.strftime("%b %d %Y %H:%M:%S")
  return data


def data_atual_screenshot():
  now = datetime.datetime.today()
  d = now.strftime("%d")
  m = now.strftime("%m")
  data=d+m
  return data


if __name__ == '__main__':
  
    ip=['serverip1','serverip2']
    for i in ip:
        try:
            ssh = SSH_K(i,22,'username','password')
            out = ssh.exec_cmd("date")
            print("HORA DO SERVIDOR {} = {}".format(i,str(out.rstrip(), "utf-8")))
        except:
            print("ERROR: SSH connection to "+i+" failed: ")

