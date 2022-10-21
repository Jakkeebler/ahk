#SingleInstance Force
#Requires AutoHotkey v2.0-beta.5
#Include Functions.ahk
#Include lib\checklist\include.ahk
TraySetIcon(A_WorkingDir "\Support Files\Icons\checklist.ico")

;\\CURRENT SCRIPT VERSION\\This is a "script" local version and doesn't relate to the Release Version
version := "v2.6.2.1"
;todays date
today := A_YYYY "_" A_MM "_" A_DD

;THIS SCRIPT --->>
;isn't designed to be launched from this folder specifically - it gets moved to the current project folder through a few other Streamdeck AHK scripts
;DO NOT RELOAD THIS SCRIPT WITHOUT FIRST STOPPING THE TIMER - PRESSING THE `X` IS FINE BUT RELOADING FROM THE FILE MIGHT CAUSE IT TO CLOSE WITHOUT WRITING THE ELAPSED TIME

;SET THE AMOUNT OF MINUTES YOU WANT THE REMINDER TIMER TO WAIT HERE
minutes := 1
global ms := minutes * 60000
;SET THE AMOUNT OF MINUTES YOU WANT INBETWEEN EACH TIME THE SCRIPT LOGS HOW MUCH TIME HAS PASSED (purely for backup purposes)
minutes2 := 10
global ms10 := minutes2 * 60000
checklist := ""
global WaitTrack := 0
if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;if the checklist is reloaded, we don't want it to automatically attempt to grab the title of the currently open premiere project - this allows us to open/create new projects while premiere is open
    {
        premNotOpen(&checklist, &logs, &path)
        if WinExist("Select commission folder")
            WinWaitClose("Select commission folder")
        if WinExist("Wait or Continue?")
                    WinWaitClose("Wait or Continue?")
    }
else
    {
        if !WinExist("Adobe Premiere Pro")
            {
                premNotOpen(&checklist, &logs, &path)
                if WinExist("Select commission folder")
                    WinWaitClose("Select commission folder")
                if WinExist("Wait or Continue?")
                    WinWaitClose("Wait or Continue?")
                goto end
            }
        getPremName(&Nameprem, &titlecheck, &savecheck) ;first we grab some information about the premiere pro window
        if !IsSet(titlecheck) ;we ensure the title variable has been assigned before proceeding forward
            {
                block.Off()
                tool.Cust("``titlecheck`` variable wasn't assigned a value")
                errorLog(A_ThisFunc "()", "Variable wasn't assigned a value", A_LineFile, A_LineNumber)
                premNotOpen(&checklist, &logs, &path)
                if WinExist("Select commission folder")
                    WinWaitClose("Select commission folder")
                if WinExist("Wait or Continue?")
                    WinWaitClose("Wait or Continue?")
                goto end
            }
        dashLocation := InStr(Nameprem, "-")
        if !dashLocation
            {
                if WaitTrack = 0
                    {
                        ScriptSuspend("autosave.ahk", true) ;suspend
                        pauseautosave()
                        WaitTrack := 1
                        SetTimer(msgboxName, 50)
                        Result := MsgBox("You haven't opened a project yet, do you want ``" A_ScriptName "`` to wait until you have?`nOr would you like to select the checklist file now?", "Wait or Continue?", "4 32 4096")
                        if Result = "Yes"
                            {
                                SetTimer(waitUntil, -1000)
                                return
                            }
                    }
                premNotOpen(&checklist, &logs, &path)
                if WinExist("Select commission folder")
                    WinWaitClose("Select commission folder")
                if WinExist("Wait or Continue?")
                    WinWaitClose("Wait or Continue?")
                goto end
            }
        length := StrLen(Nameprem) - dashLocation
        entirePath := SubStr(Nameprem, dashLocation + "2", length)
        pathlength := StrLen(entirePath)
        finalSlash := InStr(entirePath, "\",, -1)
        path := SubStr(entirePath, 1, finalSlash - "1")
        checklist := path "\checklist.ini"
        logs := path "\checklist_logs.txt"
        if !FileExist(checklist)
            generateINI(checklist)
        end:
    }

globalCheckTool := 1
globalDarkTool := 1
;grabbing the location dir of the users copy of tomshi's scripts. This will allow any deployed checklist scripts to automatically update
if FileExist(A_MyDocuments "\tomshi\settings.ini")
    {
        location := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
        tooltipSettings := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "checklist tooltip", "true")
        if tooltipSettings = "true"
            global globalCheckTool := 1
        else
            global globalCheckTool := 0

        darkSettings := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "dark mode", "true")
        if darkSettings = "true"
            global globalDarkTool := 1
        else
            global globalDarkTool := 0
    }

#Include lib\checklist\verCheck.ahk

;getting the title
SplitPath(path, &name)

;grabbing hour information from ini file
getTime := IniRead(checklist, "Info", "time")
timeForLog := Round(getTime / 3600, 3)
if getTime = 0
    timeForLog := "0.000"
;checking for log file
if !FileExist(logs)
    FileAppend("Initial creation time : " today ", " A_Hour ":" A_Min ":" A_Sec "`n`n{ " today " - " timeForLog "`n", logs)

newDate(&today)

;menubar
#Include lib\checklist\menubar.ahk

;defining title
title := MyGui.Add("Text", "X8 Y2 w215 H23", "Checklist - " name)
title.SetFont("bold")

;checkboxes
#Include lib\checklist\checkboxes.ahk

;buttons
#Include lib\checklist\buttons.ahk

;timer text
#Include lib\checklist\timerText.ahk


FileAppend("\\ The checklist was opened : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after opening = " startHoursRounded " -- seconds at opening = " startValue "`n", logs)
SetTimer(reminder, -ms)

;timer
global StartTickCount := "" ;that is required to start blank or the time will continue to increment while the timer is paused
global ElapsedTime := 0 + startValue ;a starting value for the timer


if darkToolTrack = 1
    which()

MyGui.OnEvent("Close", close) ;what happens when you close the GUI
MyGui.Show("AutoSize")
MyGui.Move(-345, -191,,) ;I have it set to move onto one of my other monitors, if you notice that you can't see it after opening or it keeps warping to a weird location, this line of code is why
;finish defining GUI