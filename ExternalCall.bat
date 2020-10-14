@echo off
set execPath=C:/Users/jainv/Downloads/Music
set execPathSlashed=C:\Users\jainv\Downloads\Music
rem change accordingly
cd /d %execPath%
for %%f in (*.mp3) do VbsMaker.bat "%%f" "%execPath%" "%execPathSlashed%"

pause