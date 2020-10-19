:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
ECHO For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
ECHO args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
ECHO Next >> "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%SystemRoot%\System32\WScript.exe" "%temp%\OEgetPrivileges.vbs" %*
exit /B

:gotPrivileges
if '%1'=='ELEV' shift /1
setlocal & pushd .
cd /d %~dp0

:Start
for /f "delims= " %%a in ('"wmic useraccount where name='%username%' get sid"') do (
   if not "%%a"=="SID" (          
      set myvar=%%a
      goto :loop_end
   )   
)

:loop_end
set "line01=Windows Registry Editor Version 5.00"
set "line02="
set "line03=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]"
set "line04="ShowRecent"=dword:00000000"
set "line05="ShowFrequent"=dword:00000000"
set "line06="EnableAutoTray"=dword:00000000"
set "line07="
set "line08=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced]"
set "line09="FolderContentsInfoTip"=dword:00000000"
set "line10="HideFileExt"=dword:00000000"
set "line11="ShowSuperHidden"=dword:00000001"
set "line12="AlwaysShowMenus"=dword:00000001"
set "line13="AutoCheckSelect"=dword:00000001"
set "line14="Hidden"=dword:00000001"
set "line15="Start_TrackDocs"=dword:00000000"
set "line16="DisablePreviewDesktop"=dword:00000000"
set "line17="TaskbarAnimations"=dword:00000000"
set "line18="ShowTaskViewButton"=dword:00000000"
set "line19="TaskbarGlomLevel"=dword:00000001"
set "line20="
set "line21=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications]"
set "line22="ToastEnabled"=dword:00000000"
set "line23="
set "line24=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager]"
set "line25="SoftLandingEnabled"=dword:00000000"
set "line26="SystemPaneSuggestionsEnabled"=dword:00000000"
set "line27="
set "line28=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers]"
set "line29="DisableAutoplay"=dword:00000001"
set "line30="
set "line31=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize]"
set "line32="ColorPrevalence"=dword:00000001"
set "line33="
set "line34=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\DWM]"
set "line35="ColorPrevalence"=dword:00000001"
set "line36="
set "line37=[HKEY_USERS\%myvar%\Control Panel\International\User Profile]"
set "line38="HttpAcceptLanguageOptOut"=dword:00000001"
set "line39="
set "line40=[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass]"
set "line41="UserAuthPolicy"=dword:00000000"
set "line42="
set "line43=[HKEY_USERS\%myvar%\Control Panel\Desktop\WindowMetrics]"
set "line44="MinAnimate"=dword:00000000"
set "line45="
set "line46=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\Search]"
set "line47="SearchboxTaskbarMode"=dword:00000000"
set "line48="
set "line49=[HKEY_USERS\%myvar%\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel]"
set "line50="AllItemsIconView"=dword:00000000"
set "line51="StartupPage"=dword:00000001"
set "line52="
set "line53=[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config]"
set "line54="DODownloadMode"=dword:00000000"
set "line55="
set "line56=[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows]"
set "line57="CEIPEnable"=dword:00000000"
set "line58="

setlocal EnableDelayedExpansion
(
  echo !line01!
  echo/
  echo !line03!
  echo !line04!
  echo !line05!
  echo !line06!
  echo/
  echo !line08!
  echo !line09!
  echo !line10!
  echo !line11!
  echo !line12!
  echo !line13!
  echo !line14!
  echo !line15!
  echo !line16!
  echo !line17!
  echo !line18!
  echo !line19!
  echo/
  echo !line21!
  echo !line22!
  echo/
  echo !line24!
  echo !line25!
  echo !line26!
  echo/
  echo !line28!
  echo !line29!
  echo/
  echo !line31!
  echo !line32!
  echo/
  echo !line34!
  echo !line35!
  echo/
  echo !line37!
  echo !line38!
  echo/
  echo !line40!
  echo !line41!
  echo/
  echo !line43!
  echo !line44!
  echo/
  echo !line46!
  echo !line47!
  echo/
  echo !line49!
  echo !line50!
  echo !line51!
  echo/
  echo !line53!
  echo !line54!
  echo/
  echo !line56!
  echo !line57!
  echo/

) > "Win 10 Explorer Einstellungen.reg"
REGEDIT.EXE /S "%~dp0Win 10 Explorer Einstellungen.reg"
del /F /Q "%~dp0Win 10 Explorer Einstellungen.reg"