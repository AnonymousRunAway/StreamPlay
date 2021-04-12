@echo off
setlocal enabledelayedexpansion
set execPath=%cd%
cd /d %execPath%
if %errorlevel% EQU 1 (pause & CALL :3)
if not exist %cd%\queue mkdir %cd%\queue & attrib +h %cd%\queue
:menu
echo StreamPlay
echo(
echo(
echo 1. Generate New queue
echo 2. Play existing queue (type 2 loop for looping of queue)
echo 3. Change current directory (effects only for single session)
echo(
set /p todo=Enter choice (number):  
CALL :%todo%
if %errorlevel% == 0 (echo Exit Code 0: Sucesfully executed & pause) else (echo Execution Failed... Exit Code %errorlevel%. Please raise an issue on github if the issue persists. & pause)
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
del %cd%\queue\*.vbs > nul 2>&1
set /a cnt=0
for %%f in (*.mp3) do CALL :fn "%%f" %todo%
echo(
if %cnt% EQU 0 (echo No mp3 files found. Please check the working directory. Current working directory: %execPath%) else (echo Generated queue for %cnt% mp3 files.)
EXIT /B 0
:fn
set /a randomizer=(%random%%%10)*%~2
set vtrack=%randomizer%%~1
set /a cnt+=1
echo CreateObject("Wscript.Shell").Run "wmplayer /play /close ""%execPath%\%~1""", 0, False>%cd%\queue\"%randomizer%%~1".vbs
echo Dim oShell  : Set oShell  = CreateObject("Shell.Application")>>%cd%\queue\"%randomizer%%~1".vbs
echo Dim oFolder : Set oFolder = oShell.Namespace("%execPath%")>>%cd%\queue\"%randomizer%%~1".vbs
echo Dim oFile   : Set oFile   = oFolder.ParseName("%~1")>>%cd%\queue\"%randomizer%%~1".vbs
echo Dim strLength : strLength = oFolder.GetDetailsOf(oFile, 27)>>%cd%\queue\"%randomizer%%~1".vbs
echo WScript.Sleep(Mid(strLength,7,2)*1000+Mid(strLength,4,2)*1000*60+3000+Mid(strLength,1,2)*1000*60*60)>>%cd%\queue\"%randomizer%%~1".vbs
goto :eof
:2
echo Playing...
ECHO %cd%>x&FOR %%? IN (x) DO SET /A result=%%~z? - 2&del x
set /a result+=8
:loop
for %%f in (%cd%\queue\*.vbs) do (CALL :play "%%f")
goto %~1
EXIT /B 0
:3
echo Quick tip: You can permanently change directory by editing the file itself.
echo(
set /p todo=Do you want to delete the existing queue in this directory? (y/n)
if /I %todo%==Y del %cd%\queue\*.vbs & rmdir %cd%\queue
echo(
set /p execPath=Directory :
set execPath=%execPath:/=\%
cd /d %execPath%
if not exist %cd%\queue mkdir %cd%\queue & attrib +h %cd%\queue
EXIT /B 0
:play
set track=%~1
echo !track:~%result%,-8!>nowPlaying.txt
echo Now Playing: !track:~%result%,-8!
"%track%"
goto :eof
