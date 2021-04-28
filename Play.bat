@echo off
setlocal enabledelayedexpansion
if not exist %cd%\queue mkdir %cd%\queue & attrib +h %cd%\queue
:menu
echo StreamPlay by AnonymousRunAway (github.com/anonymousrunaway/StreamPlay)
echo(
echo(
echo 1. Generate New queue
echo 2. Play existing queue
echo(
set /p todo=Enter choice (number): 
CALL :%todo%
if %errorlevel% == 0 (echo Exit Code 0: Sucesfully executed) else (echo Execution Failed... Exit Code %errorlevel%. Please raise an issue on github if the issue persists.)
pause
cls
goto menu
:1
echo(
echo(
echo Queue Generation:
echo(
echo 0. Generate Sequential Queue
echo 1. Generate Randomized Queue
set /p todo=Enter choice (number) :  
echo Generating Queue...
set /a cnt=0
set /a wr=0
for %%f in (*.mp3) do CALL :fn "%%f" %todo%
for %%f in (*.mp4) do CALL :fn "%%f" %todo%
echo(
if %cnt% EQU 0 echo No mp3 files found. Please check the working directory. Current working directory: %cd% else echo Generated queue for %cnt% files. %wr% new files written.
EXIT /B 0
:fn
set /a cnt+=1
set /a randomizer=(%random%%%10)*%~2
for %%a in (0 1 2 3 4 5 6 7 8 9) do if exist "%cd%\queue\%%a%~1.vbs" (rename "%cd%\queue\%%a%~1.vbs" "%randomizer%%~1.vbs" & goto :eof)
:1h
echo CreateObject("Wscript.Shell").Run "wmplayer /play ""%cd%\%~1""", 0, False : Dim oShell : Set oShell = CreateObject("Shell.Application") : Dim oFolder : Set oFolder = oShell.Namespace("%cd%") : Dim oFile : Set oFile = oFolder.ParseName("%~1") : Dim strLength : strLength = oFolder.GetDetailsOf(oFile, 27) : WScript.Sleep(Mid(strLength,7,2)*1000+Mid(strLength,4,2)*1000*60+3000+Mid(strLength,1,2)*1000*60*60)>%cd%\queue\"%randomizer%%~1".vbs
set /a wr+=1
:0h
goto :eof
:2
echo Playing...
echo Exit to stop playing queue.
:loop
for %%f in (*.vbs) do (CALL :play "%%f")
goto loop
EXIT /B 0
:play
set t=%~1
echo !t:~1,-8!>nowPlaying.txt
echo Now Playing: !t:~1,-8!
%cd%\queue\"%~1"
goto :eof
goto :eof