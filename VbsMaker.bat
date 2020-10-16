@echo off

setlocal enabledelayedexpansion

set track=%1
set track=!track:~1,-1!

set execPath=%2
set execPath=!execPath:~1,-1!

echo CreateObject("Wscript.Shell").Run "wmplayer /play /close ""%execPath%/%track%""", 0, False>"%track%".vbs
echo Dim oShell  : Set oShell  = CreateObject("Shell.Application")>>"%track%".vbs
echo Dim oFolder : Set oFolder = oShell.Namespace(%3)>>"%track%".vbs
echo Dim oFile   : Set oFile   = oFolder.ParseName("%track%")>>"%track%".vbs
echo Dim strLength : strLength = oFolder.GetDetailsOf(oFile, 27)>>"%track%".vbs
echo WScript.Sleep(Mid(strLength,7,2)*1000+Mid(strLength,4,2)*1000*60+3000+Mid(strLength,1,2)*1000*60*60)>>"%track%".vbs
echo %track:~0,-4%>nowPlaying.txt

"%track%".vbs

:continue
del "%track%".vbs
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
