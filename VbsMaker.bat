rem @echo off
rem keep echo on for debugging
setlocal enabledelayedexpansion

set track=%1
set track=!track:~1,-1!

set execPath=C:/Users/%USERNAME%/Downloads/Music

set execPathSlashed=C:\Users\%USERNAME%\Downloads\Music

rem set execPath and execPathSlashed accordingly. If execPath is C:/Files, execPathSlashed should be C:\Files, with the other slash. 

echo CreateObject("Wscript.Shell").Run "wmplayer /play /close ""%execPath%/%track%""", 0, False>"%track%".vbs

echo Const LENGTH = 27>>"%track%".vbs

echo Dim oShell  : Set oShell  = CreateObject("Shell.Application")>>"%track%".vbs
echo Dim oFolder : Set oFolder = oShell.Namespace("%execPathSlashed%")>>"%track%".vbs
echo Dim oFile   : Set oFile   = oFolder.ParseName("%track%")>>"%track%".vbs

echo Dim strLength : strLength = oFolder.GetDetailsOf(oFile, LENGTH)>>"%track%".vbs

echo Dim min, second, sleepTime>>"%track%".vbs

echo min = CLng(Mid(strLength,4,2)*1000*60)>>"%track%".vbs

echo second = CLng(Mid(strLength,7,2)*1000)>>"%track%".vbs

echo sleepTime = min+second+100>>"%track%".vbs

echo WScript.Sleep(sleepTime)>>"%track%".vbs

echo %track:~0,-4%>nowPlaying.txt

rem use this file as text source

"%track%".vbs

:continue

del "%track%".vbs
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"