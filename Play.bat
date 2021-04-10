@echo off
rem keep echo on for debugging
setlocal enabledelayedexpansion
set execPath=C:/Users/%USERNAME%/Downloads/Stream Music
set execPathSlashed=C:\Users\%USERNAME%\Downloads\Stream Music
cd /d %execPath%
echo Hello^! Let's get you set up.
:menu
echo.
echo Note: ALL PROVIDED FILES must be extracted to %execPath%
echo.
echo.
echo 1. Generate New queue
echo 2. Play existing queue
echo 3. Change current directory (effects only for single session)
echo 4. Check other projects on my github! (github.com/anonymousrunaway)
echo.
set /p todo=Enter choice (number):  
CALL :%todo%
if %errorlevel% == 0 (
     echo Exit Code 0: Sucesfully executed
	 pause
) else (
     echo Execution Failed... Exit Code %errorlevel%. Raise an issue on github or make sure song names do not contain special charachters.
	 pause
)
cls
goto menu


:1
echo.
echo.
echo Queue Generation:
echo.
echo 0. Generate Sequential Queue
echo 1. Generate Randomized Queue
set /p todo=Enter choice (number) :  
echo Generating Queue...
del *.vbs 2>nul
for %%f in (*.mp3) do CALL :fn "%%f" %todo%
EXIT /B 0

:fn
set /a randomizer=(%random%%%10)*%~2
set vtrack=%randomizer%%~1
echo CreateObject("Wscript.Shell").Run "wmplayer /play /close ""%execPath%/%~1""", 0, False>"%vtrack%".vbs
echo Dim oShell  : Set oShell  = CreateObject("Shell.Application")>>"%vtrack%".vbs
echo Dim oFolder : Set oFolder = oShell.Namespace("%execPathSlashed%")>>"%vtrack%".vbs
echo Dim oFile   : Set oFile   = oFolder.ParseName("%~1")>>"%vtrack%".vbs
echo Dim strLength : strLength = oFolder.GetDetailsOf(oFile, 27)>>"%vtrack%".vbs
echo WScript.Sleep(Mid(strLength,7,2)*1000+Mid(strLength,4,2)*1000*60+3000+Mid(strLength,1,2)*1000*60*60)>>"%vtrack%".vbs
goto :eof


:2
echo Playing...
for %%f in (*.vbs) do (CALL :play "%%f")
EXIT /B 0

:4
echo Redierecting..
start www.github.com/anonymousrunaway
EXIT /B 0

:3
echo.
echo Quick tip: You can permanently change directory by editing the file itself.
set /p execPath=Directory with '/' (Forward Slashes)
set /p execPathSlashed=Directory with '\' (Backward Slashes)

:play
set track=%~1
set track = !track:~%currentqueue%!
echo !track:~1,-8!>nowPlaying.txt
echo Now Playing: !track:~1,-8!
"%track%"
EXIT /B 0

goto :eof