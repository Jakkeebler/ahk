;#SingleInstance Force ;LEAVE THIS LIKE THIS SO YOU DON'T ACCIDENTLY OPEN IT AGAIN
#Requires AutoHotkey v2.0-beta.5
;TraySetIcon(location "\Support Files\Icons\checklist.ico") ;we set this later if the user has generated a settings.ini file

;\\CURRENT SCRIPT VERSION\\This is a "script" local version and doesn't relate to the Release Version
version := "v2.4.6"

;todays date
today := A_YYYY "_" A_MM "_" A_DD

;THIS SCRIPT --->>
;isn't designed to be launched from this folder specifically - it gets moved to the current project folder through a few other Streamdeck AHK scripts

;DO NOT RELOAD THIS SCRIPT WITHOUT FIRST STOPPING THE TIMER - PRESSING THE `X` IS FINE BUT RELOADING FROM THE FILE WILL CAUSE IT TO CLOSE WITHOUT WRITING THE ELAPSED TIME

/* toolCust()
  create a tooltip with any message
  * @param message is what you want the tooltip to say
  * @param timeout is how many ms you want the tooltip to last
  */
toolCust(message, timeout)
{
    ToolTip(message)
    SetTimer(timeouttime, - timeout)
    timeouttime()
    {
        ToolTip("")
    }
}

/*
 `floor()` is a built in math function of ahk to round down to the nearest integer, but when you want a decimal place to round down, you don't really have that many options. This function will allow us to round down after a certain amount of decimal places
 */
floorDecimal(num,dec) {
    return RegExReplace(num,"(?<=\.\d{" dec "}).*$")
}

;SET THE AMOUNT OF MINUTES YOU WANT THE REMINDER TIMER TO WAIT HERE
minutes := 1
global ms := minutes * 60000
;SET THE AMOUNT OF MINUTES YOU WANT INBETWEEN EACH TIME THE SCRIPT LOGS HOW MUCH TIME HAS PASSED (purely for backup purposes)
minutes2 := 10
global ms10 := minutes2 * 60000

;checking for ini file
if not FileExist(A_ScriptDir "\checklist.ini")
    FileAppend("[Info]`nFirstPass=0`nSecondPass=0`nTwitchOverlay=0`nYoutubeOverlay=0`nTransitions=0`nSFX=0`nMusic=0`nPatreon=0`nIntro=0`ntime=0", A_ScriptDir "\checklist.ini")

;grabbing the location dir of the users copy of tomshi's scripts. This will allow any deployed checklist scripts to automatically update
if FileExist(A_MyDocuments "\tomshi\settings.ini")
    {
        location := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
        TraySetIcon(location "\Support Files\Icons\checklist.ico")

        localVer(location)
        {
            verString := FileRead(location)
            foundpos := InStr(verString, 'v2',,,2)
            endpos := InStr(verString, ';', , foundpos, 1)
            end := endpos - foundpos - 5
            version := SubStr(verString, foundpos, end)
            return version
        }
        latestVer := localVer(location "\checklist.ahk")

        if VerCompare(latestVer, version) > 0
            {
                if !DirExist(A_ScriptDir "\backup")
                    DirCreate(A_ScriptDir "\backup")
                FileCopy(A_ScriptFullPath, A_ScriptDir "\backup", 1)
                FileCopy(A_ScriptDir "\checklist.ini", A_ScriptDir "\backup\checklist.ini", 1)
                FileCopy(A_ScriptDir "\checklist_logs.txt", A_ScriptDir "\backup\checklist_logs.txt", 1)

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
                }
                FileDelete(A_ScriptDir "\checklist.ini")
                FileAppend("[Info]`nFirstPass=" FP "`nSecondPass=" SP "`nTwitchOverlay=" TW "`nYoutubeOverlay=" YT "`nTransitions=" TR "`nSFX=" SFX "`nMusic=" MU "`nPatreon=" PT "`nIntro=" INTR "`ntime=" TI, A_ScriptDir "\checklist.ini")

                FileCopy(location "\checklist.ahk", A_ScriptFullPath, 1)
                Reload()
            }
    }

