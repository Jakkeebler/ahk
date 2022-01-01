#SingleInstance Force
SetWorkingDir A_ScriptDir
SetDefaultMouseSpeed 0
EnvSet("Windows", "C:\Program Files\ahk\ahk\ImageSearch\Windows\Win11\Settings\")

;
; This script is designed for Windows 11 and its settings menu. Older win10 compatible scripts can be seen backed up in the Win10 folder
;
firetip()
{
    ToolTip("couldn't find firefox")
    SetTimer(timeouttime, -1000)
	timeouttime()
	{
		ToolTip("")
	}
}
MouseGetPos(&sx, &sy)
Run("ms-settings:apps-volume")
WinWait("Settings")
if WinExist("Settings")
    WinActivate()
if WinActive("Settings")
    WinMaximize()
coordmode "pixel", "window"
coordmode "mouse", "window"
MouseMove(789, 375)
sleep 1000 ;this is necessary otherwise the imagesearches will try to fire before the window even loads
try {
    loop {
        ToolTip("This function searched " A_Index " time(s)`nto find firefox")
        if ImageSearch(&ffX, &ffY, 8, 8, 2567, 1447, "*2 " EnvGet("Windows") "firefox3.png")
            break
        else if ImageSearch(&ffX, &ffY, 8, 8, 2567, 1447, "*2 " EnvGet("Windows") "firefox.png")
           break
        else if ImageSearch(&ffX, &ffY, 8, 8, 2567, 1447, "*2 " EnvGet("Windows") "firefox2.png")
            break
        ToolTip("")
        if A_Index > 5
            {
                firetip()
                return
            }
    }
} catch as e {
    firetip()
    Exit
}
MouseMove(%&ffx%, %&ffy%)
Click()
sleep 500
if ImageSearch(&devX, &devY, %&ffX%, %&ffY% - "30", %&ffX% + 2500, %&ffY% + "30", "*2 " EnvGet("Windows") "default.png")
    goto end
else
    {
        SendInput("{Tab 3}")
        sleep 100
        SendInput("{Up 10}")
        sleep 100
       ; SendInput("{Enter}")
    }
end:
sleep 200
WinClose("Settings")
MouseMove(%&sx%, %&sy%)
ExitApp()