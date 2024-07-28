@echo off
title Setting up the Scheduled task
cd /d "C:\Program Files"
mkdir MCBypass
cd /d MCBypass
echo Downloading automated bat file
curl -O https://raw.githubusercontent.com/rhuda21/mcbypass/main/success.cmd
mkdir "C:\Windows\System32\update\run"
cd /d C:\Windows\System32\update\run
copy  "C:\Program Files\MCBypass\success.cmd" "C:\Windows\System32\update\run"
exit
