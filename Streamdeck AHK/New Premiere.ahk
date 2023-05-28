#SingleInstance Force
SetWorkingDir(A_ScriptDir)
SetDefaultMouseSpeed(0)

; { \\ #Includes
#Include <KSA\Keyboard Shortcut Adjustments>
#Include <Classes\ptf>
#Include <Classes\switchTo>
#Include <Classes\pause>
#Include <Classes\coord>
#Include <Classes\block>
#Include <Classes\Editors\Premiere>
#Include <Functions\delaySI>
; }

;// This version of the script (from 19th Dec, 2022) is designed for Premiere v22.3.1 (and beyond) - it copies a template project folder out of the `..\Backups\Adobe Backups\Premiere\Template\` folder and places it in the desired project folder. It then handles changing the proxy location
;// it runs the version of premiere set within `settingsGUI()`

;// Selecting the folder you wish to create the project in
SelectedFolder := FileSelect("D2", ptf.MyDir "\", "Select your desired Folder. This Script will create the necessary sub folders")
if SelectedFolder = ""
    return
pause.pause("autosave")
pause.pause("adobe fullscreen check")
DirCreate(SelectedFolder "\videos") ;creates a video folder if there isn't one already
DirCreate(SelectedFolder "\audio") ;creates an audio folder if there isn't one already
DirCreate(SelectedFolder "\proxies") ;creates the proxy folder we'll need later
DirCreate(SelectedFolder "\renders\draft") ;creates a folder to render drafts into
DirCreate(SelectedFolder "\renders\final") ;creates a folder to render the final into

;// Getting the name of the project folder to use as a default for the below inputbox
SplitPath(SelectedFolder, &default)
IB := InputBox("Enter the name of your project", "Project", "w100 h100", default)
    if IB.Result = "Cancel"
        {
            pause.pause("autosave")
            pause.pause("adobe fullscreen check")
            return
        }
;// Copying over the template file
count := 0
loop files ptf["premTemp"] "\*.prproj", "F" {
    chosenFile := A_LoopFileFullPath
    count++
}
if count > 1 {
    chosenFile := FileSelect("2", ptf["premTemp"], "Select the desired Project Template.", "Premiere Project File (*.prproj)")
    if chosenFile = ""
        return
}
FileCopy(chosenFile, SelectedFolder "\" IB.Value ".prproj")
Run(prem.path A_Space '"' SelectedFolder "\" IB.Value ".prproj" '"')
if !WinWait("Open Project",, 20)
    {
        check := MsgBox("Script didn't encounter Open Project window, can the script proceed?", "Check", "4 32 4096")
        if check = "No"
            {
                pause.pause("autosave")
                pause.pause("adobe fullscreen check")
                return
            }
        goto skip
    }
;! // make the below use something other than sleep??
;// waiting for premiere to load
sleep 5000
skip:
block.On()
switchTo.Premiere()
;// only needed because ingest below is commented out
pause.pause("autosave")
pause.pause("adobe fullscreen check")
block.Off()
;//

/**
;// if you want proxies to be automatically set to be created on ingest, uncomment the below code
SendInput(KSA.premIngest) ;we want to use a shortcut here instead of trying to navigate the alt menu because the alt menu is unreliable and often doesn't work as intended in scripts
if !WinWait("Project Settings",, 2)
    {
        sleep 1000
        WinActivate(editors.Premiere.winTitle)
        SendInput(KSA.premIngest) ;we want to use a shortcut here instead of trying to navigate the alt menu because the alt menu is unreliable and often doesn't work as intended in scripts
        if !WinWait("Project Settings",, 2)
            {
                block.Off()
                MsgBox("Opening Injest settings failed")
                pause.pause("autosave")
                pause.pause("adobe fullscreen check")
                return
            }
    }
sleep 1000
WinActivate("Project Settings")
coord.s()
MouseGetPos(&x, &y)
MouseMove(0, 0, 2) ;// get it out of the way
sleep 50
delaySI(500, "{Tab 3}")
delaySI(1000, "{Space}")
delaySI(50, "{Tab}", "{Space}", "{Down 2}", "{Space}")
sleep 1000
delaySI(300, "{Tab}" "{Space}", "{Down 5}" "{Space}", "{Tab 2}" "{Space}", "{Up}" "{Space}")
WinWait("Select Folder")
sleep 800
delaySI(800, "{F4}", "^a" "+{BackSpace}")
SendText(SelectedFolder "\proxies")
sleep 800
delaySI(250, "{Enter}", "+{Tab 5}", "{Enter}")
sleep 1750
delaySI(1000, "{Tab}" "{Space}") ;// if you're on premiere v22.5 or above you may need 2 tabs here. I've downgraded back to 22.3.1 for stability reasons
MouseMove(x, y, 2) ;// get it out of the way
block.Off()
Run(SelectedFolder) ;open an explorer window for your selected directory
SplitPath SelectedFolder, &name
if !WinExist("Checklist - " name)
    {
        try {
            Run(ptf["checklist"])
        } catch as e {
            tool.Cust("File not found")
        }
    }
pause.pause("autosave")
pause.pause("adobe fullscreen check")