;grabbing hour information from ini file
getTime := IniRead(A_ScriptDir "\checklist.ini", "Info", "time")
timeForLog := Round(getTime / 3600, 2)
if getTime = 0
    timeForLog := "0.00"
;checking for log file
if not FileExist(A_ScriptDir "\checklist_logs.txt")
    FileAppend("Initial creation time : " today ", " A_Hour ":" A_Min ":" A_Sec "`n`n{ " today " - " timeForLog "`n", A_ScriptDir "\checklist_logs.txt")

;a function to cut repeat code - will check the last date in the logs and then break up the group if the last date is different from today
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
newDate(&today)

;getting dir name for the title
FullFileName := A_ScriptDir
SplitPath FullFileName, &name

;start defining GUI
MyGui := Gui("AlwaysOnTop", "Editing Checklist - " name ".proj")
MyGui.SetFont("S12") ;Sets the size of the font
MyGui.SetFont("W500") ;Sets the weight of the font (thickness)
MyGui.Opt("+MinSize300x300")

;defining title
title := MyGui.Add("Text", "X8 w215 H23", "Checklist - " name)
title.SetFont("bold")
;show version
ver := MyGui.Add("Text", "Right X+10", "⚙ " version)

;defining checkboxes
FirstPass := MyGui.Add("CheckBox", "vFirstPass X8 Y35", "First Pass")
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

Intro := MyGui.Add("CheckBox", "vIntro X+85 Y35", "Intro")
Intro.Value := IniRead(A_ScriptDir "\checklist.ini", "Info", "Intro")
Intro.OnEvent("Click", logCheckbox)

;buttons
startButton := MyGui.Add("Button","X110 Y180 w50 h30", "start") ;defining the start button
startButton.OnEvent("Click", start) ;what happens when you click the start button
stopButton := MyGui.Add("Button","X110 Y180 Y180 w0 h0", "stop") ;defining the stop button and making it invisible for now
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

timerHoursText := MyGui.Add("Text", "X10 Y+25 W25", "H: ") ;defining the hours text
timerHoursText.SetFont("S14")
timerText := MyGui.Add("Text", "X+1 w60", startHoursRounded) ;setting the text that will contain the numbers
timerText.SetFont("S16 cRed")

timerMinutesText := MyGui.Add("Text", "X+10 W25", "M: ") ;defining the minutes text
timerMinutesText.SetFont("S14")

timerMinutes := MyGui.Add("Text", "X+4 w30", startMinutesRounded) ;setting the text that will contain the numbers
timerMinutes.SetFont("S16 cRed")

timerSecondsText := MyGui.Add("Text", "X+10 W25", "S: ") ;defining the minutes text
timerSecondsText.SetFont("S14")

minutesForSeconds := Floor(startValue/60)
Seconds := Round((((startValue/60) - minutesForSeconds) * 60), 0)
timerSeconds := MyGui.Add("Text", "X+0 w30", Seconds) ;setting the text that will contain the numbers
timerSeconds.SetFont("S16 cRed")


FileAppend("\\ The checklist was opened : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after opening = " startHoursRounded " -- seconds at opening = " startValue "`n", A_ScriptDir "\checklist_logs.txt")
SetTimer(reminder, -ms)

;timer
global StartTickCount := "" ;that is required to start blank or the time will continue to increment while the timer is paused
global ElapsedTime := 0 + startValue ;a starting value for the timer
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
            toolCust("Don't forget you have the timer stopped!", "2000")
            SetTimer(, -ms)
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

MyGui.OnEvent("Close", close) ;what happens when you close the GUI
close(*) {
    forFile := Round(ElapsedTime / 3600, 3)
    IniWrite(ElapsedTime, A_ScriptDir "\checklist.ini", "Info", "time")
    newDate(&today)
    FileAppend("\\ The checklist was closed : " A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec " -- Hours after closing = " forFile " -- seconds at close = " ElapsedTime "`n", A_ScriptDir "\checklist_logs.txt")
    SetTimer(StopWatch, 0)
    SetTimer(reminder, 0)
    MyGui.Destroy()
    return
}

MyGui.Show("AutoSize")
MyGui.Move(-345, -177,,) ;I have it set to move onto one of my other monitors, if you notice that you can't see it after opening or it keeps warping to a weird location, this line of code is why
;finish defining GUI