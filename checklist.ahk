#SingleInstance Force
#Requires AutoHotkey v2.0-beta.5
;TraySetIcon(location "\Support Files\Icons\checklist.ico") ;we set this later if the user has generated a settings.ini file

;\\CURRENT SCRIPT VERSION\\This is a "script" local version and doesn't relate to the Release Version
version := "v2.5.4.5"
;todays date
today := A_YYYY "_" A_MM "_" A_DD

;THIS SCRIPT --->>
;isn't designed to be launched from this folder specifically - it gets moved to the current project folder through a few other Streamdeck AHK scripts
;DO NOT RELOAD THIS SCRIPT WITHOUT FIRST STOPPING THE TIMER - PRESSING THE `X` IS FINE BUT RELOADING FROM THE FILE WILL CAUSE IT TO CLOSE WITHOUT WRITING THE ELAPSED TIME

;SET THE AMOUNT OF MINUTES YOU WANT THE REMINDER TIMER TO WAIT HERE
minutes := 1
global ms := minutes * 60000
;SET THE AMOUNT OF MINUTES YOU WANT INBETWEEN EACH TIME THE SCRIPT LOGS HOW MUCH TIME HAS PASSED (purely for backup purposes)
minutes2 := 10
global ms10 := minutes2 * 60000

;checking for ini file
if not FileExist(A_ScriptDir "\checklist.ini")
    FileAppend("[Info]`nFirstPass=0`nSecondPass=0`nTwitchOverlay=0`nYoutubeOverlay=0`nTransitions=0`nSFX=0`nMusic=0`nPatreon=0`nIntro=0`ntime=0`ntooltip=1`ndark=1`nver=" version, A_ScriptDir "\checklist.ini")
globalCheckTool := 1
globalDarkTool := 1
;grabbing the location dir of the users copy of tomshi's scripts. This will allow any deployed checklist scripts to automatically update
if FileExist(A_MyDocuments "\tomshi\settings.ini")
    {
        location := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
        TraySetIcon(location "\Support Files\Icons\checklist.ico")
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

        localVer(location)
        {
            verString := FileRead(location)
            foundpos := InStr(verString, 'v2',,, 2)
            endpos := InStr(verString, '"', , foundpos, 1)
            end := endpos - foundpos
            version := SubStr(verString, foundpos, end)
            return version
        }
        latestVer := localVer(location "\checklist.ahk")
        trythenDel(which)
        {
            try {
                FP := IniRead(A_ScriptDir "\checklist.ini", "Info", "FirstPass", "0")
                SP := IniRead(A_ScriptDir "\checklist.ini", "Info", "SecondPass", "0")
                TW := IniRead(A_ScriptDir "\checklist.ini", "Info", "TwitchOverlay", "0")
                YT := IniRead(A_ScriptDir "\checklist.ini", "Info", "YoutubeOverlay", "0")
                TR := IniRead(A_ScriptDir "\checklist.ini", "Info", "Transitions", "0")
                SFX := IniRead(A_ScriptDir "\checklist.ini", "Info", "SFX", "0")
                MU := IniRead(A_ScriptDir "\checklist.ini", "Info", "Music", "0")
                PT := IniRead(A_ScriptDir "\checklist.ini", "Info", "Patreon", "0")
                INTR := IniRead(A_ScriptDir "\checklist.ini", "Info", "Intro", "0")
                TI := IniRead(A_ScriptDir "\checklist.ini", "Info", "time", "0")
                TOOL := IniRead(A_ScriptDir "\checklist.ini", "Info", "tooltip", "1")
                DARK := IniRead(A_ScriptDir "\checklist.ini", "Info", "dark", "1")
                VER := IniRead(A_ScriptDir "\checklist.ini", "Info", "ver")
            }
            FileDelete(A_ScriptDir "\checklist.ini")
            FileAppend("[Info]`nFirstPass=" FP "`nSecondPass=" SP "`nTwitchOverlay=" TW "`nYoutubeOverlay=" YT "`nTransitions=" TR "`nSFX=" SFX "`nMusic=" MU "`nPatreon=" PT "`nIntro=" INTR "`ntime=" TI "`ntooltip=" TOOL "`ndark=" DARK "`nver=", A_ScriptDir "\checklist.ini")
            if which = "VER"
                FileAppend(VER, A_ScriptDir "\checklist.ini")
            if which = "version"
                FileAppend(version, A_ScriptDir "\checklist.ini")
        }
        if VerCompare(latestVer, version) > 0
            {
                if !DirExist(A_ScriptDir "\backup")
                    DirCreate(A_ScriptDir "\backup")
                FileCopy(A_ScriptFullPath, A_ScriptDir "\backup", 1)
                FileCopy(A_ScriptDir "\checklist.ini", A_ScriptDir "\backup\checklist.ini", 1)
                FileCopy(A_ScriptDir "\checklist_logs.txt", A_ScriptDir "\backup\checklist_logs.txt", 1)
                trythenDel("which")
                FileCopy(location "\checklist.ahk", A_ScriptFullPath, 1)
                Reload()
            }
        if VerCompare(latestVer, version) = 0
            {
                checkVer := IniRead(A_ScriptDir "\checklist.ini", "Info", "ver")
                if checkVer != version
                    {
                        if !DirExist(A_ScriptDir "\backup")
                            DirCreate(A_ScriptDir "\backup")
                        FileCopy(A_ScriptFullPath, A_ScriptDir "\backup", 1)
                        FileCopy(A_ScriptDir "\checklist.ini", A_ScriptDir "\backup\checklist.ini", 1)
                        FileCopy(A_ScriptDir "\checklist_logs.txt", A_ScriptDir "\backup\checklist_logs.txt", 1)
                        trythenDel("version")
                        FileCopy(location "\checklist.ahk", A_ScriptFullPath, 1)
                        Reload()
                    }
        
            }
    }

