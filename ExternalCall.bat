rem @echo off
set execPath=C:/Users/%USERNAME%/Downloads/Music
set execPathSlashed=C:\Users\%USERNAME%\Downloads\Music
rem change accordingly
cd /d %execPath%
for %%f in (*.mp3) do VbsMaker.bat "%%f" "%execPath%" "%execPathSlashed%"

pause
