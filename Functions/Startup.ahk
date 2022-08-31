;v2.17.1

; =======================================================================================================================================
;
;
;				STARTUP
;
; =======================================================================================================================================
/* generate()
 This function will generate the settings.ini file if it doesn't already exist as well as regenerating it every new release to ensure any new .ini values are adding without breaking anything.
 Do note if you're pulling commits from the `dev` branch of this repo and I add something to this `settings.ini` file & you pull the commit before a new release, this function will not generate a new file for you and you may encounter errors. You can get around this by manually lowering the "version" number in the `settings.ini` file and then running `My Scripts.ahk`
 */
generate(MyRelease)
{
    ;checks if script was reloaded
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    deleteOld(&ADOBE, &WORK, &UPDATE, &FC, &TOOL)
    {
        if DirExist(A_MyDocuments "\tomshi\adobe")
            {
                try {
                    loop files, A_MyDocuments "\tomshi\adobe\*.*"
                        checkAdobe := A_LoopFileName
                }
                if IsSet(checkAdobe)
                    ADOBE := checkAdobe
                DirDelete(A_MyDocuments "\tomshi\adobe", 1)
            }
        if DirExist(A_MyDocuments "\tomshi\location")
            {
                try {
                    WORK := FileRead(A_MyDocuments "\tomshi\location\workingDir")
                }
                if WORK != ""
                    {
                        UPDATE := IniRead(WORK "\Support Files\ignore.ini", "ignore", "ignore", "true")
                        if UPDATE = "no"
                            UPDATE := "true"
                        else UPDATE := "false"
                        if FileExist(WORK "\Support Files\ignore.ini")
                            FileDelete(WORK "\Support Files\ignore.ini")
                    }
                DirDelete(A_MyDocuments "\tomshi\location", 1)
            }
        if FileExist(A_MyDocuments "\tomshi\autosave.ini")
            {
                TOOL := IniRead(A_MyDocuments "\tomshi\autosave.ini", "tooltip", "tooltip", "true")
                FileDelete(A_MyDocuments "\tomshi\autosave.ini")
            }
        if FileExist(A_MyDocuments "\tomshi\first")
            {
                FC := "true"
                FileDelete(A_MyDocuments "\tomshi\first")
            }
    }
    if !DirExist(A_MyDocuments "\tomshi")
        DirCreate(A_MyDocuments "\tomshi")
    if FileExist(A_MyDocuments "\tomshi\settings.ini")
        {
            ver := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "version")
            if !VerCompare(MyRelease, ver) > 0 ;do note if you're pulling commits from the `dev` branch of this repo and I add something to the `settings.ini` file & you pull the commit before a new release, this function will not generate a new file for you and you may encounter errors. You can get around this by manually lowering the "version" number in the `settings.ini` file and then running `My Scripts.ahk`
                return

            ;WARNING THE USER OF SETTINGS CHANGES
            if VerCompare(MyRelease, "v2.5.1") > 0 && VerCompare(MyRelease, "v2.5.2") <= 0 ; v2.5.2 brought changes to settings.ini and will reset some values to default
                toolCust("This version (" MyRelease ") may reset some settings back to default`nas there were changes to ``settings.ini``", "3000")
        }
    UPDATE := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check", "true")
    BETAUPDATE := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check", "false")
    FC := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "first check", "false")
    ADOBE := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "adobe temp", "")
    WORK := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir", "E:\Github\ahk")
    TOOL := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "tooltip", "true")
    ADOBE_GB := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe GB", 45)
    ADOBE_FS := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe FS", 5)
    AUTOMIN := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "autosave MIN", 5)
    deleteOld(&ADOBE, &WORK, &UPDATE, &FC, &TOOL) ;deletes any of the old files I used to track information
    if FileExist(A_MyDocuments "\tomshi\settings.ini")
        FileDelete(A_MyDocuments "\tomshi\settings.ini") ;if the user is on a newer release version, we automatically replace the settings file with their previous information/any new information defaults
    FileAppend("[Settings]`nupdate check=" UPDATE "`nbeta update check=" BETAUPDATE "`ntooltip=" TOOL "`n`n[Adjust]`nadobe GB=" ADOBE_GB "`nadobe FS=" ADOBE_FS "`nautosave MIN=" AUTOMIN "`n`n[Track]`nadobe temp=" ADOBE "`nworking dir=" WORK "`nfirst check=" FC "`nversion=" MyRelease, A_MyDocuments "\tomshi\settings.ini")
}
 
/* updateChecker()
 This function will (on first startup, NOT a refresh of the script) check which version of the script you're running, cross reference that with the main branch of the github and alert the user if there is a newer release available with a prompt to download as well as showing a changelog. This script will also perform a backup of the users current instance of the "ahk" folder this script resides in and will place it in the `\Backups` folder.
 */
