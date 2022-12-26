; { \\ #Includes
#Include <GUIs\tomshiBasic>
#Include <GUIs\gameCheckGUI>
#Include <GUIs\settingsGUI\editValues>
#Include <Classes\dark>
#Include <Classes\tool>
#Include <Classes\ptf>
#Include <Functions\SplitPathObj>
#Include <Functions\On_WM_MOUSEMOVE>
#Include <Functions\reload_reset_exit>
#Include <Functions\refreshWin>
#Include <Functions\detect>
#Include <Functions\checkInternet>
#Include <Functions\trueOrfalse>
; }

/**
 * A GUI window to allow the user to toggle settings contained within the `settings.ini` file
 */
settingsGUI()
{
    ;this function is needed to reload some scripts
    detect()

    ;// menubar
    FileMenu := Menu()
    FileMenu.Add("&Add Game to ``gameCheck.ahk```tCtrl+A", menu_AddGame)
    openMenu := Menu()
    openMenu.Add("&settings.ini`tCtrl+S", menu_Openini)
    openMenu.Add("&Wiki", (*) => MsgBox("Not implemented"))
    openMenu.Disable("&Wiki")
    openMenu.Add("&Wiki Dir`tCtrl+O", openWiki.Bind("local"))
    openMenu.Add("&Wiki Web`tCtrl+W", openWiki.Bind("web"))
    editorsMenu := Menu()
    editorsMenu.Add("&After Effects", menu_Adobe.bind("AE"))
    ; editorsMenu.Add("&Photoshop", ) ;// call a different gui
    editorsMenu.Add("&Premiere", menu_Adobe.bind("Premiere"))
    ; editorsMenu.Add("&Resolve", ) ;// call a different gui
    ;// define the entire menubar
    bar := MenuBar()
    bar.Add("&File", FileMenu)
    bar.Add("&Open", openMenu)
    bar.Add("&Editors", editorsMenu)

    openWiki(which, *) {
        switch which {
            case "local":
                if WinExist("Wiki explorer.exe")
                    WinActivate("Wiki explorer.exe")
                else
                    Run(ptf.Wiki "\Latest")
            case "web":
                checkInt := checkInternet()
                if !checkInt
                    {
                        tool.Cust("It doesn't appear like you have an active internet connection", 2.0)
                        tool.Cust("The page will run just incase", 2.0,,, 20, 2)
                    }
                if WinExist("Home · Tomshiii/ahk Wik")
                    WinActivate("Home · Tomshiii/ahk Wik")
                else
                    Run("https://github.com/Tomshiii/ahk/wiki")
        }
    }

    try { ;attempting to grab window information on the active window for `menu_AddGame()`
        winProcc := WinGetProcessName("A")
        winTitle := WinGetTitle("A")
    } catch {
        winProcc := ""
        winTitle := ""
    }

    darkMode := IniRead(ptf["settings"], "Settings", "dark mode")
    version := IniRead(ptf["settings"], "Track", "version")

    ;gameCheckGUI
    gameTitle := "Add game to gameCheck.ahk"
    gameCheckSettingGUI := gameCheckGUI(darkMode, version, winTitle, winProcc, "AlwaysOnTop", gameTitle)

    if WinExist("Settings " version)
        return
    settingsGUI := tomshiBasic(,, "+Resize +MinSize250x AlwaysOnTop", "Settings " version)
    SetTimer(resize, -10)
    resize() => settingsGUI.Opt("-Resize")

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! Top Titles
   /*  titleText := settingsGUI.Add("Text", "section W100 H25 X9 Y7", "Settings")
    titleText.SetFont("S15 Bold Underline") */

    toggleText := settingsGUI.Add("Text", "W100 H20 xs Y7", "Toggle")
    toggleText.SetFont("S13 Bold")

    adjustText := settingsGUI.Add("Text", "W100 H20 x+125", "Adjust")
    adjustText.SetFont("S13 Bold")
    decimalText := settingsGUI.Add("Text", "W180 H20 x+-40 Y+-18", "(decimals adjustable in .ini)")


    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! checkboxes

    ;// update check
    checkVal := IniRead(ptf["settings"], "Settings", "update check", "true")
    switch checkVal {
        case "true":
            updateCheckToggle := settingsGUI.Add("Checkbox", "Check3 Checked1 section xs+1 Y+5", "Check for Updates")
            updateCheckToggle.ToolTip := "Scripts will check for updates"
        case "false":
            updateCheckToggle := settingsGUI.Add("Checkbox", "Check3 Checked-1 section xs+1 Y+5", "Check for Updates")
            updateCheckToggle.ToolTip := "Scripts will still check for updates but will not present the user`nwith a GUI when an update is available"
        case "stop":
            updateCheckToggle := settingsGUI.Add("Checkbox", "Check3 Checked0 section xs+1 Y+5", "Check for Updates")
            updateCheckToggle.ToolTip := "Scripts will NOT check for updates"
    }
    updateCheckToggle.OnEvent("Click", update)
    update(*)
    {
        ToolTip("")
        betaCheck := IniRead(ptf["settings"], "Settings", "beta update check") ;storing the beta check value so we can toggle it back on if it was on originally
        updateVal := updateCheckToggle.Value
        switch updateVal {
            case 1: ;true
                IniWrite("true", ptf["settings"], "Settings", "update check")
                tool.Cust("Scripts will check for updates", 2000)
                if betaCheck = "true"
                    betaupdateCheckToggle.Value := 1
            case -1: ;false
                IniWrite("false", ptf["settings"], "Settings", "update check")
                tool.Cust("Scripts will still check for updates but will not present the user`nwith a GUI when an update is available", 2000)
                if betaCheck = "true"
                    betaupdateCheckToggle.Value := 1
            case 0: ;stop
                betaupdateCheckToggle.Value := 0
                IniWrite("stop", ptf["settings"], "Settings", "update check")
                tool.Cust("Scripts will NOT check for updates", 2000)
        }
    }

    ;// check for beta updates
    betaStart := false ;if the user enables the check for beta updates, we want my main script to reload on exit.
    if IniRead(ptf["settings"], "Settings", "beta update check") = "true" && updateCheckToggle.Value != 0
        betaupdateCheckToggle := settingsGUI.Add("Checkbox", "Checked1 xs Y+5", "Check for Beta Updates")
    else
        betaupdateCheckToggle := settingsGUI.Add("Checkbox", "Checked0 xs Y+5", "Check for Beta Updates")
    betaupdateCheckToggle.OnEvent("Click", betaupdate)
    betaupdate(*)
    {
        updateVal := betaupdateCheckToggle.Value
        if updateVal = 1 && updateCheckToggle.Value != 0
            {
                betaStart := true
                IniWrite("true", ptf["settings"], "Settings", "beta update check")
            }

        else
            {
                betaupdateCheckToggle.Value := 0
                betaStart := false
                IniWrite("false", ptf["settings"], "Settings", "beta update check")
            }
    }

    ;// dark mode toggle
    darkINI := IniRead(ptf["settings"], "Settings", "dark mode")
    darkCheck := settingsGUI.Add("Checkbox", "Checked" trueOrfalse(darkINI) " Y+5", "Dark Mode")
    darkToolY := "A dark theme will be applied to certain GUI elements wherever possible.`nThese GUI elements may need to be reloaded to take effect"
    darkToolN := "A lighter theme will be applied to certain GUI elements wherever possible.`nThese GUI elements may need to be reloaded to take effect"
    switch darkINI {
        case "true":
            darkCheck.ToolTip := darkToolY
        case "false":
            darkCheck.ToolTip := darkToolN
        case "Disabled":
            darkCheck.ToolTip := "The users OS version is too low for this feature"
            darkCheck.Opt("+Disabled")
    }
    darkCheck.OnEvent("Click", darkToggle)
    darkToggle(*)
    {
        ToolTip("")
        darkToggleVal := darkCheck.Value
        switch darkToggleVal {
            case 1:
                IniWrite("true", ptf["settings"], "Settings", "dark mode")
                darkCheck.ToolTip := darkToolY
                tool.Cust(darkToolY, 2000)
                goDark()
            case 0:
                IniWrite("false", ptf["settings"], "Settings", "dark mode")
                darkCheck.ToolTip := darkToolN
                tool.Cust(darkToolN, 2000)
                goDark(false, "Light")
        }
    }

    ;// run at startup
    runStartupINI := IniRead(ptf["settings"], "Settings", "run at startup")
    StartupCheckTitle := "Run at Startup"
    StartupCheck := settingsGUI.Add("Checkbox", "Checked" trueOrfalse(runStartupINI) " Y+5", StartupCheckTitle)
    startToolY := "My scripts will automatically run at PC startup"
    startToolN := "My scripts will no longer run at PC startup"
    switch runStartupINI {
        case "true":
            StartupCheck.ToolTip := startToolY
        case "false":
            StartupCheck.ToolTip := startToolN
    }
    StartupCheck.OnEvent("Click", toggle.Bind("run at startup"))

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! script checkboxes

    ;// autosave check checklist
    ascheckCheck := IniRead(ptf["settings"], "Settings", "autosave check checklist")
    ascheckCheckTitle := "``autosave.ahk`` check for`n ``checklist.ahk``"
    ascheckToggle := settingsGUI.Add("Checkbox", "Checked" trueOrfalse(ascheckCheck) " Y+20", ascheckCheckTitle)
    ascheckCheckY := "``autosave.ahk`` will check to ensure you have ``checklist.ahk`` open"
    ascheckCheckN := "``autosave.ahk`` will no longer check to ensure you have ``checklist.ahk`` open"
    switch ascheckCheck {
        case "true":
            ascheckToggle.ToolTip := ascheckCheckY
        case "false":
            ascheckToggle.ToolTip := ascheckCheckN
    }
    ascheckToggle.OnEvent("Click", toggle.Bind("autosave check checklist"))

    ;// autosave tooltips
    tooltipCheck := IniRead(ptf["settings"], "Settings", "tooltip")
    tooltipCheckTitle := "``autosave.ahk`` tooltips"
    toggleToggle := settingsGUI.Add("Checkbox", "Checked" trueOrfalse(tooltipCheck) " Y+5", tooltipCheckTitle)
    toggleToolY := "``autosave.ahk`` will produce tooltips on the minute, in the last 4min to alert the user a save is coming up"
    toggleToolN := "``autosave.ahk`` will no longer produce tooltips on the minute, in the last 4min to alert the user a save is coming up"
    switch tooltipCheck {
        case "true":
            toggleToggle.ToolTip := toggleToolY
        case "false":
            toggleToggle.ToolTip := toggleToolN
    }
    toggleToggle.OnEvent("Click", toggle.Bind("tooltip"))


    /**
     * This function handles the logic for a few checkboxes
     * @param {any} ini is the name of the ini `Key` you wish to be toggles
     * @param {any} script the name of the guiCtrl obj that gets auto fed into this function
     */
    toggle(ini, script, unneeded)
    {
        detect()
        ToolTip("")
        ;// each switch here goes off the TITLE variable we created
        switch script.text {
            case tooltipCheckTitle:
                toolTrue := toggleToolY
                toolFalse := toggleToolN
            case ascheckCheckTitle:
                toolTrue := ascheckCheckY
                toolFalse := ascheckCheckN
            case StartupCheckTitle:
                toolTrue := startToolY
                toolFalse := startToolN
        }

        ;// toggling the checkboxes
        toggleVal := script.Value
        switch toggleVal {
            case 1:
                IniWrite("true", ptf["settings"], "Settings", ini)
                script.ToolTip := toolTrue
                tool.Cust(toolTrue, 2000)
            case 0:
                IniWrite("false", ptf["settings"], "Settings", ini)
                script.ToolTip := toolFalse
                tool.Cust(toolFalse, 2000)
        }
        ;// custom logic for the run at startup option
        if ini = "run at startup"
            {
                switch toggleVal {
                    case 1:
                        startupScript := ptf.rootDir "\PC Startup\PC Startup.ahk"
                        FileCreateShortcut(startupScript, ptf["scriptStartup"])
                    case 0:
                        if FileExist(ptf["scriptStartup"])
                            FileDelete(ptf["scriptStartup"])
                }
                return
            }
        ;// reloading autosave
        if WinExist("autosave.ahk - AutoHotkey")
            PostMessage 0x0111, 65303,,, "autosave.ahk - AutoHotkey"
    }

    ;// checklist tooltip
    checklistTooltip := IniRead(ptf["settings"], "Settings", "checklist tooltip")
    checklistTooltipTitle := "``checklist.ahk`` tooltips"
    checkTool := settingsGUI.Add("Checkbox", "Checked" trueOrfalse(checklistTooltip) " Y+5", checklistTooltipTitle)
    checkToolY := "``checklist.ahk`` will produce tooltips to remind you if you've paused the timer"
    checkToolN := "``checklist.ahk`` will no longer produce tooltips to remind you if you've paused the timer"
    switch checklistTooltip {
        case "true":
            checkTool.ToolTip := checkToolY
        case "false":
            checkTool.ToolTip := checkToolN
    }
    checkTool.OnEvent("Click", msgboxToggle.Bind("checklist tooltip"))

    ;// checklist wait
    checklistWait := IniRead(ptf["settings"], "Settings", "checklist wait")
    checklistWaitTitle := "``checklist.ahk`` always wait"
    checkWait := settingsGUI.Add("Checkbox", "Checked" trueOrfalse(checklistWait) " Y+5", checklistWaitTitle)
    waitToolY := "``checklist.ahk`` will always wait for you to open a premiere project before opening"
    waitToolN := "``checklist.ahk`` will prompt the user if you wish to wait or manually open a project"
    switch checklistWait {
        case "true":
            checkWait.ToolTip := waitToolY
        case "false":
            checkWait.ToolTip := waitToolN
    }
    checkWait.OnEvent("Click", msgboxToggle.Bind("checklist wait"))


    /**
     * This function handles logic for checkboxes that need to pop up a msgbox to alert the user that they need to reload `checklist.ahk`
     * @param {any} ini is the name of the ini `Key` you wish to be toggles
     * @param {any} script the name of the guiCtrl obj that gets auto fed into this function
     */
    msgboxToggle(ini, script, other)
    {
        detect()
        ToolTip("")
        switch script.text {
            case checklistWaitTitle:
                toolTrue := waitToolY
                toolFalse := waitToolN
            case checklistTooltipTitle:
                toolTrue := checkToolY
                toolFalse := checkToolN
            }
        msgboxText := "Please stop any active checklist timers and restart ``checklist.ahk`` for this change to take effect"
        checkWaitVal := script.Value
        switch checkWaitVal {
            case 1:
                IniWrite("true", ptf["settings"], "Settings", ini)
                checkWait.ToolTip := toolTrue
                tool.Cust(toolTrue, 2.0)
                if WinExist("checklist.ahk - AutoHotkey")
                    MsgBox(msgboxtext,, "48 4096")
            case 0:
                IniWrite("false", ptf["settings"], "Settings", ini)
                checkWait.ToolTip := toolFalse
                tool.Cust(toolFalse, 2.0)
                if WinExist("checklist.ahk - AutoHotkey")
                    MsgBox(msgboxtext,, "48 4096")
        }
    }

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! EDIT BOXES
    premInitYear := IniRead(ptf["settings"], "Adjust", "prem year")
    AEInitYear := IniRead(ptf["settings"], "Adjust", "ae year")
    ;this loop auto generates the edit boxes using "..\settingsGUI\editValues.ahk"
    loop set_Edit_Val.Length {
        initVal := IniRead(ptf["settings"], "Adjust", set_Edit_Val.iniInput[A_Index])
        settingsGUI.Add("Edit", set_Edit_Val.EditPos[A_Index] " r1 W50 Number v" set_Edit_Val.control[A_Index])
        settingsGUI.Add("UpDown",, initVal)
        settingsGUI.Add("Text", set_Edit_Val.textPos[A_Index] " v" set_Edit_Val.textControl[A_Index], set_Edit_Val.scriptText[A_Index])
        settingsGUI[set_Edit_Val.textControl[A_Index]].SetFont(set_Edit_Val.colour[A_Index])
        settingsGUI.Add("Text", set_Edit_Val.otherTextPos[A_Index], set_Edit_Val.otherText[A_Index])
        settingsGUI[set_Edit_Val.control[A_Index]].OnEvent("Change", editCtrl.Bind(set_Edit_Val.Bind[A_Index], set_Edit_Val.iniInput[A_Index]))
    }

    editCtrl(script, ini, ctrl, *)
    {
        detect()
        IniWrite(ctrl.value, ptf["settings"], "Adjust", ini)
        if WinExist(script " - AutoHotkey")
            PostMessage 0x0111, 65303,,, script " - AutoHotkey"
    }

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! BOTTOM TEXT
    resetText := settingsGUI.Add("Text", "Section W100 H20 X9 Y+60", "Reset")
    resetText.SetFont("S13 Bold")

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! BUTTON TOGGLES

    adobeToggle := settingsGUI.Add("Button", "w100 h30 Y+5", "adobeTemp()")
    adobeToggle.OnEvent("Click", buttons.bind("adobe"))

    firstToggle := settingsGUI.Add("Button", "w100 h30 X+15", "firstCheck()")
    firstToggle.OnEvent("Click", buttons.bind("first"))

    buttons(which, button, *)
    {
        if which = "adobe"
            buttonTitle := "adobeTemp()"
        if which = "first"
            buttonTitle := "firstCheck()"
        switch button.text {
            case buttonTitle:
                button.Text := "undo?"
            case "undo?":
                button.Text := buttonTitle
        }
    }

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! STATUS BAR

    workDir := IniRead(ptf["settings"], "Track", "working dir")
    SB := settingsGUI.Add("StatusBar")
    SB.SetText("  Current working dir: " workDir)
    checkdir := SB.GetPos(,, &width)
    parts := SB.SetParts(width + 20 + (StrLen(workDir)*5))
    SetTimer(statecheck, -100)
    statecheck(*)
    {
        if A_IsSuspended = 0
            state := "Active"
        else
            state := "Suspended"
        SB.SetText(" Scripts " state, 2)
        SetTimer(, -1000)
    }
    SB.SetFont("S9")
    SB.OnEvent("Click", dir)
    dir(*)
    {
        dirName := SplitPathObj(workDir)
        if WinExist("ahk_exe explorer.exe " dirName.NameNoExt)
            WinActivate("ahk_exe explorer.exe " dirName.NameNoExt)
        else
            Run(workDir)
    }

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! GROUP EXIT BUTTONS

    group := settingsGUI.Add("GroupBox", "W201 H58 xs+270 ys+5", "Exit")
    hardResetVar := settingsGUI.Add("Button", "W85 H30 x+-190 y+-40", "Hard Reset")
    hardResetVar.OnEvent("Click", close.bind("hard"))

    saveAndClose := settingsGUI.Add("Button", "W85 H30 x+10", "Save && Exit")
    saveAndClose.OnEvent("Click", close)

    settingsGUI.OnEvent("Escape", close)
    settingsGUI.OnEvent("Close", close)
    close(butt?, *)
    {
        SetTimer(statecheck, 0)
        SetTimer(iniWait, 0)
        if !IsSet(butt) ;have to do it this way instead of using `butt.text` because hitting the X to close would cause an error doing that. Binding the function is the only way
            {
                ;check
                if betaStart = true
                    Run(A_ScriptFullPath)
            }
        ;check to see if the user wants to reset adobeTemp()
        if adobeToggle.Text = "undo?"
            IniWrite("", ptf["settings"], "Track", "adobe temp")
        ;check to see if the user wants to reset firstCheck()
        if firstToggle.Text = "undo?"
            IniWrite("false", ptf["settings"], "Track", "first check")
        ;a check incase this settings gui was launched from firstCheck()
        if WinExist("Scripts Release " version)
            WinSetAlwaysOnTop(1, "Scripts Release " version)
        if IsSet(butt) && butt = "hard"
            reload_reset_exit("reset")
        ;before finally closing
        settingsGUI.Destroy()
    }

    ;the below code allows for the tooltips on hover
    ;code can be found on the ahk website : https://lexikos.github.io/v2/docs/objects/Gui.htm#ExToolTip
    OnMessage(0x0200, On_WM_MOUSEMOVE)

    ;gets defined at the top of the script
    if darkMode = "true"
        goDark()

    goDark(darkm := true, DarkorLight := "Dark")
    {
            dark.titleBar(settingsGUI.Hwnd, darkm)
            dark.button(adobeToggle.Hwnd, DarkorLight)
            dark.button(firstToggle.Hwnd, DarkorLight)
            dark.button(hardResetVar.Hwnd, DarkorLight)
            dark.button(saveAndClose.Hwnd, DarkorLight)
    }

    settingsGUI.Show("Center AutoSize")
    settingsGUI.MenuBar := bar
    ;// we have to increase the size of the gui to compensate for the menubar
    settingsGUI.GetPos(,,, &height)
    settingsGUI.Move(,,, height +20)

    ;----------------------------------------------------------------------------------------------------------------------------------
    ;//! MENU BAR FUNCS

    menu_AddGame(*)
    {
        gameCheckSettingGUI.Show("AutoSize")
        gameCheckSettingGUI.OnEvent("Close", Gui_Close)
        Gui_Close(*) {
            if WinExist("Settings " version)
                {
                    ExStyle := wingetExStyle("Settings " version)
			        if(ExStyle & !0x8) ; 0x8 is WS_EX_TOPMOST.
                        WinSetAlwaysOnTop(1, "Settings " version)
                    if !WinActive("Settings " version)
                        WinActivate("Settings " version)
                }
            gameCheckSettingGUI.Hide()
        }
        WinSetAlwaysOnTop(0, "Settings " version)
        settingsGUI.Opt("+Disabled")
        WinWaitClose(gameTitle)
        if WinExist("Settings " version)
            settingsGUI.Opt("-Disabled")
    }

    menu_Openini(*)
    {
        settingsGUI.GetPos(&x, &y, &width, &height)
        settingsGUI.Opt("-AlwaysOnTop")
        if WinExist("settings.ini") ;if ini already open, get pos, close, and then reopen to refresh
            refreshWin("settings.ini", ptf["settings"])
        else
            Run("Notepad.exe " ptf["settings"])
        WinWait("settings.ini")
        WinMove(x+width-8, y, 322, height-2,"settings.ini")
        SetTimer(iniWait, -100)
    }
    iniWait()
    {
        if !WinExist("Settings " version)
            {
                SetTimer(, 0)
                goto end
            }
        if WinExist("settings.ini")
            {
                SetTimer(, -1000)
                goto end
            }
        if !WinExist("settings.ini") && WinExist("Settings " version)
            settingsGUI.Opt("+AlwaysOnTop")
        SetTimer(, 0)
        end:
    }

    menu_Adobe(program, *) {
        switch program {
            case "Premiere":
                title := program " Pro Settings"
                yearIniName := "prem year"
                iniInitYear := IniRead(ptf.SettingsLoc "\settings.ini", "adjust", yearIniName, A_Year)
                verIniName := "premVer"
                genProg := program
                otherTitle := "After Effects Settings"
                imageLoc := ptf.premIMGver
            case "AE":
                title := "After Effects Settings"
                yearIniName := "ae year"
                iniInitYear := IniRead(ptf.SettingsLoc "\settings.ini", "adjust", yearIniName, A_Year)
                verIniName := "aeVer"
                genProg := "AE"
                otherTitle := "Premiere Pro Settings"
                imageLoc := ptf.aeIMGver
        }
        if WinExist(title)
            return
        adobeGui := tomshiBasic(,, "+MinSize275x", title)
        ctrlX := 100

        ;// start defining the gui
        adobeGui.AddText("Section", "Year: ")
        year := adobeGui.Add("Edit", "x" ctrlX " ys-5 r1 W50 Number Limit4", iniInitYear)
        year.OnEvent("Change", editCtrl.bind(yearIniName))
        adobeGui.AddText("xs y+10", "Version: ")
        generateDrop(genProg, ctrlX)

        adobeGui.AddText("xs y+15", "*some settings will require a full reload to take effect").SetFont("s9 italic")

        ;// show
        adobeGui.Show()
        ;// move gui
        add := 0
        ;// settingsgui
        WinGetPos(&x, &y,,, "Settings " version)
        if WinExist(otherTitle)
            {
                WinGetPos(,,, &yearHeight, otherTitle)
                add := yearHeight
            }
        adobeGui.GetPos(,, &width)
        adobeGui.Move(x-width+5, y+add)

        editCtrl(ini, ctrl, *)
        {
            IniWrite(ctrl.value, ptf["settings"], "Adjust", ini)
        }

        generateDrop(program, ctrlX) {
            if program != "AE" && program != "Premiere"
                {
                    err := ValueError("Incorrect value in Parameter #1", -1, program)
                    errorLog(err, "settingsGUI()")
                    throw err
                }
            if !DirExist(ptf.ImgSearch "\" program "\")
                {
                    dirErr := ValueError("ImageSearch directory cannot be found", -1, ptf.ImgSearch "\" program)
                    errorLog(dirErr, "settingsGUI()")
                    throw dirErr
                }
            supportedVers := []
            loop files ptf.ImgSearch "\" program "\*", "D"
                supportedVers.Push(A_LoopFileName)
            for value in supportedVers
                {
                    if value = imageLoc
                        {
                            defaultIndex := A_Index
                            break
                        }
                }
            if !IsSet(defaultIndex)
                defaultIndex := 1
            ver := adobeGui.Add("DropDownList", "x" ctrlX " y+-20 Choose" defaultIndex, supportedVers)
            ver.OnEvent("Change", editCtrl.bind(verIniName))
        }
    }
}