import pyautogui
import subprocess
import time as time
import datetime
from time import strptime
import os
import sys
import shlex


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


#data=data_atual_screenshot()
#command_line = "./hora_servidores.sh"
#args = shlex.split(command_line)
#p = subprocess.Popen(args)
subprocess.call(["firefox", "putyoururlhere"])
time.sleep(10)
myScreenshot = pyautogui.screenshot(region=(0 ,0 , 1920, 1080))
myScreenshot.save(data_atual_screenshot()+' - url1.png')
subprocess.call(["firefox", "putyoururlhere"])
time.sleep(10)
myScreenshot = pyautogui.screenshot(region=(0 ,0 , 1920, 1080))
myScreenshot.save(data_atual_screenshot()+' - url2.png')
subprocess.call(["firefox", "putyoururlhere"])
time.sleep(10)
myScreenshot = pyautogui.screenshot(region=(0 ,0 , 1920, 1080))
myScreenshot.save(data_atual_screenshot()+' - url3.png')
command_line = "/usr/bin/xfreerdp /cert-ignore /u:username /d:domain /p:'password' /f /v:serverip"
args = shlex.split(command_line)
p = subprocess.Popen(args)
time.sleep(15)
myScreenshot = pyautogui.screenshot(region=(0 ,0 , 1920, 1080))
myScreenshot.save(data_atual_screenshot()+' - url4.png')
command_line = "/usr/bin/killall xfreerdp"
args = shlex.split(command_line)
p = subprocess.Popen(args)
subprocess.call(["firefox", "putyoururlhere"])
time.sleep(30)
myScreenshot = pyautogui.screenshot(region=(0 ,0 , 1920, 1080))
myScreenshot.save(data_atual_screenshot()+' - url5.png')
