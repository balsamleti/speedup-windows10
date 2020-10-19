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
set "line03=[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Onedrive]"
set "line04="DisableLibrariesDefaultSaveToOneDrive"=dword:00000001"
set "line05="DisableFileSync"=dword:00000001"
set "line06="DisableMeteredNetworkFileSync"=dword:00000001"
set "line07="
set "line08=[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\Onedrive]"
set "line09="DisableLibrariesDefaultSaveToOneDrive"=dword:00000001"
set "line10="DisableFileSync"=dword:00000001"
set "line11="DisableMeteredNetworkFileSync"=dword:00000001"
set "line12="
set "line13=[HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line14="Attributes"=dword:f090004d"
set "line15="
set "line16=[HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line17="Attributes"=dword:f090004d"
set "line18="
set "line19=[HKEY_CURRENT_USER\Software\Classes\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line20="Attributes"=dword:f090004d"
set "line21="
set "line22=[HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder]"
set "line23="Attributes"=dword:f090004d"
set "line24="

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
  echo/
  echo !line13!
  echo !line14!
  echo/
  echo !line16!
  echo !line17!
  echo/
  echo !line19!
  echo !line20!
  echo/
  echo !line22!
  echo !line23!
  echo/

) > "Win 10 One Drive deaktivieren.reg"
REGEDIT.EXE /S "%~dp0Win 10 One Drive deaktivieren.reg"
del /F /Q "%~dp0Win 10 One Drive deaktivieren.reg"