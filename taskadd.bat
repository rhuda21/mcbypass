title Setting up the Scheduled task
cd "C:\Program Files"
mkdir MCBypass
cd MCBypass
echo Downloading automated bat file
curl -O https://raw.githubusercontent.com/rhuda21/mcbypass/main/mcautobypass.bat
REM Create scheduled task triggered by WindowsUpdateClient event ID 19
schtasks /Create /TN "Post WUA Update Install" /TR "C:\Program Files\MCBypass\mcautobypass.bat" /SC ONEVENT /EC System /MO "*[System[Provider[@Name='Microsoft-Windows-WindowsUpdateClient'] and (EventID=19)]]"