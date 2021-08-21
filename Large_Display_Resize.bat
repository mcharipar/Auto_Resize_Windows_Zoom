@ECHO OFF

explorer ms-settings:display
ping -n 2 127.0.0.1 > nul

:VBSDynamicBuild
SET TempVBSFile=%tmp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 100                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "+{TAB 5}{ENTER}{TAB 8}{DOWN 2}"   >>"%TempVBSFile%"
ECHO Wscript.Sleep 500                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "%%{F4}"                           >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"
EXIT