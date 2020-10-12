CreateObject("Wscript.Shell").Run "wmplayer /play /close ""C:/Users/%USERNAME%/Downloads/Music/%track%""", 0, False
Const LENGTH = 27
Dim oShell  : Set oShell  = CreateObject("Shell.Application")
Dim oFolder : Set oFolder = oShell.Namespace("C:/Users/%USERNAME%/Downloads/Music")
Dim oFile   : Set oFile   = oFolder.ParseName("%track%")
Dim strLength : strLength = oFolder.GetDetailsOf(oFile, LENGTH)
Dim min, second, sleepTime
min = CLng(Mid(strLength,4,2)*1000*60)
second = CLng(Mid(strLength,7,2)*1000)
sleepTime = min+second+100
WScript.Sleep(sleepTime)

'sample vbs created by the script, not used by program