;grabbing hour information from ini file
getTime := IniRead(A_ScriptDir "\checklist.ini", "Info", "time")
timeForLog := Round(getTime / 3600, 3)
if getTime = 0
    timeForLog := "0.000"
;checking for log file
if not FileExist(A_ScriptDir "\checklist_logs.txt")
    FileAppend("Initial creation time : " today ", " A_Hour ":" A_Min ":" A_Sec "`n`n{ " today " - " timeForLog "`n", A_ScriptDir "\checklist_logs.txt")

newDate(&today)

;getting dir name for the title
FullFileName := A_ScriptDir
SplitPath FullFileName, &name

;define menu
;file menus
FileMenu := Menu()
FileMenu.Add("&New`tCtrl+N", fileNewCheck)
FileMenu.Add("&Open`tCtrl+O", fileOpenCheck)
FileMenu.Add("E&xit", close)
;settings menu
SettingsMenu := Menu()
SettingsMenu.Add("&Tooltips", tooltips)
SettingsMenu.Add("&Dark Mode", goDark)
settingsToolTrack := 0
if IniRead(A_ScriptDir "\checklist.ini", "Info", "tooltip") = "1"
    {
        SettingsMenu.Check("&Tooltips")
        if globalCheckTool != 0
            global settingsToolTrack := 1
        else
            global settingsToolTrack := 0
    }
if globalCheckTool = 0
    SettingsMenu.Disable("&Tooltips")
else
    SettingsMenu.Enable("&Tooltips")

darkToolTrack := 0
if IniRead(A_ScriptDir "\checklist.ini", "Info", "dark") = "1"
{
    SettingsMenu.Check("&Dark Mode")
    if globalDarkTool != 0
        global darkToolTrack := 1
    else
        global darkToolTrack := 0
}
if globalDarkTool = 0
    SettingsMenu.Disable("&Dark Mode")
else
    SettingsMenu.Enable("&Dark Mode")


;help menu
HelpMenu := Menu()
HelpMenu.Add("&About", aboutBox)
updateSub := Menu()
HelpMenu.Add("&Check for Update", updateSub)
updateSub.Add("&Stable", updateCheck)
updateSub.Add("&Beta", updateCheck)
HelpMenu.Add("&Github", github)
HelpMenu.Add("&Hours Worked", hours)
HelpMenu.Add("&Open Logs", openLog)
;define the entire menubar
bar := MenuBar()
bar.Add("&File", FileMenu)
bar.Add("&Settings", SettingsMenu)
bar.Add("&Help", HelpMenu)

;define GUI
MyGui := Gui("AlwaysOnTop", "Editing Checklist - " name ".proj")
MyGui.BackColor := 0xF0F0F0
MyGui.SetFont("S12") ;Sets the size of the font
MyGui.SetFont("W500") ;Sets the weight of the font (thickness)
MyGui.Opt("+MinSize300x300")
MyGui.MenuBar := bar
noDefault := MyGui.Add("Button", "Default W0 H0", "_")

;defining title
title := MyGui.Add("Text", "X8 Y2 w215 H23", "Checklist - " name)
title.SetFont("bold")

