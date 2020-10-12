setlocal enabledelayedexpansion

set track=%1
set track=!track:~1,-1!

echo CreateObject("Wscript.Shell").Run "wmplayer /play /close ""C:/Users/%USERNAME%/Downloads/Music/%track%""", 0, False>"%track%".vbs

echo Const LENGTH = 27>>"%track%".vbs

echo Dim oShell  : Set oShell  = CreateObject("Shell.Application")>>"%track%".vbs
echo Dim oFolder : Set oFolder = oShell.Namespace("C:\Users\%USERNAME%\Downloads\Music")>>"%track%".vbs
echo Dim oFile   : Set oFile   = oFolder.ParseName("%track%")>>"%track%".vbs

echo Dim strLength : strLength = oFolder.GetDetailsOf(oFile, LENGTH)>>"%track%".vbs

echo Dim min, second, sleepTime>>"%track%".vbs

echo min = CLng(Mid(strLength,4,2)*1000*60)>>"%track%".vbs

echo second = CLng(Mid(strLength,7,2)*1000)>>"%track%".vbs

echo sleepTime = min+second+100>>"%track%".vbs

echo WScript.Sleep(sleepTime)>>"%track%".vbs

echo WScript.Echo strLength>>"%track%".vbs

"%track%".vbs

:continue

del "%track%".vbs
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
taskkill /fi "IMAGENAME eq wmplayer.exe"
echo We are doneecho 