::::::::::::::::::::::::::::::::::::::::::::
:: Elevate.cmd - Version 4
:: Automatically check & get admin rights
:: see "https://stackoverflow.com/a/12264592/1016343" for description
::::::::::::::::::::::::::::::::::::::::::::
 @echo off
 CLS
 ECHO.
 ECHO =============================
 ECHO Running Admin shell
 ECHO =============================

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~dpnx0"
 rem this works also from cmd shell, other than %~0
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.
  ECHO **************************************
  ECHO Invoking UAC for Privilege Escalation
  ECHO **************************************

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"
  
  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
@ECHO on
title Minecraft Bedrock Crack Utiilty
cls
:start
ECHO.
ECHO 1. Install Minecraft Bedrock Crack
ECHO 2. Uninstall Minecraft Bedrock Crack
ECHO 3. Unregister Windows Update Task from system
ECHO 4. Apply Windows Update Task
set choice=
set /p choice=Type the number to apply operation.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto install
if '%choice%'=='2' goto uninstall
if '%choice%'=='3' goto unreg
if '%choice%'=='4' goto wupdate
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:install
echo Prepering to Install
cd "C:\Program Files"
mkdir MCBypass
cd MCBypass
curl -O https://raw.githubusercontent.com/rhuda21/mcbypass/main/Windows.ApplicationModel.Store.dll
echo Backing Up original DLL
mkdir backup
cd backup
copy C:\Windows\system32\Windows.ApplicationModel.Store.dll
echo The Installation is about to begin. Please close all Microsoft Store Apps and Xbox.
title Installing..
taskkill /F /IM  Gamebar.exe
taskkill /F /IM  RuntimeBroker.exe
taskkill /f /im Minecraft.Windows.exe
taskkill /f /im WinStore.App.exe
taskkill /f /im PhoneExperienceHost.exe
taskkill /f /im NanaZip.Modern.exe
taskkill /f /im StoreExperienceHost.exe
TAKEOWN /F C:\Windows\system32\Windows.ApplicationModel.Store.dll
icacls C:\Windows\system32\Windows.ApplicationModel.Store.dll /grant %username%:F
color bc
del C:\Windows\system32\Windows.ApplicationModel.Store.dll
echo copying file
copy "C:\Program Files\MCBypass\Windows.ApplicationModel.Store.dll" C:\windows\system32
echo Enjoy Minecraft!
echo Please remember that after windows update the crack may be disabled, We will take you to menu if you want to apply the fix . Use Option No."4"
goto start
goto end
:uninstall
ECHO Prepering to uninstall Crack
title Uninstalling..
taskkill /F /IM  Gamebar.exe
taskkill /F /IM  RuntimeBroker.exe
taskkill /f /im Minecraft.Windows.exe
taskkill /f /im WinStore.App.exe
taskkill /f /im PhoneExperienceHost.exe
taskkill /f /im NanaZip.Modern.exe
taskkill /f /im StoreExperienceHost.exe
TAKEOWN /F C:\Windows\system32\Windows.ApplicationModel.Store.dll
icacls C:\Windows\system32\Windows.ApplicationModel.Store.dll /grant %username%:F
del C:\Windows\system32\Windows.ApplicationModel.Store.dll
copy "C:\Program Files\MCBypass\backup" C:\Windows\system32\Windows.ApplicationModel.Store.dll
echo Thanks for using our service
goto end
:wupdate
title Prepering Scheduled Task
echo The helper script is being downloaded for the Scheduled task, please wait..
cd "C:\Program Files\MCBypass"
curl -O  https://raw.githubusercontent.com/rhuda21/mcbypass/main/taskadd.bat
start taskadd.bat
goto end
:unreg
schtasks /Delete /TN "mcbypass"
goto end
:end
PAUSE