;defining checkboxes
FirstPass := MyGui.Add("CheckBox", "Section vFirstPass X8 Y+5", "First Pass")
FirstPass.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "FirstPass")
FirstPass.OnEvent("Click", logCheckbox)

SecondPass := MyGui.Add("CheckBox", "vSecondPass Y+4", "Second Pass")
SecondPass.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "SecondPass")
SecondPass.OnEvent("Click", logCheckbox)

TwitchOverlay := MyGui.Add("CheckBox", "vTwitchOverlay Y+4", "Twitch overlay")
TwitchOverlay.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "TwitchOverlay")
TwitchOverlay.OnEvent("Click", logCheckbox)

YoutubeOverlay := MyGui.Add("CheckBox", "vYoutubeOverlay Y+4", "Youtube overlay")
YoutubeOverlay.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "YoutubeOverlay")
YoutubeOverlay.OnEvent("Click", logCheckbox)

Transitions := MyGui.Add("CheckBox", "vTransitions Y+4", "Transitions")
Transitions.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "Transitions")
Transitions.OnEvent("Click", logCheckbox)

SFX := MyGui.Add("CheckBox",  "vSFX Y+4", "SFX")
SFX.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "SFX")
SFX.OnEvent("Click", logCheckbox)

Music := MyGui.Add("CheckBox", "vMusic Y+4", "Music")
Music.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "Music")
Music.OnEvent("Click", logCheckbox)

Patreon := MyGui.Add("CheckBox", "vPatreon Y+4", "Patreon")
Patreon.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "Patreon")
Patreon.OnEvent("Click", logCheckbox)

Intro := MyGui.Add("CheckBox", "vIntro X+85 ys", "Intro")
Intro.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "Intro")
Intro.OnEvent("Click", logCheckbox)

;buttons
startButton := MyGui.Add("Button","X110 Y180 w50 h30", "start") ;defining the start button
startButton.OnEvent("Click", start) ;what happens when you click the start button
stopButton := MyGui.Add("Button","X110 Y180 w0 h0", "stop") ;defining the stop button and making it invisible for now
stopButton.OnEvent("Click", stop) ;what happens when you click the stop button
group := MyGui.Add("GroupBox", "w137 h100 X167 Y120", "Time Adjust (min)")

