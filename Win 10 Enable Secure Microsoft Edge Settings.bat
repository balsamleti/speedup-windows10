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

:START
@ECHO off
for /f "delims= " %%a in ('"wmic useraccount where name='%username%' get sid"') do (
   if not "%%a"=="SID" (          
      set myvar=%%a
      goto :loop_end
   )   
)
set myvar2=""
:loop_end
set "line01=Windows Registry Editor Version 5.00"
set "line02= "
set "line03=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main]"
set "line04="Cookies"=dword:00000001"
set "line05= "
set "line06=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main]"
set "line07="Cookies"=dword:00000001"
set "line08= "
set "line09=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI]"
set "line10="EnableCortana"=dword:00000000"
set "line11= "
set "line12=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI]"
set "line13="EnableCortana"=dword:00000000"
set "line14= "
set "line15=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Addons]"
set "line16="FlashPlayerEnabled"=dword:00000000"
set "line17= "
set "line18=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Addons]"
set "line19="FlashPlayerEnabled"=dword:00000000"
set "line20= "
set "line21=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\User\Default\SearchScopes]"
set "line22="ShowSearchSuggestionsGlobal"=dword:00000000"
set "line23= "
set "line24=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\User\Default\SearchScopes]"
set "line25="ShowSearchSuggestionsGlobal"=dword:00000000"
set "line26= "
set "line27=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ContinuousBrowsing]"
set "line28="Enabled"=dword:00000001"
set "line29= "
set "line30=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ContinuousBrowsing]"
set "line31="Enabled"=dword:00000001"
set "line32= "
set "line33=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI]"
set "line34="NewTabPageDisplayOption"=dword:00000002"
set "line35= "
set "line36=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ServiceUI]"
set "line37="NewTabPageDisplayOption"=dword:00000002"
set "line38= "
set "line39=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main]"
set "line40="FormSuggest Passwords"="no""
set "line41= "
set "line42=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main]"
set "line43="FormSuggest Passwords"="no""
set "line44= "
set "line45=[HKEY_USERS\%myvar%\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions]"
set "line46="EnableExtensionDevelopment"=dword:00000001"
set "line47= "
set "line48=[HKEY_USERS\%myvar%_Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions]"
set "line49="EnableExtensionDevelopment"=dword:00000001"
set "line50= "

setlocal EnableDelayedExpansion
(
  echo !line01!
  echo/
  echo !line03!
  echo !line04!
  echo/
  echo !line06!
  echo !line07!
  echo/
  echo !line09!
  echo !line10!
  echo/
  echo !line12!
  echo !line13!
  echo/
  echo !line15!
  echo !line16!
  echo/
  echo !line18!
  echo !line19!
  echo/
  echo !line21!
  echo !line22!
  echo/
  echo !line24!
  echo !line25!
  echo/
  echo !line27!
  echo !line28!
  echo/
  echo !line30!
  echo !line31!
  echo/
  echo !line33!
  echo !line34!
  echo/
  echo !line36!
  echo !line37!
  echo/
  echo !line39!
  echo !line40!
  echo/
  echo !line42!
  echo !line43!
  echo/
  echo !line45!
  echo !line46!
  echo/
  echo !line48!
  echo !line49!
  echo/

) > "Win 10 Edge sichere Einstellungen.reg"
REGEDIT.EXE /S "%~dp0Win 10 Edge sichere Einstellungen.reg"
del /F /Q "%~dp0Win 10 Edge sichere Einstellungen.reg"