updateChecker(MyRelease) {
    ;checks if script was reloaded
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    main:
    ;release version
    ;Get the current release version from github
    getRelease(beta := false)
    {
        try {
            main := ComObject("WinHttp.WinHttpRequest.5.1")
            main.Open("GET", "https://github.com/Tomshiii/ahk/releases.atom")
            main.Send()
            main.WaitForResponse()
            string := main.ResponseText
        }  catch as e {
            toolCust("Couldn't get version info`nYou may not be connected to the internet")
            errorLog(A_ThisFunc "()", "Couldn't get version info, you may not be connected to the internet", A_LineFile, A_LineNumber)
            Exit()
        }
        loop {
            getrightURL := InStr(string, 'href="https://github.com/Tomshiii/ahk/releases/tag/', 1, 1, A_Index)
            foundpos := InStr(string, 'v2', 1, getrightURL, 1)
            endpos := InStr(string, '"', , foundpos, 1)
            ver := SubStr(string, foundpos, endpos - foundpos)
            if !InStr(ver, "pre") && !InStr(ver, "beta")
                break
            else if beta = true
                break
        }
        return ver
    }
    betaprep := 0
    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check", "false") = "true"
        {
            global version := getRelease(true)
            betaprep := 1
        }
    else
        global version := getRelease()
    if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
        WinWaitClose("ahk_class tooltips_class32")
    toolCust("Current ``" A_ScriptName "`` Version = " MyRelease "`nCurrent Github Release = " version, 2000)
    ;checking to see if the user wishes to check for updates
    check := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
    if check = "true"
        {
            if VerCompare(MyRelease, version) < 0
                {
                    ;grabbing changelog info
                    try {
                        change := ComObject("WinHttp.WinHttpRequest.5.1")
                        if betaprep = 0
                            change.Open("GET", "https://raw.githubusercontent.com/Tomshiii/ahk/main/changelog.md")
                        else if betaprep = 1
                            change.Open("GET", "https://raw.githubusercontent.com/Tomshiii/ahk/dev/changelog.md")
                        change.Send()
                        change.WaitForResponse()
                        ChangeLog := change.ResponseText
                    } catch as e {
                        toolCust("Couldn't get changelog info`nYou may not be connected to the internet")
                        errorLog(A_ThisFunc "()", "Couldn't get changelog info, you may not be connected to the internet", A_LineFile, A_LineNumber)
                        return
                    }
                    ;\\removing the warning about linking to commits
                    beginwarn := InStr(ChangeLog, "###### **_",,, 1)
                    endwarnfind := InStr(ChangeLog, "_**",,, 1)
                    endend := endwarnfind + 5
                    warnlength := endend - beginwarn
                    removewarn := SubStr(ChangeLog, beginwarn, warnlength)
                    warn := StrReplace(ChangeLog, removewarn, "", 1,, 1)
                    ;\\
                    ;\\deleting all [] surrounding links
                    deletesquare1 := StrReplace(warn, "]", "")
                    deletesquare2 := StrReplace(deletesquare1, "[", "")
                    ;\\
                    ;dealing with directories we'll need
                    if not DirExist(A_Temp "\tomshi")
                        DirCreate(A_Temp "\tomshi")
                    if FileExist(A_Temp "\tomshi\changelog.ini")
                        FileDelete(A_Temp "\tomshi\changelog.ini")
                    if FileExist(A_Temp "\tomshi\changelog.txt")
                        FileDelete(A_Temp "\tomshi\changelog.txt")
                    ;create baseline changelog
                    FileAppend(deletesquare2, A_Temp "\tomshi\changelog.txt")
                    ;keys counts how many links are found
                    keys := 0
                    loop { ;this loop will go through and copy all urls to an ini file
                        findurl := InStr(deletesquare2, "https://",,, A_Index)
                        if findurl = 0
                            break
                        beginurl := findurl - 1
                        findendurl := InStr(deletesquare2, ")",, findurl, 1)
                        findendend := findendurl + 1
                        urllength := findendend - beginurl
                        removeulr := SubStr(deletesquare2, beginurl, urllength)
                        valueurl := IniWrite(removeulr, A_Temp "\tomshi\changelog.ini", "urls", A_Index)
                        keys += 1
                    }
                    loop keys { ;this loop will go through and remove all url's from the changelog
                        read := FileRead(A_Temp "\tomshi\changelog.txt")
                        refurl := IniRead(A_Temp "\tomshi\changelog.ini", "urls", A_Index)
                        attempt := StrReplace(read, refurl, "")
                        if FileExist(A_Temp "\tomshi\changelog.txt")
                            FileDelete(A_Temp "\tomshi\changelog.txt")
                        FileAppend(attempt, A_Temp "\tomshi\changelog.txt")
                        finalchange := FileRead(A_Temp "\tomshi\changelog.txt")
                    }
                    if IsSet(finalchange) ;if there are no links and finalchange hasn't recieved a value, it will fall back to the original response from the changelog on github
                        LatestChangeLog := finalchange
                    else
                        LatestChangeLog := change.ResponseText
                    ;we now delete those temp files
                    if FileExist(A_Temp "\tomshi\changelog.ini")
                        FileDelete(A_Temp "\tomshi\changelog.ini")
                    if FileExist(A_Temp "\tomshi\changelog.txt")
                        FileDelete(A_Temp "\tomshi\changelog.txt")
                    ;create gui
                    MyGui := Gui("", "Scripts Release " version)
                    MyGui.SetFont("S11")
                    MyGui.Opt("+Resize +MinSize600x400 +MaxSize600x400")
                    ;set title
                    Title := MyGui.Add("Text", "H40 W500", "New Scripts - Release " version)
                    Title.SetFont("S15")
                    ;set github button
                    gitButton := MyGui.Add("Button", "X+20 Y10", "GitHub")
                    gitButton.OnEvent("Click", githubButton)
                    ;set changelog
                    ChangeLog := MyGui.Add("Edit", "X8 Y+5 r18 -WantCtrlA ReadOnly w590")
                    ;set "don't prompt again" checkbox
                    noprompt := MyGui.Add("Checkbox", "X270 Y350", "Don't prompt again")
                    noprompt.OnEvent("Click", prompt)
                    ;set beta checkbox
                    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check", "false") = "true"
                        betaCheck := MyGui.Add("Checkbox", "Checked1 Y+5", "Check for Beta Updates")
                    else
                        betaCheck := MyGui.Add("Checkbox", "Checked0 Y+5", "Check for Beta Updates")
                    betaCheck.OnEvent("Click", beta)
                    ;set download button
                    downloadbutt := MyGui.Add("Button", "X+5 Y+-30", "Download")
                    downloadbutt.OnEvent("Click", Down)
                    ;set cancel button
                    cancelbutt := MyGui.Add("Button", "Default X+5", "Cancel")
                    cancelbutt.OnEvent("Click", closegui)
                    ;getting value for changelog
                    ChangeLog.Value := LatestChangeLog

                    MyGui.Show()
                    prompt(*) {
                        if noprompt.Value = 1
                            IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                        if noprompt.Value = 0
                            IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                    }
                    beta(*) {
                        if betaCheck.Value = 1
                            IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check")
                        if betaCheck.Value = 0
                            IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check")
                        Run(A_ScriptFullPath)
                    }
                    githubButton(*) {
                        if WinExist("Tomshiii/ahk")
                            {
                                WinActivate("Tomshiii/ahk")
                                return
                            }
                        Run("https://github.com/tomshiii/ahk/releases/latest")
                    }
                    down(*) {
                        MyGui.Opt("Disabled")
                        yousure := MsgBox("If you have modified your scripts, overidding them with this download will result in a loss of data.`nA backup will be performed after downloading and placed in the \Backups folder but it is recommended you do one for yourself as well.`n`nPress Cancel to abort this automatic backup.", "Backup your scripts!", "1 48")
                        if yousure = "Cancel"
                            {
                                MyGui.Opt("-Disabled")
                                return
                            }
                        MyGui.Destroy()
                        downloadLocation := FileSelect("D", , "Where do you wish to download Release " version)
                        if downloadLocation = ""
                            return
                        else
                            {
                                ;ToolTip("Updated scripts are downloading")
                                TrayTip("Updated scripts are downloading", "Downloading...", 17)
                                SetTimer(HideTrayTip, -5000)
                                HideTrayTip() {
                                    TrayTip
                                }
                                type := ""
                                exeOrzip(filetype, &found)
                                {
                                    whr := ComObject("WinHttp.WinHttpRequest.5.1")
                                    whr.Open("GET", "https://github.com/Tomshiii/ahk/releases/download/" version "/" version "." filetype, true)
                                    whr.Send()
                                    ; Using 'true' above and the call below allows the script to remain responsive.
                                    whr.WaitForResponse()
                                    found := whr.ResponseText
                                }
                                exeOrzip("exe", &found)
                                if found = "Not found"
                                    {
                                        exeOrzip("zip", &found)
                                        if found = "Not found"
                                            {
                                                ToolTip("")
                                                MsgBox("Couldn't find the latest release to download")
                                                return
                                            }
                                        else
                                            type := "zip"
                                    }
                                else
                                    type := "exe"
                                Download("https://github.com/Tomshiii/ahk/releases/download/" version "/" version "." type, downloadLocation "\" version "." type)
                                toolCust("Release " version " of the scripts has been downloaded to " downloadLocation, 3000)
                                run(downloadLocation)
                                TrayTip("Your current scripts are being backed up!", "Backig Up...", 17)
                                SetTimer(HideTrayTip, -5000)
                                if DirExist(A_Temp "\" MyRelease)
                                    DirDelete(A_Temp "\" MyRelease, 1)
                                if DirExist(A_WorkingDir "\Backups\Script Backups\" MyRelease)
                                    {
                                        newbackup := MsgBox("You already have a backup of Release " MyRelease "`nDo you wish to override it and make a new backup?", "Error! Backup already exists", "4 32 4096")
                                        if newbackup = "Yes"
                                            DirDelete(A_WorkingDir "\Backups\Script Backups\" MyRelease, 1)
                                        else
                                            {
                                                ToolTip("")
                                                return
                                            }
                                    }
                                try {
                                    DirCopy(A_WorkingDir, A_Temp "\" MyRelease)
                                    DirMove(A_Temp "\" MyRelease, A_WorkingDir "\Backups\Script Backups\" MyRelease, "1")
                                    if DirExist(A_Temp "\" MyRelease)
                                        DirDelete(A_Temp "\" MyRelease, 1)
                                    toolCust("Your current scripts have successfully backed up to the '\Backups\Script Backups\" MyRelease "' folder", 3000)
                                } catch as e {
                                    toolCust("There was an error trying to backup your current scripts", 2000)
                                    errorLog(A_ThisFunc "()", "There was an error trying to backup your current scripts", A_LineFile, A_LineNumber)
                                }
                                return
                            }
                    }
                    closegui(*) {
                        MyGui.Destroy()
                        return
                    }
                }
            else
                return
        }
    else if check = "false"
        {
            if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
                WinWaitClose("ahk_class tooltips_class32")
            if VerCompare(MyRelease, version) < 0
                {
                    toolCust("You're using an outdated version of these scripts")
                    errorLog(A_ThisFunc "()", "You're using an outdated version of these scripts", A_LineFile, A_LineNumber)
                    return
                }
            else
                {
                    toolCust("This script will not prompt you with a download/changelog when a new version is available", 2000)
                    errorLog(A_ThisFunc "()", "This script will not prompt you when a new version is available", A_LineFile, A_LineNumber)
                    return
                }
        }
    else if check = "stop"
        return
    else
        {
            toolCust("You put something else in the settings.ini file you goose")
            errorLog(A_ThisFunc "()", "You put something else in the settings.ini file you goose", A_LineFile, A_LineNumber)
            return
        }
}
 
/* firstCheck()
 This function checks to see if it is the first time the user is running this script. If so, they are then given some general information regarding the script as well as a prompt to check out some useful hotkeys.
 */
firstCheck(MyRelease) {
    ;The variable names in this function are an absolute mess. I'm not going to pretend like they make any sense AT ALL. But it works so uh yeah.
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    if not IsSet(version) ;if the user has no internet, "version" will not have been assigned a value in `updateChecker()` - this checks to see if `version` has been assigned a value
        version := ""
    if WinExist("Scripts Release " version)
        WinWaitClose("Scripts Release " version)
    check := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "first check")
    if check != "false" ;how the function tracks whether this is the first time the user is running the script or not
        return
    else
        {
            firstCheckGUI := Gui("", "Scripts Release " MyRelease)
            firstCheckGUI.SetFont("S11")
            firstCheckGUI.Opt("-Resize AlwaysOnTop")
            ;set title
            Title := firstCheckGUI.Add("Text", "H40 X8 W550", "Welcome to Tomshi's AHK Scripts : Release " MyRelease)
            Title.SetFont("S15")
            ;text
            bodyText := firstCheckGUI.Add("Text", "W550 X8", "
            (
                Congratulations!
                You've gotten my main script to load without any runtime errors! (hopefully).
                You've taken the first step to really getting the most out of these scripts!

                This script alone isn't everything my repo of scripts has to offer, heading into ``Handy Hotkeys`` below and finding the hotkey for the current active scripts will show you some of the other scripts available to you!
                Beyond those scripts there is also everything in the ``
            )" A_WorkingDir "
            ( 
                \Streamdeck AHK\`` directory that provides even more functionality.

                The purpose of these scripts is to speed up both editing (mostly within the Adobe suite of programs) and random interactions with a computer. Listing off everything these scripts are capable of would take more screen real estate than you likely have and so all I can do is point you towards the comments for individual hotkeys/functions in the hopes that they explain everything for me.
                These scripts are heavily catered to my pc/setup and as a result may run into issues on other systems (for example I have no idea how they will perform on lower end systems). Feel free to create an issue on the github for any massive problems or even consider tweaking the code to be more universal and try a pull request. I make no guarantees I will merge any PR's as these scripts are still for my own setup at the end of the day but I do actively try to make my code as flexible as possible to accommodate as many outliers as I can.

                The below ``Handy Hotkeys`` outlines some hotkeys that are available to use anywhere within windows and are a great place to get started when trying to navigate the power of these scripts! (note: they still only scratch the surface, a large chunk of my scripts are specific to programs and will only activate if said program is the current active window)

                The below ``Settings`` GUI can be accessed at anytime by right clicking ``My Scripts.ahk`` on the taskbar or by pressing ``#F1`` (by default).
            )")
            ;buttons
            settingsButton := firstCheckGUI.Add("Button", "X200 Y+8", "Settings")
            settingsButton.OnEvent("Click", settings)
            todoButton := firstCheckGUI.Add("Button", "X+10", "What to Do")
            todoButton.OnEvent("Click", todoPage)
            hotkeysButton := firstCheckGUI.Add("Button", "X+10", "Handy Hotkeys")
            hotkeysButton.OnEvent("Click", hotkeysPage)
            closeButton := firstCheckGUI.Add("Button", "X+10", "Close")
            closeButton.OnEvent("Click", close)

            firstCheckGUI.OnEvent("Escape", close)
            firstCheckGUI.OnEvent("Close", close)
            close(*) {
                IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Track", "first check") ;tracks the fact the first time screen has been closed. These scripts will now not prompt the user again
                firstCheckGUI.Destroy()
            }
            todoPage(*) {
                todoGUI()
            }
            hotkeysPage(*) {
                hotkeysGUI()
            }
            settings(*) {
                firstCheckGUI.Opt("Disabled")
                WinSetAlwaysOnTop(0, "Scripts Release " MyRelease)
                settingsGUI()
                WinWait("Settings " MyRelease)
                WinActivate("Settings " MyRelease)
                WinWaitClose("Settings " MyRelease)
                firstCheckGUI.Opt("-Disabled")
            }
            firstCheckGUI.Show("AutoSize")
        }
}
 
/*
 This function will (on first startup, NOT a refresh of the script) delete any `\ErrorLog` files older than 30 days
 */
oldError() {
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    loop files, A_WorkingDir "\Error Logs\*.txt"
    if DateDiff(A_LoopFileTimeCreated, A_now, "Days") < -30
        FileDelete(A_LoopFileFullPath)
}
 
/*
 This function will (on first startup, NOT a refresh of the script) delete any Adobe temp files when they're bigger than the specified amount (in GB). Adobe's "max" limits that you set within their programs is stupid and rarely chooses to work, this function acts as a sanity check. It should be noted I have created a custom location for `After Effects'` temp files to go to so that they're in the same folder as `Premiere's` just to keep things in one place. You will either have to change this folder tree to the actual default or set it to a similar place
 */
adobeTemp(MyRelease) {
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
        WinWaitClose("ahk_class tooltips_class32")
    if WinExist("Scripts Release " MyRelease) ;checks to make sure firstCheck() isn't still running
        WinWaitClose("Scripts Release " MyRelease)
    day := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "adobe temp")
    if day = A_YDay ;checks to see if the function has already run today
        return

    ;SET HOW BIG YOU WANT IT TO WAIT FOR IN THE `settings.ini` FILE (IN GB) -- IT WILL DEFAULT TO 45GB
    largestSize := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe GB", 45)

    ;first we set our counts to 0
    CacheSize := 0
    ;then we define some filepaths, MediaCahce & PeakFiles are Adobe defaults, AEFiles has to be set within after effects' cache settings
    MediaCache := A_AppData "\Adobe\Common\Media Cache Files"
    PeakFiles := A_AppData "\Adobe\Common\Peak Files"
    AEFiles := A_AppData "\Adobe\Common\AE"
    ;AGAIN ~~ for the above AE folder to exist you have to set it WITHIN THE AE CACHE SETTINGS, it IS NOT THE DEFAULT

    ;now we check the listed directories and add up the size of all the files
    Loop Files, MediaCache "\*.*", "R"
        {
            cacheround := Round(CacheSize / 1073741824, 2)
            ToolTip(A_LoopFileShortName " - " cacheround "/" largestSize "GB")
            CacheSize += A_LoopFileSize
        }
    loop files, PeakFiles "\*.*", "R"
        {
            cacheround := Round(CacheSize / 1073741824, 2)
            ToolTip(A_LoopFileShortName " - " cacheround "/" largestSize "GB")
            CacheSize += A_LoopFileSize
        }
    loop files, AEFiles "\*.*", "R"
        {
            cacheround := Round(CacheSize / 1073741824, 2)
            ToolTip(A_LoopFileShortName " - " cacheround "/" largestSize "GB")
            CacheSize += A_LoopFileSize
        }
    if CacheSize > 0
        toolCust("Total Adobe cache size - " cacheround "/" largestSize "GB", 1500)
    else
        {
            toolCust("Total Adobe cache size - " CacheSize "/" largestSize "GB", 1500)
            goto end
        }
    ;then we convert that byte total to GB
    convert := CacheSize/"1073741824"
    ;now if the total is bigger than the set number, we loop those directories and delete all the files
    if convert >= largestSize
        {
            ToolTip(A_ThisFunc " is currently deleting temp files")
            try {
                loop files, MediaCache "\*.*", "R"
                    FileDelete(A_LoopFileFullPath)
            }
            try {
                loop files, PeakFiles "\*.*", "R"
                    FileDelete(A_LoopFileFullPath)
            }
            try {
                loop files, AEFiles "\*.*", "R"
                    FileDelete(A_LoopFileFullPath)
            }
            ToolTip("")
        }
    end:
    IniWrite(A_YDay, A_MyDocuments "\tomshi\settings.ini", "Track", "adobe temp") ;tracks the day so it will not run again today
}
 
/*
 This function checks the users local version of AHK and ensures it is greater than v2.0-beta5. If the user is running a version earlier than that, a prompt will pop up offering the user a convenient download
 */
verCheck()
{
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
        WinWaitClose("ahk_class tooltips_class32")
    if VerCompare(A_AhkVersion, "2.0-beta.5") < 0
        {
            getLatestVer()
            {
                    try {
                        latest := ComObject("WinHttp.WinHttpRequest.5.1")
                        latest.Open("GET", "https://lexikos.github.io/v2/docs/AutoHotkey.htm")
                        latest.Send()
                        latest.WaitForResponse()
                        Latestpage := latest.ResponseText

                        startVer := InStr(Latestpage, "<!--ver-->", 1,, 1)
                        endVer := InStr(Latestpage, "<!--/ver-->", 1,, 1)
                        LatestVersion := SubStr(Latestpage, startVer + 10, endVer - startVer - 10)
                        return LatestVersion
                    } catch as e {
                        toolCust("Couldn't get the latest version of ahk`nYou may not be connected to the internet")
                        errorLog(A_ThisFunc "()", "Couldn't get latest version of ahk, you may not be connected to the internet", A_LineFile, A_LineNumber)
                        return
                    }
                }
            if getLatestVer() != ""
                LatestVersion := getLatestVer()
            else
                return
            verError := MsgBox("Tomshi's scripts are designed to work on AHK v2.0-beta5 and above. Attempting to run these scripts on versions of AHK below that may result in unexpexted issues.`n`nYour current version is v" A_AhkVersion "`nThe latest version of AHK is v" LatestVersion "`n`nDo you wish to download a newer version of AHK?",, "4 16 4096")
            if verError = "Yes"
                {
                    downloadLoc := FileSelect("D", , "Where do you wish to download the latest version of AHK?")
                    if downloadLoc = ""
                        return
                    ToolTip("AHK v" LatestVersion " is downloading")
                    Download("https://www.autohotkey.com/download/ahk-v2.zip", downloadLoc "\ahk_v" LatestVersion ".zip")
                    ToolTip("")
                }
            if verError = "No"
                return
        }
}
 
/*
 Within my scripts I have a few hard coded references to the directory location I have these scripts. That however would be useless to another user who places them in another location.
 To combat this scenario, this function on script startup will check the working directory and change all instances of MY hard coded dir to the users current working directory.
 This script will take note of the users A_WorkingDir and store it in `A_MyDocuments \tomshi\location` and will check it every launch to ensure location variables are always updated and accurate
 */
locationReplace()
{
    if DllCall("GetCommandLine", "str") ~= "i) /r(estart)?(?!\S)" ;this makes it so this function doesn't run on a refresh of the script, only on first startup
        return
    if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
        WinWaitClose("ahk_class tooltips_class32")
    checkDir := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
    if checkDir = A_WorkingDir
        return

    funcTray := "'" A_ThisFunc "()" "'" A_Space
    found := "false"
    tomshiOrUser := "t"
    loop files, A_WorkingDir "\*.ahk", "R"
        {
            if A_LoopFileName = "switchTo.ahk" || A_LoopFileName = "General.ahk"
                continue
            read := FileRead(A_LoopFileFullPath)
            if InStr(read, "E:\Github\ahk", 1)
                {
                    found := "true"
                    break
                }
        }
    if found = "false"
        {
            loop files, A_WorkingDir "\*.ahk", "R"
                {
                    if A_LoopFileName = "switchTo.ahk" || A_LoopFileName = "General.ahk"
                        continue
                    read := FileRead(A_LoopFileFullPath)
                    if InStr(read, checkDir, 1)
                        {
                            found := "true"
                            tomshiOrUser := "u"
                            break
                        }
                }
        }
    if found = "false"
        return
    TrayTip(funcTray "is attempting to replace references to installation directory with user installation directory:`n" A_WorkingDir,, 17)
    SetTimer(end, -2000)
    if tomshiOrUser = "t"
        dir := "E:\Github\ahk"
    else if tomshiOrUser = "u"
        dir := checkDir
    loop files, A_WorkingDir "\*.ahk", "R"
        {
            if A_LoopFileName = "switchTo.ahk" || A_LoopFileName = "General.ahk"
                continue
            read := FileRead(A_LoopFileFullPath)
            if InStr(read, dir, 1)
                {
                    read2 := StrReplace(read, dir, A_WorkingDir)
                    FileDelete(A_LoopFileFullPath)
                    FileAppend(read2, A_LoopFileFullPath)
                }
        }
    end() {
        TrayTip(funcTray "has finished attempting to replace references to the installation directory.`nDouble check " "'" "location :=" "'" " variables to sanity check",, 1)
    }
    IniWrite(A_WorkingDir, A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
}
 
/*
 This function will add right click tray menu items to "My Scripts.ahk" to toggle checking for updates as well as accessing a GUI to modify script settings
 */
trayMen()
{
    check := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
    A_TrayMenu.Add() ;adds a divider bar
    A_TrayMenu.Add("Settings", settings)
    A_TrayMenu.Add("Check for Updates", checkUp)
    if check =  "true"
        A_TrayMenu.Check("Check for Updates")
    else
        A_TrayMenu.Uncheck("Check for Updates")
    checkUp(*)
    {
        check := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check") ;has to be checked everytime you wish to toggle
        if check = "true"
            {
                IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                A_TrayMenu.Uncheck("Check for Updates")
            }
        else
            {
                IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                A_TrayMenu.Check("Check for Updates")
            }
    }
    settings(*)
    {
        settingsGUI()
    }
}

/*
A GUI window to allow the user to toggle settings contained within the `settings.ini` file
*/
settingsGUI()
{
    ;this function is needed to reload some scripts
    detect()
    {
        DetectHiddenWindows True
        SetTitleMatchMode 2
    }

    version := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "version")
    if WinExist("Settings " version)
        return
    settingsGUI := Gui("+Resize +MinSize250x AlwaysOnTop", "Settings " version)
    SetTimer(resize, -10)
    resize()
    {
        settingsGUI.Opt("-Resize")
    }
    settingsGUI.SetFont("S11")

    noDefault := settingsGUI.Add("Button", "Default W0 H0", "_")

    ;Top Titles
    titleText := settingsGUI.Add("Text", "W100 H25 X9 Y7", "Settings")
    titleText.SetFont("S15 Bold Underline")

    toggleText := settingsGUI.Add("Text", "W100 H20 Y+5", "Toggle")
    toggleText.SetFont("S13 Bold")

    adjustText := settingsGUI.Add("Text", "W100 H20 X+100", "Adjust")
    adjustText.SetFont("S13 Bold")
    
    ;CHECKBOXES
    checkVal := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check", "true")
    if checkVal = "true"
        {
            updateCheckToggle := settingsGUI.Add("Checkbox", "Check3 Checked1 section xs Y+5", "Check for Updates")
            updateCheckToggle.ToolTip := "Scripts will check for updates"
        }
    else if checkVal = "false"
        {
            updateCheckToggle := settingsGUI.Add("Checkbox", "Check3 Checked-1 section xs Y+5", "Check for Updates")
            updateCheckToggle.ToolTip := "Scripts will still check for updates but will not present the user`nwith a GUI when an update is available"
        }
    else if checkVal = "stop"
        {
            updateCheckToggle := settingsGUI.Add("Checkbox", "Check3 Checked0 section xs Y+5", "Check for Updates")
            updateCheckToggle.ToolTip := "Scripts will NOT check for updates"
        }
    updateCheckToggle.OnEvent("Click", update)
    update(*)
    {
        ToolTip("")
        betaCheck := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check") ;storing the beta check value so we can toggle it back on if it was on originally
        updateVal := updateCheckToggle.Value
        if updateVal = 1
            {
                IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                toolCust("Scripts will check for updates", 2000)
                if betaCheck = "true"
                    betaupdateCheckToggle.Value := 1
            }
        else if updateVal = -1
            {
                IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                toolCust("Scripts will still check for updates but will not present the user`nwith a GUI when an update is available", 2000)
                if betaCheck = "true"
                    betaupdateCheckToggle.Value := 1
            }
        else if updateVal = 0
            {
                betaupdateCheckToggle.Value := 0
                IniWrite("stop", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
                toolCust("Scripts will NOT check for updates", 2000)
            }
    }
    
    betaStart := false ;if the user enables the check for beta updates, we want my main script to reload on exit.
    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check") = "true" && updateCheckToggle.Value != 0
        betaupdateCheckToggle := settingsGUI.Add("Checkbox", "Checked1 section xs Y+5", "Check for Beta Updates")
    else
        betaupdateCheckToggle := settingsGUI.Add("Checkbox", "Checked0 section xs Y+5", "Check for Beta Updates")
    betaupdateCheckToggle.OnEvent("Click", betaupdate)
    betaupdate(*)
    {
        updateVal := betaupdateCheckToggle.Value
        if updateVal = 1 && updateCheckToggle.Value != 0
            {
                betaStart := true
                IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check")
            }

        else
            {
                betaupdateCheckToggle.Value := 0
                betaStart := false
                IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "beta update check")
            }
    }

    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "tooltip") = "true"
        toggleToggle := settingsGUI.Add("Checkbox", "Checked1 Y+5", "``autosave.ahk`` tooltips")
    else
        toggleToggle := settingsGUI.Add("Checkbox", "Checked0 Y+5", "``autosave.ahk`` tooltips")
    toggleToggle.OnEvent("Click", toggle)
    toggle(*)
    {
        detect()
        toggleVal := toggleToggle.Value
        if toggleVal = 1
            IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "tooltip")
        else
            IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "tooltip")

        if WinExist("autosave.ahk - AutoHotkey")
            PostMessage 0x0111, 65303,,, "autosave.ahk - AutoHotkey"
    }

    ;EDIT BOXES
    adobeGBinitVal := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe GB")
    adobeGBEdit := settingsGUI.Add("Edit", "Section xs+193 ys r1 W50", "")
    settingsGUI.Add("UpDown",, adobeGBinitVal)
    adobeEditText := settingsGUI.Add("Text", "X+5 Y+-20", "``adobeTemp()`` limit (GB)")
    adobeGBEdit.OnEvent("Change", adobeGB)
    adobeGB(*)
    {
        IniWrite(adobeGBEdit.Value, A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe GB")
    }
    
    adobeFSinitVal := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe FS")
    adobeFSEdit := settingsGUI.Add("Edit", "xs Y+10 r1 W50", "")
    settingsGUI.Add("UpDown",, adobeFSinitVal)
    adobeFSEditText := settingsGUI.Add("Text", "X+5 Y+-20", "``adobe fullscreen check.ahk`` check rate (s)")
    adobeFSEdit.OnEvent("Change", adobeFS)
    adobeFS(*)
    {
        detect()
        IniWrite(adobeFSEdit.Value, A_MyDocuments "\tomshi\settings.ini", "Adjust", "adobe FS")
        if WinExist("adobe fullscreen check.ahk - AutoHotkey")
            PostMessage 0x0111, 65303,,, "adobe fullscreen check.ahk - AutoHotkey"
    }
    
    autosaveMininitVal := IniRead(A_MyDocuments "\tomshi\settings.ini", "Adjust", "autosave MIN")
    autosaveMinEdit := settingsGUI.Add("Edit", "xs Y+10 r1 W50", "")
    settingsGUI.Add("UpDown",, autosaveMininitVal)
    autosaveMinEditText := settingsGUI.Add("Text", "X+5 Y+-20", "``autosave.ahk`` save rate (min)")
    autosaveMinEdit.OnEvent("Change", autosaveMin)
    autosaveMin(*)
    {
        detect()
        IniWrite(autosaveMinEdit.Value, A_MyDocuments "\tomshi\settings.ini", "Adjust", "autosave MIN")
        if WinExist("autosave.ahk - AutoHotkey")
            PostMessage 0x0111, 65303,,, "autosave.ahk - AutoHotkey"
    }

    ;BOTTOM TEXT
    resetText := settingsGUI.Add("Text", "Section W100 H20 X9 Y+20", "Reset")
    resetText.SetFont("S13 Bold")

    ;BUTTON TOGGLES
    adobeToggle := settingsGUI.Add("Button", "w100 h30 Y+5", "adobeTemp()")
    adobeUndo := settingsGUI.Add("Button", "w0 h0", "undo?")
    adobeToggle.OnEvent("Click", adobe)
    adobeUndo.OnEvent("Click", adobe)
    adobe(*)
    {
        check := adobeToggle.GetPos(,, &width)
        if width != 0
            {
                togglePos := adobeToggle.GetPos(&toggleX, &toggleY)
                adobeToggle.Move(,, 0, 0)
                adobeUndo.Move(, toggleY, 100, 30)
            }
        else
            {
                togglePos := adobeUndo.GetPos(&undoX, &undoY)
                adobeUndo.Move(,, 0, 0)
                adobeToggle.Move(, undoY, 100, 30)		
            }
    }
    
    firstToggle := settingsGUI.Add("Button", "w100 h30 Y+-38 X+117", "firstCheck()")
    firstUndo := settingsGUI.Add("Button", "w0 h0", "undo?")
    firstToggle.OnEvent("Click", first)
    firstUndo.OnEvent("Click", first)
    first(*)
    {
        check := firstToggle.GetPos(,, &width)
        if width != 0
            {
                togglePos := firstToggle.GetPos(&toggleX, &toggleY)
                firstToggle.Move(,, 0, 0)
                firstUndo.Move(, toggleY, 100, 30)
            }
        else
            {
                togglePos := firstUndo.GetPos(&undoX, &undoY)
                firstUndo.Move(,, 0, 0)
                firstToggle.Move(, undoY, 100, 30)		
            }
    }

    saveAndClose := settingsGUI.Add("Button", "W85 H30 xs Y+15", "Save && Exit")
    saveAndClose.OnEvent("Click", close)

    workDir := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
    workDirText := settingsGUI.Add("Text", "Center X+15 Y+-30", "Current working dir;`n" workDir)
    workDirText.SetFont("S10")


    settingsGUI.OnEvent("Escape", close)
    settingsGUI.OnEvent("Close", close)
    close(*)
    {
        ;check 
        if betaStart = true 
            Run(A_ScriptFullPath)
        ;check to see if the user wants to reset adobeTemp()
        checkAdobe := adobeToggle.GetPos(,, &width)
        if width = 0
            IniWrite("", A_MyDocuments "\tomshi\settings.ini", "Track", "adobe temp")
        ;check to see if the user wants to reset firstCheck()
        checkFirst := firstToggle.GetPos(,, &width)
        if width = 0
            IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Track", "first check")
        ;a check incase this settings gui was launched from firstCheck()
        if WinExist("Scripts Release " version)
            WinSetAlwaysOnTop(1, "Scripts Release " version)
        ;before finally closing
        settingsGUI.Destroy()
    }

    ;the below code allows for the tooltips on hover
    ;code can be found on the ahk website : https://lexikos.github.io/v2/docs/objects/Gui.htm#ExToolTip
    OnMessage(0x0200, On_WM_MOUSEMOVE)
    On_WM_MOUSEMOVE(wParam, lParam, msg, Hwnd)
    {
        static PrevHwnd := 0
        if (Hwnd != PrevHwnd)
        {
            Text := "", ToolTip() ; Turn off any previous tooltip.
            CurrControl := GuiCtrlFromHwnd(Hwnd)
            if CurrControl
            {
                if !CurrControl.HasProp("ToolTip")
                    return ; No tooltip for this control.
                Text := CurrControl.ToolTip
                SetTimer () => ToolTip(Text), -1000
                SetTimer () => ToolTip(), -4000 ; Remove the tooltip.
            }
            PrevHwnd := Hwnd
        }
    }

    settingsGUI.Show("Center AutoSize")
}
 
 