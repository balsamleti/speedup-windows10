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
set "line02=<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task">"
set "line03=  <RegistrationInfo>"
set "line04=    <URI>\Microsoft\Windows\UpdateOrchestrator\Reboot</URI>"
set "line05=  </RegistrationInfo>"
set "line06=  <Triggers>"
set "line07=    <TimeTrigger>"
set "line08=      <StartBoundary>2016-09-14T00:20:38+02:00</StartBoundary>"
set "line09=      <Enabled>true</Enabled>"
set "line10=    </TimeTrigger>"
set "line11=  </Triggers>"
set "line12=  <Principals>"
set "line13=    <Principal id="Author">"
set "line14=      <UserId>S-1-5-18</UserId>"
set "line15=      <RunLevel>LeastPrivilege</RunLevel>"
set "line16=    </Principal>"
set "line17=  </Principals>"
set "line18=  <Settings>"
set "line19=    <MultipleInstancesPolicy>IgnoreNew</MultipleInstancesPolicy>"
set "line20=    <DisallowStartIfOnBatteries>true</DisallowStartIfOnBatteries>"
set "line21=    <StopIfGoingOnBatteries>false</StopIfGoingOnBatteries>"
set "line22=    <AllowHardTerminate>true</AllowHardTerminate>"
set "line23=    <StartWhenAvailable>true</StartWhenAvailable>"
set "line24=    <RunOnlyIfNetworkAvailable>false</RunOnlyIfNetworkAvailable>"
set "line25=    <IdleSettings>"
set "line26=      <Duration>PT10M</Duration>"
set "line27=      <WaitTimeout>PT1H</WaitTimeout>"
set "line28=      <StopOnIdleEnd>true</StopOnIdleEnd>"
set "line29=      <RestartOnIdle>false</RestartOnIdle>"
set "line30=    </IdleSettings>"
set "line31=    <AllowStartOnDemand>true</AllowStartOnDemand>"
set "line32=    <Enabled>false</Enabled>"
set "line33=    <Hidden>false</Hidden>"
set "line34=    <RunOnlyIfIdle>false</RunOnlyIfIdle>"
set "line35=    <WakeToRun>true</WakeToRun>"
set "line36=    <ExecutionTimeLimit>PT72H</ExecutionTimeLimit>"
set "line37=    <Priority>7</Priority>"
set "line38=    <RestartOnFailure>"
set "line39=      <Interval>PT10M</Interval>"
set "line40=      <Count>3</Count>"
set "line41=    </RestartOnFailure>"
set "line42=  </Settings>"
set "line43=  <Actions Context="Author">"
set "line44=    <Exec>"
set "line45=      <Command>%systemroot%\system32\MusNotification.exe</Command>"
set "line46=      <Arguments>RebootDialog</Arguments>"
set "line47=    </Exec>"
set "line48=  </Actions>"
set "line49=</Task>"

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

) > "Win 10 Reboot deaktivieren.xml"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn setprot -op "dacl:p_nc;sacl:p_nc"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn setowner -ownr "n:%USERNAME%"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn ace -ace "n:%USERNAME%;p:full"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn ace -ace "n:System;p:read"
schtasks /delete /F /tn "Microsoft\Windows\UpdateOrchestrator\Reboot"
schtasks /create /tn "Microsoft\Windows\UpdateOrchestrator\Reboot" /xml "%~dp0Win 10 Reboot deaktivieren.xml"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn setprot -op "dacl:p_nc;sacl:p_nc"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn setowner -ownr "n:%USERNAME%"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn ace -ace "n:%USERNAME%;p:full"
"%~dp0SetACL.exe" -on C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator\Reboot -ot file -actn ace -ace "n:System;p:read"
del /F /Q "%~dp0Win 10 Reboot deaktivieren.xml"