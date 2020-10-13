@echo off
set execPath=%cd%
for %%f in (%execPath%\*.mp3) do VbsMaker.bat "%%f"

pause
