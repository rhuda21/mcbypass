cd "C:\Program Files"
mkdir MCBypass
cd MCBypass
curl -O https://raw.githubusercontent.com/rhuda21/mcbypass/main/Windows.ApplicationModel.Store.dll
mkdir backup
cd backup
copy C:\Windows\system32\Windows.ApplicationModel.Store.dll
taskkill /F /IM  Gamebar.exe
taskkill /F /IM  RuntimeBroker.exe
taskkill /f /im Minecraft.Windows.exe
taskkill /f /im WinStore.App.exe
TAKEOWN /F C:\Windows\system32\Windows.ApplicationModel.Store.dll
icacls C:\Windows\system32\Windows.ApplicationModel.Store.dll /grant %username%:F
del C:\Windows\system32\Windows.ApplicationModel.Store.dll
copy "C:\Program Files\MCBypass\Windows.ApplicationModel.Store.dll" C:\windows\system32