List := MyGui.Add("ComboBox", "r10 Choose5 X180 Y145 w112 h30", ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
minusButton := MyGui.Add("Button","X178 Y180 w50 h30", "-sub") ;defining the - button
minusButton.OnEvent("Click", minusFive) ;what happens when you click the - button

plusButton := MyGui.Add("Button","X+15 w50 h30", "+add") ;defining the + button
plusButton.OnEvent("Click", plusFive) ;what happens when you click the + button

;timer text
global startValue := IniRead(A_ScriptDir "\checklist.ini", "Info", "time") ;gets the starting timecode value by reading the ini file
startHoursRounded := floorDecimal(startValue/3600, 3) ;getting the hours by dividing the seconds past then rounding to 2dp
startMinutesRounded := Floor(((startValue/3600) - floor(startValue/3600))*60) ;getting the minutes past the hour

timerHoursText := MyGui.Add("Text", "X10 Y+25 W18", "H: ") ;defining the hours text
timerHoursText.SetFont("S14")
timerText := MyGui.Add("Text", "X+5 w70", startHoursRounded " ") ;setting the text that will contain the numbers
timerText.SetFont("S16 cRed")

timerMinutesText := MyGui.Add("Text", "X+12 W22", "M: ") ;defining the minutes text
timerMinutesText.SetFont("S14")

timerMinutes := MyGui.Add("Text", "X+4 w30", startMinutesRounded) ;setting the text that will contain the numbers
timerMinutes.SetFont("S16 cRed")

timerSecondsText := MyGui.Add("Text", "X+10 W18", "S: ") ;defining the minutes text
timerSecondsText.SetFont("S14")

minutesForSeconds := Floor(startValue/60)
Seconds := Round((((startValue/60) - minutesForSeconds) * 60), 0)
timerSeconds := MyGui.Add("Text", "X+5 w30", Seconds) ;setting the text that will contain the numbers
timerSeconds.SetFont("S16 cRed")


FileAppend("\\ The checklist was opened : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after opening = " startHoursRounded " -- seconds at opening = " startValue "`n", A_ScriptDir "\checklist_logs.txt")
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


; ===========================================================================================================

;

;                           CHECKLIST FUNCTIONS

;

; ===========================================================================================================

start(*) {
    startButton.Move(,, 0, 0) ;hiding the start button
    stopButton.Move(,, 50, 30) ;showing the stop button
    timerText.SetFont("cGreen") ;changing the colours
    timerMinutes.SetFont("cGreen")
    timerSeconds.SetFont("cGreen")
    forFile := Round(ElapsedTime / 3600, 3)
    newDate(&today)
    FileAppend("\\ The timer was started : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Starting Hours = " forFile " -- seconds at start = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
    global StartTickCount := A_TickCount ;This allows us to use your computer to determine how much time has past by doing some simple math below
    SetTimer(StopWatch, 10) ;start the timer and loop it as often as possible
    SetTimer(logElapse, -ms10)
    SetTimer(reminder, 0)
}
StopWatch() {
    if WinExist("Editing Checklist") ;this check is to stop the timer from running once you close the GUI
        {
            if ((A_TickCount - StartTickCount) >= 1000) ;how we determine once more than 1s has passed
                {
                    global StartTickCount += 1000
                    global ElapsedTime += 1
                    displayHours := floorDecimal(ElapsedTime/3600, 3)
                    timerText.Text := displayHours
                    displayMinutes := Floor(((ElapsedTime/3600) - floor(ElapsedTime/3600))*60)
                    timerMinutes.Text := displayMinutes
                    minforSec := Floor(ElapsedTime/60)
                    displaySeconds := Round((((ElapsedTime/60) - minforSec) * 60), 0)
                    timerSeconds.Text := displaySeconds
                }
        }
    else
        SetTimer(StopWatch, 0)
}
stop(*) {
    forFile := Round(ElapsedTime / 3600, 3)
    checkHours := IniRead(A_ScriptDir "\checklist.ini", "Info", "time")
    if ElapsedTime != checkHours
        IniWrite(ElapsedTime, A_ScriptDir "\checklist.ini", "Info", "time") ;once the timer is stopped it will write the elapsed time to the ini file
    newDate(&today)
    FileAppend("\\ The timer was stopped : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Stopping Hours = " forFile " -- seconds at stop = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
    SetTimer(StopWatch, 0) ;then stop the timer
    startButton.Move(,, 50, 30) ;then show the start button
    stopButton.Move(,, 0, 0) ;and hide the stop button
    timerText.SetFont("cRed") ;and return the colour to red
    timerMinutes.SetFont("cRed")
    timerSeconds.SetFont("cRed")
    SetTimer(logElapse, 0)
    SetTimer(reminder, -ms)
    global startValue := IniRead(A_ScriptDir "\checklist.ini", "Info", "time") ;then update startvalue so it will start from the new elapsed time instead of the original
}
minusOrAdd(sign) ;this function is to reduce copy/paste code in some .OnEvent return functions
{
    forFile := Round(ElapsedTime / 3600, 3)
    word := ""
    IniWrite(ElapsedTime, A_ScriptDir "\checklist.ini", "Info", "time")
    global initialRead := IniRead(A_ScriptDir "\checklist.ini", "Info", "time")
    if sign = "-"
        {
            word := "removed"
            funcMinutes := ((List.Text * 60) + 1)
            newValue := initialRead - funcMinutes
        }
    else
        {
            word := "added"
            funcMinutes := ((List.Text * 60) - 1)
            newValue := initialRead + funcMinutes
        }
    if newValue < 0
        newValue := 0
    change := IniWrite(newValue, A_ScriptDir "\checklist.ini", "Info", "time")
    SetTimer(StopWatch, -1000)
    timerText.SetFont("cRed")
    timerMinutes.SetFont("cRed")
    timerSeconds.SetFont("cRed")
    startButton.Move(,, 50, 30)
    stopButton.Move(,, 0, 0)
    SetTimer(logElapse, 0)
    SetTimer(reminder, -ms)
    global startValue := IniRead(A_ScriptDir "\checklist.ini", "Info", "time")
    global ElapsedTime := 0 + startValue
    global StartTickCount := A_TickCount
    newDate(&today)
    FileAppend("\\ The timer was stopped and " List.Text "min " word " : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after stopping = " forFile " -- seconds after stopping = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
}
minusFive(*) {
    minusOrAdd("-")
}
plusFive(*) {
    minusOrAdd("+")
}
reminder() {
    if WinExist("ahk_exe Adobe Premiere Pro.exe")
        {
            if settingsToolTrack = 1
                {
                    toolCust("Don't forget you have the timer stopped!", "2000")
                    SetTimer(, -ms)
                }
            else if settingsToolTrack = 0
                SetTimer(, 0)
        }
    else
        SetTimer(, 0)
}
logElapse() {
    forFile := Round(ElapsedTime / 3600, 3)
    newDate(&today)
    FileAppend(A_Tab "\\ " minutes2 "min has passed since last log : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- current hours = " forFile " -- current seconds = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
    SetTimer(, -ms10)
}

;defining what happens when checkboxes are clicked
logCheckbox(*) {
    forFile := Round(ElapsedTime / 3600, 3)
    logState := ""
    logCheck := ""
    logState := "enabled"
    logCheck := "enabling"
    Saved := MyGui.Submit(0)  ; Save the contents of named controls into an object.
    for name, value in Saved.OwnProps()
        {
            startVal := IniRead(A_ScriptDir "\checklist.ini", "Info", name)
            if startVal != value
                {
                    IniWrite(value, A_ScriptDir "\checklist.ini", "Info", name)
                    if value = 0
                        {
                            logState := "disabled"
                            logCheck := "disabling"
                        }
                    newDate(&today)
                    FileAppend("\\ ``" name "`` was " logState " : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after " logCheck "  = " forFile " -- seconds after " logCheck " = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
                }
        }
}
;what happens when you close the checklist
close(*) {
    forFile := Round(ElapsedTime / 3600, 3)
    checkHours := IniRead(A_ScriptDir "\checklist.ini", "Info", "time")
    if ElapsedTime != checkHours
        IniWrite(ElapsedTime, A_ScriptDir "\checklist.ini", "Info", "time")
    newDate(&today)
    
    if ElapsedTime = checkHours
        FileAppend("\\ The checklist was closed : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec "`n", A_ScriptDir "\checklist_logs.txt")
    else
        FileAppend("\\ The checklist was closed : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after closing = " forFile " -- seconds at close = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
    SetTimer(StopWatch, 0)
    SetTimer(reminder, 0)
    MyGui.Destroy()
    return
}

; ===========================================================================================================

;

;                           OTHER FUNCTIONS

;

; ===========================================================================================================

/**
 * Create a tooltip with any message. This tooltip will then follow the cursor and only redraw itself if the user has moved the cursor.
 * 
 * If you wish for the tooltip to plant next to the mouse and not follow the cursor, similar to a normal tooltip, that can be achieved with something along the lines of;
 * 
 * `toolCust(message,,, MouseGetPos(&x, &y) x + 15, y)`
 * @param {string} message is what you want the tooltip to say
 * @param {number} timeout is how many ms you want the tooltip to last. This value can be omitted and it will default to 1s
 * @param {boolean} find is whether you want this function to state "Couldn't find " at the beginning of it's tooltip. Simply add 1 (or true) for this variable if you do, or omit it if you don't
 * @param {number} xy the x & y coordinates you want the tooltip to appear. These values are unset by default and can be omitted
 * @param {integer} WhichToolTip omit this parameter if you don't need multiple tooltips to appear simultaneously. Otherwise, this is a number between 1 and 20 to indicate which tooltip window to operate upon. If unspecified, that number is 1 (the first).
 */
toolCust(message, timeout := 1000, find := false, x?, y?, WhichToolTip?)
{
    MouseGetPos(&xpos, &ypos) ;log our starting mouse coords
    time := A_TickCount ;log our starting time
    messageFind := find = 1 ? "Couldn't find " : "" ;this is essentially saying: if find = 1 then messageFind := "Couldn't find " else messageFind := ""
    ToolTip(messageFind message, x?, y?, WhichToolTip?) ;produce the initial cursor
    if !IsSet(x) && !IsSet(y) ;if a x/y value hasn't been passed then that means we want the tooltip to follow the cursor
        SetTimer(moveWithMouse, 15)
    else
        SetTimer(() => ToolTip("",,, WhichToolTip?), - timeout) ;otherwise we create a timer to remove the cursor after the timout period
    moveWithMouse() ;this timer is what allows the tooltip to follow the cursor
    {
        if (A_TickCount - time) >= timeout ;here we compare the current time, minus the original time and see if it's been longer than the timeout time
            {
                SetTimer(, 0) ;if it has we kill the timer
                ToolTip("",,, WhichToolTip?) ;and kill the tooltip
                return ;then kill the function
            }
        MouseGetPos(&newX, &newY) ;here we're grabbing new mouse coords
        if newX != xpos || newY != ypos ;so we can compare them to the old coords
            {
                MouseGetPos(&xpos, &ypos) ;if they're different we'll replace the original coords
                ToolTip(messageFind message,,, WhichToolTip?) ;and produce a new tooltip
            }
    }
}

/**
 * This function will find the path name of the current Premiere/After Effects project. This is then used when clicking "File" in the checklist menu to check if the current open project is the same project as the script you have open
 */
openChecklist()
{
    try {
        if WinExist("Adobe Premiere Pro")
            {
                Name := WinGetTitle("Adobe Premiere Pro")
                titlecheck := InStr(Name, "Adobe Premiere Pro " A_Year " -") ;change this year value to your own year. | we add the " -" to accomodate a window that is literally just called "Adobe Premiere Pro [Year]"
                if titlecheck = ""
                    {
                        toolCust("``titlecheck`` variable wasn't assigned a value")
                        return 0
                    }
            }
        else if WinExist("Adobe After Effects")
            {
                Name := WinGetTitle("Adobe After Effects")
                titlecheck := InStr(Name, "Adobe After Effects " A_Year " -") ;change this year value to your own year. | we add the " -" to accomodate a window that is literally just called "Adobe After Effects [Year]"
                if titlecheck = ""
                    {
                        toolCust("``afterFXTitle`` variable wasn't assigned a value")
                        return 0
                    }
            }
        dashLocation := InStr(Name, "-")
        length := StrLen(Name) - dashLocation
    }
    if not IsSet(titlecheck) || IsSet(afterFXTitle)
        {
            toolCust("``titlecheck/afterFXTitle`` variable wasn't assigned a value")
            return 0
        }
    if not titlecheck
        {
            toolCust("You're on a part of Premiere that won't contain the project path", 2000)
            return 0
        }
    entirePath := SubStr(name, dashLocation + "2", length)
    pathlength := StrLen(entirePath)
    finalSlash := InStr(entirePath, "\",, -1)
    directory := SubStr(entirePath, 1, finalSlash - "1")
    ;noproj := SplitPath(directory,, &dir)
    return directory
}

/**
 * `floor()` is a built in math function of ahk to round down to the nearest integer, but when you want a decimal place to round down, you don't really have that many options. This function will allow us to round down after a certain amount of decimal places
 */
floorDecimal(num,dec) => RegExReplace(num,"(?<=\.\d{" dec "}).*$")

/**
 * A function to cut repeat code - will check the last date in the logs and then break up the group if the last date is different from today
 */
newDate(&today)
{
    ;getting the last date present in the log file
    getLastDate(&today)
    {
        ;todays date
        today := A_YYYY "_" A_MM "_" A_DD
        read := FileRead(A_ScriptDir "\checklist_logs.txt")
        if InStr(read, A_YYYY "_",, -1)
            foundpos := InStr(read, A_YYYY "_",, -1)
        else ;this block is just incase you open a checklist in a new year
            {
                lastYear := A_YYYY - 1
                if InStr(read, lastYear "_",, -1)
                    foundpos := InStr(read, lastYear "_",, -1)
                else ;if the last logged years is a long time ago, we will just default back to this year to stop errors
                    {
                        lastdate := A_YYYY
                        return lastdate
                    }

            }
        endpos := InStr(read, ",",, foundpos)
        end := endpos - foundpos
        lastdate := SubStr(read, foundpos, end)
        return lastdate
    }
    lastdate := getLastDate(&today)
    if today != lastdate && lastdate != ""
        FileAppend("}`n`n{ " today " - " timeForLog "`n",  A_ScriptDir "\checklist_logs.txt")
}

/**
 * A function for the menubar to work correctly
 */
tooltips(*)
{
    if settingsToolTrack = 1
        {
            global settingsToolTrack := 0
            SettingsMenu.UnCheck("&Tooltips")
            IniWrite("0", A_ScriptDir "\checklist.ini", "Info", "tooltip")
            restart()
        }
    else if settingsToolTrack = 0
        {
            global settingsToolTrack := 1
            SettingsMenu.Check("&Tooltips")
            IniWrite("1", A_ScriptDir "\checklist.ini", "Info", "tooltip")
            restart()
        }

    restart()
    {
        forFile := Round(ElapsedTime / 3600, 3)
        IniWrite(ElapsedTime, A_ScriptDir "\checklist.ini", "Info", "time")
        newDate(&today)
        FileAppend("\\ The checklist tooltip setting was changed : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after closing = " forFile " -- seconds at close = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
        SetTimer(StopWatch, 0)
        SetTimer(reminder, 0)
        Reload
    }
}

fileNewCheck(*)
{
    stop()
    selectDir := FileSelect("D10", "::{20d04fe0-3aea-1069- a2d8-08002b30309d}", "Select target directory")
    if selectDir = ""
        return
    if FileExist(A_MyDocuments "\tomshi\settings.ini")
        {
            workDir := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
            try {
                if !FileExist(selectDir "\checklist.ahk")
                    FileCopy(workDir "\checklist.ahk", selectDir "\checklist.ahk")
                else
                    {
                        MsgBox("checklist.ahk file already exists in the target directory")
                        return
                    }
            } catch as e {
                return
            }
        }
    else
        {
            try {
                if !FileExist(selectDir "\checklist.ahk")
                    FileCopy(A_ScriptFullPath, selectDir "\checklist.ahk")
                else
                    {
                        MsgBox("checklist.ahk file already exists in the target directory")
                        return
                    }
            } catch as e {
                return
            }
        }
    Run(selectDir "\checklist.ahk")
    close()
}

fileOpenCheck(*)
{
    stop()
    if WinExist("Adobe Premiere Pro") || WinExist("Adobe After Effects")
        {
            currentWorkPath := openChecklist()
            if currentWorkPath != A_ScriptDir && FileExist(currentWorkPath "\checklist.ahk") && currentWorkPath != 0
                {
                    Run(currentWorkPath "\checklist.ahk")
                    ExitApp()
                }
        }
    backOneDir := InStr(A_ScriptDir, "\",,, -2)
    fullDir := SubStr(A_ScriptDir, 1, backOneDir)
    findCheck := FileSelect(3, fullDir, "Open New Checklist.ahk", "*.ahk")
    if findCheck = ""
        return
    else
        {
            Run(findCheck)
            ExitApp()
        }
}
aboutBox(*)
{
    MyGui.GetPos(&x, &y, &width, &height)
    aboutGUI := Gui("AlwaysOnTop", "About ©")
    aboutGUI.Opt("+Owner" MyGui.Hwnd)
    aboutGUI.Opt("+MinSize200x200")
    aboutGUI.SetFont("S12")
    aboutGUI.SetFont("W400")
    aboutGUI.BackColor := 0xF0F0F0
    MyGui.Opt("+Disabled")

    aboutGUI.Add("Text", "W200 Center", "Tomshi's Checklist`r&&`rEditing Tracker Script")
    verstionText := aboutGUI.Add("Text", "Center W200", "⚙ " version "`n© Tomshi " A_Year)
    verstionText.SetFont("S10")


    aboutGUI.OnEvent("Close", aboutClose)
    aboutGUI.Show("AutoSize")
    aboutGUI.GetPos(,, &aboutwidth, &aboutheight)
    aboutGUI.Move(x - (aboutwidth/2) + (width/2), y - (aboutheight/2) + (height/2))

    aboutClose(*)
    {
        MyGui.Opt("-Disabled")
        aboutGUI.Destroy
    }
}
github(*)
{
    if !WinExist("Tomshiii/ahk")
        Run("https://github.com/Tomshiii/ahk/tree/dev")
    else
        WinActivate("Tomshiii/ahk")
}
updateCheck(Item, *)
{
    tree := ""
    if Item = "&Stable"
        tree := "main"
    if Item = "&Beta"
        tree := "dev"
    try {
        main := ComObject("WinHttp.WinHttpRequest.5.1")
        main.Open("GET", "https://raw.githubusercontent.com/Tomshiii/ahk/" tree "/checklist.ahk")
        main.Send()
        main.WaitForResponse()
        string := main.ResponseText
    }  catch as e {
        toolCust("Couldn't get version info`nYou may not be connected to the internet")
        return
    }
    if !IsSet(string)
        return
    startPos := InStr(string, "version := ", 1, 1, 1)
    endpos := InStr(string, '"',, startPos, 2)
    latestVer := SubStr(string, startpos + 12, endpos - (startPos + 12))
    if VerCompare(latestVer, version) > 0
        {
            if WinExist("ahk/checklist.ahk at " tree " · Tomshiii/ahk")
                WinActive("ahk/checklist.ahk at " tree " · Tomshiii/ahk")
            else
                Run("https://github.com/Tomshiii/ahk/blob/" tree "/checklist.ahk")
        }
    else if VerCompare(version, latestVer) > 0
        toolCust("You are on a more up to date version!")
    else
        toolCust("You are up to date!")
}
hours(*)
{
    readLog := FileRead(A_ScriptDir "\checklist_logs.txt")
    findToday := InStr(readLog, A_YYYY "_" A_MM "_" A_DD,, 1, 1)
    findHours := InStr(readLog,  "Hours after opening =", 1, findToday, 1)
    endpos := InStr(readLog, "-",, findHours, 1)
    startHours := SubStr(readLog, findHours + 22, (endpos - 1) - (findHours + 22))

    currentHours := floorDecimal(ElapsedTime / 3600, 3)
    workedToday := floorDecimal(currentHours - startHours, 3)
    if workedToday <= 0
        workedToday := 0
    
    increment := 0
    StartVal := 0
    ;;
    loop {
        if !InStr(readLog, "{",,, A_Index)
            break
        startPos := InStr(readLog, "{",,, A_Index)
        finddash := InStr(readLog, "-",, startPos, 1)
        dateStart := SubStr(readLog, startPos + 2, (finddash-1)-(startPos+2))
        FindhoursEnd := InStr(readLog, "\",, finddash, 1)
        StartHours := SubStr(readLog, finddash + 2, (FindhoursEnd-1)-(finddash+2))
        LastDate := InStr(readLog, dateStart,,, -1)
        findEquals := InStr(readLog, "=",, LastDate, 1)
        lastHourEnd := InStr(readLog, "-",, findEquals, 1)
        lastHour := SubStr(readLog, findEquals + 2, (lastHourEnd-1)-(findEquals+2))

        if lastHour <= startHours
            goto ignore
        HoursWorkedForDate := lastHour-StartHours
        StartVal += HoursWorkedForDate
        increment += 1
        ignore:
    }
    if StartVal <= 0 || increment <= 0
        avg := "Not enough data"
    else
        avg := floorDecimal(StartVal/increment,3)

    MyGui.GetPos(&x, &y, &width, &height)
    hoursGUI := Gui("AlwaysOnTop", "Hours Worked")
    hoursGUI.Opt("+Owner" MyGui.Hwnd)
    hoursGUI.Opt("+MinSize200x200")
    hoursGUI.SetFont("S11")
    hoursGUI.SetFont("W400")
    hoursGUI.BackColor := 0xF0F0F0
    MyGui.Opt("+Disabled")

    hoursGUI.Add("Text", "W200 Center", "Hours worked today: " workedToday "`nDays worked: " increment "`nAvg Hours per day: " avg)

    hoursGUI.OnEvent("Close", hoursClose)
    hoursGUI.Show("AutoSize")
    hoursGUI.GetPos(,, &hourswidth, &hoursheight)
    hoursGUI.Move(x - (hourswidth/2) + (width/2), y - (hoursheight/2) + (height/2))

    hoursClose(*)
    {
        MyGui.Opt("-Disabled")
        hoursGUI.Destroy
    }
}

goDark(*)
{
    if darkToolTrack = 1
        {
            global darkToolTrack := 0
            SettingsMenu.UnCheck("&Dark Mode")
            IniWrite("0", A_ScriptDir "\checklist.ini", "Info", "dark")
            which(false, "Light")
        }
    else if darkToolTrack = 0
        {
            global darkToolTrack := 1
            SettingsMenu.Check("&Dark Mode")
            IniWrite("1", A_ScriptDir "\checklist.ini", "Info", "dark")
            which()
        }
}

which(dark := true, DarkorLight := "Dark")
{
    titleBarDarkMode(MyGui.Hwnd, dark)
    buttonDarkMode(startButton.Hwnd, DarkorLight)
    buttonDarkMode(stopButton.Hwnd, DarkorLight)
    buttonDarkMode(minusButton.Hwnd, DarkorLight)
    buttonDarkMode(plusButton.Hwnd, DarkorLight)

    titleBarDarkMode(hwnd, dark := true)
    {
        if VerCompare(A_OSVersion, "10.0.17763") >= 0 {
            attr := 19
            if VerCompare(A_OSVersion, "10.0.18985") >= 0 {
                attr := 20
            }
            DllCall("dwmapi\DwmSetWindowAttribute", "ptr", hwnd, "int", attr, "int*", dark, "int", 4)
        }
    }

    buttonDarkMode(ctrl_hwnd, DarkorLight := "Dark")
    {
        DllCall("uxtheme\SetWindowTheme", "ptr", ctrl_hwnd, "str", DarkorLight "Mode_Explorer", "ptr", 0)
    }
}

openLog(*)
{
    if FileExist(A_ScriptDir "\checklist_logs.txt")
        Run(A_ScriptDir "\checklist_logs.txt")
    else
        toolCust("the log file", 2000, 1)
}

OnExit ExitFunc
ExitFunc(ExitReason, ExitCode)
{
    if ExitReason = "Single"
        {
            stop()   
            close()
        }
}