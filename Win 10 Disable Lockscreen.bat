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
set "line01=<?xml version="1.0" encoding="UTF-16"?>"
set "line02=<Task version="1.4" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">"
set "line03=  <RegistrationInfo>"
set "line04=    <Date>2016-08-06T12:40:47.6863074</Date>"
set "line05=    <Author>System</Author>"
set "line06=    <URI>\Disable Windows Lock Screen</URI>"
set "line07=  </RegistrationInfo>"
set "line08=  <Triggers>"
set "line09=    <LogonTrigger>"
set "line10=      <Enabled>true</Enabled>"
set "line11=    </LogonTrigger>"
set "line12=    <SessionStateChangeTrigger>"
set "line13=      <Enabled>true</Enabled>"
set "line14=      <StateChange>SessionUnlock</StateChange>"
set "line15=    </SessionStateChangeTrigger>"
set "line16=  </Triggers>"
set "line17=  <Principals>"
set "line18=    <Principal id="Author">"
set "line19=      <UserId>%myvar%</UserId>"
set "line20=      <LogonType>InteractiveToken</LogonType>"
set "line21=      <RunLevel>HighestAvailable</RunLevel>"
set "line22=    </Principal>"
set "line23=  </Principals>"
set "line24=  <Settings>"
set "line25=    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>"
set "line26=    <DisallowStartIfOnBatteries>false</DisallowStartIfOnBatteries>"
set "line27=    <StopIfGoingOnBatteries>true</StopIfGoingOnBatteries>"
set "line28=    <AllowHardTerminate>true</AllowHardTerminate>"
set "line29=    <StartWhenAvailable>false</StartWhenAvailable>"
set "line30=    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>"
set "line31=    <IdleSettings>"
set "line32=      <StopOnIdleEnd>true</StopOnIdleEnd>"
set "line33=      <RestartOnIdle>false</RestartOnIdle>"
set "line34=    </IdleSettings>"
set "line35=    <AllowStartOnDemand>true</AllowStartOnDemand>"
set "line36=    <Enabled>true</Enabled>"
set "line37=    <Hidden>false</Hidden>"
set "line38=    <RunOnlyIfIdle>false</RunOnlyIfIdle>"
set "line39=    <DisallowStartOnRemoteAppSession>false</DisallowStartOnRemoteAppSession>"
set "line40=    <UseUnifiedSchedulingEngine>true</UseUnifiedSchedulingEngine>"
set "line41=    <WakeToRun>false</WakeToRun>"
set "line42=    <ExecutionTimeLimit>PT72H</ExecutionTimeLimit>"
set "line43=    <Priority>7</Priority>"
set "line44=  </Settings>"
set "line45=  <Actions Context="Author">"
set "line46=    <Exec>"
set "line47=      <Command>reg</Command>"
set "line48=      <Arguments>add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\SessionData /t REG_DWORD /v AllowLockScreen /d 0 /f</Arguments>"
set "line49=    </Exec>"
set "line50=  </Actions>"
set "line51=</Task>"

setlocal EnableDelayedExpansion
(
  echo !line01!
  echo !line02!
  echo !line03!
  echo !line04!
  echo !line05!
  echo !line06!
  echo !line07!
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
  echo !line20!
  echo !line21!
  echo !line22!
  echo !line23!
  echo !line24!
  echo !line25!
  echo !line26!
  echo !line27!
  echo !line28!
  echo !line29!
  echo !line30!
  echo !line31!
  echo !line32!
  echo !line33!
  echo !line34!
  echo !line35!
  echo !line36!
  echo !line37!
  echo !line38!
  echo !line39!
  echo !line40!
  echo !line41!
  echo !line42!
  echo !line43!
  echo !line44!
  echo !line45!
  echo !line46!
  echo !line47!
  echo !line48!
  echo !line49!
  echo !line50!
  echo !line51!

) > "Win 10 Lockscreen deaktivieren.xml"
schtasks /create /tn "Disable Windows Lock Screen" /xml "%~dp0Win 10 Lockscreen deaktivieren.xml"
del /F /Q "%~dp0Win 10 Lockscreen deaktivieren.xml"