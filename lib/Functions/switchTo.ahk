;\\CURRENT SCRIPT VERSION\\This is a "script" local version and doesn't relate to the Release Version
;\\v2.17
#Include General.ahk

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToExplorer()
{
    if not WinExist("ahk_class CabinetWClass") && !WinExist("ahk_class #32770")
        {
            Run("explorer.exe")
            WinWait("ahk_class CabinetWClass")
            WinActivate("ahk_class CabinetWClass") ;in win11 running explorer won't always activate it, so it'll open in the backround
        }
    GroupAdd("explorers", "ahk_class CabinetWClass")
    GroupAdd("explorers", "ahk_class #32770") ;these are save dialoge windows from any program
    if WinActive("ahk_exe explorer.exe")
        GroupActivate("explorers", "r")
    else if WinExist("ahk_class CabinetWClass") || WinExist("ahk_class #32770")
        WinActivate ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This function when called will close all windows of the desired program EXCEPT the active one. Helpful when you accidentally have way too many windows open.
 * @param {String} program is the ahk_class or ahk_exe of the program you want this function to close
 */
closeOtherWindow(program)
{
    value := WinGetList(program) ;gets a list of all open windows
    tool.Cust(value.length - 1 " other window(s) closed") ;tooltip to display how many explorer windows are being closed
    for this_value in value
        {
            if A_Index > 1 ;closes all windows that AREN'T the last active window
                WinClose this_value
        }
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToPremiere()
{
    if not WinExist("ahk_class Premiere Pro")
        Run(A_ScriptDir "\Support Files\shortcuts\Adobe Premiere Pro.exe.lnk")
    else if WinExist("ahk_class Premiere Pro")
        WinActivate("ahk_class Premiere Pro")
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToAE()
{
    runae() ;cut repeat code
    {
        Run(A_ScriptDir "\Support Files\shortcuts\AfterFX.exe.lnk")
        WinWait("ahk_exe AfterFX.exe")
        WinActivate("ahk_exe AfterFX.exe")
    }
    premTitle() ;pulls dir url from prem title and runs ae project in that dir
    {
        try {
            Name := WinGetTitle("Adobe Premiere Pro")
            titlecheck := InStr(Name, "Adobe Premiere Pro " A_Year " -") ;change this year value to your own year. | we add the " -" to accomodate a window that is literally just called "Adobe Premiere Pro [Year]"
            dashLocation := InStr(Name, "-")
            length := StrLen(Name) - dashLocation
            if not titlecheck
                {
                    runae()
                    return
                }
            entirePath := SubStr(name, dashLocation + "2", length)
            pathlength := StrLen(entirePath)
            finalSlash := InStr(entirePath, "\",, -1)
            path := SubStr(entirePath, 1, finalSlash - "1")
            if !FileExist(path "\*.aep")
                {
                    runae()
                    return
                }
            loop files path "\*.aep", "F"
                {
                    Run(A_LoopFileFullPath)
                    tool.Cust("Running AE file for this project")
                    WinWait("ahk_exe AfterFX.exe")
                    WinActivate("ahk_exe AfterFX.exe")
                    return
                }                
        } catch as e {
            tool.Cust("Couldn't determine proper path from Premiere")
            errorLog(A_ThisFunc "()", "Couldn't determine proper path from Premiere", A_LineFile, A_LineNumber)
            runae()
            return
        }
    }
    if !WinExist("ahk_exe AfterFX.exe") && WinExist("ahk_exe Adobe Premiere Pro.exe") ;if prem is open but AE isn't
        premTitle()
    else if WinExist("ahk_exe AfterFX.exe") && WinExist("ahk_exe Adobe Premiere Pro.exe") ;if both are open
        {
            try {
                Name := WinGetTitle("Adobe After Effects")
                titlecheck := InStr(Name, "Adobe After Effects " A_Year " -") ;change this year value to your own year. | we add the " -" to accomodate a window that is literally just called "Adobe Program [Year]"
                if slash := InStr(Name, "\",, -1) ;if there's a slash in the title, it means a project is open
                    WinActivate("ahk_exe AfterFX.exe")
                else
                    premTitle()
            }
        }
    else if WinExist("ahk_exe AfterFX.exe") && !WinExist("ahk_exe Adobe Premiere Pro.exe")
        WinActivate("ahk_exe AfterFX.exe")
    else
        runae()
}

/**
 * This switchTo function will quickly switch to the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToDisc()
{
    
    move() => WinMove(-1080, -274, 1080, 1600, "ahk_exe Discord.exe") ;creating a function out of the winmove so you can easily adjust the value
    if not WinExist("ahk_exe Discord.exe")
        {
            Run("C:\Users\" A_UserName "\AppData\Local\Discord\Update.exe --processStart Discord.exe")
            WinWait("ahk_exe Discord.exe")
            if WinGetMinMax("ahk_exe Discord.exe") = 1 ;a return value of 1 means it is maximised
                WinRestore() ;winrestore will unmaximise it
            move() ;moves it into position after opening
        }
    else
        {
            WinActivate("ahk_exe Discord.exe")
            if WinGetMinMax("ahk_exe Discord.exe") = 1 ;a return value of 1 means it is maximised
                WinRestore() ;winrestore will unmaximise it
            move() ; just incase it isn't in the right spot/fullscreened for some reason
            tool.Cust("Discord is now active", 500) ;this is simply because it's difficult to tell when discord has focus if it was already open
        }
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToPhoto()
{
    if WinExist("ahk_exe Photoshop.exe")
        {
            WinActivate("ahk_exe Photoshop.exe")
            return
        }
    Run A_ScriptDir "\Support Files\shortcuts\Photoshop.exe.lnk"
    WinWait("ahk_exe Photoshop.exe")
    WinActivate("ahk_exe Photoshop.exe")
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToFirefox()
{
    if not WinExist("ahk_class MozillaWindowClass")
        Run("firefox.exe")
    if WinActive("ahk_exe firefox.exe")
        switchToOtherFirefoxWindow()
    else if WinExist("ahk_exe firefox.exe")
        ;WinRestore ahk_exe firefox.exe
        WinActivate("ahk_exe firefox.exe")
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToOtherFirefoxWindow() ;I use this as a nested function below in firefoxTap(), you can just use this separately
{
    if !WinExist("ahk_exe firefox.exe")
        {
            Run("firefox.exe")
            return
        }
    if WinActive("ahk_class MozillaWindowClass")
        {
            GroupAdd("firefoxes", "ahk_class MozillaWindowClass")
            GroupActivate("firefoxes", "r")
        }
    else
        WinActivate("ahk_class MozillaWindowClass")
}

/**
 * This function will do different things depending on how many times you press the activation hotkey.
 * 
 * 1 press = switchToFirefox()
 * 
 *2 press = switchToOtherFirefoxWindow()
 */
firefoxTap()
{
    static winc_presses := 0
    if winc_presses > 0 ; SetTimer already started, so we log the keypress instead.
    {
        winc_presses += 1
        return
    }
    ; Otherwise, this is the first press of a new series. Set count to 1 and start
    ; the timer:
    winc_presses := 1
    SetTimer After400, -180 ; Wait for more presses within a 300 millisecond window.

    After400()  ; This is a nested function.
    {
        if winc_presses = 1 ; The key was pressed once.
        {
            switchToFirefox()
        }
        else if winc_presses = 2 ; The key was pressed twice.
        {
            switchToOtherFirefoxWindow()
        }
        else if winc_presses > 2
        {
            ;
        }
        ; Regardless of which action above was triggered, reset the count to
        ; prepare for the next series of presses:
        winc_presses := 0
    }
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToVSC()
{
    if not WinExist("ahk_exe Code.exe")
        Run("C:\Program Files\Microsoft VS Code\Code.exe")
        GroupAdd("Code", "ahk_class Chrome_WidgetWin_1")
    if WinActive("ahk_exe Code.exe")
        GroupActivate("Code", "r")
    else if WinExist("ahk_exe Code.exe")
        WinActivate("ahk_exe Code.exe") ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToGithub()
{
    if not WinExist("ahk_exe GitHubDesktop.exe")
        Run("C:\Users\" A_UserName "\AppData\Local\GitHubDesktop\GitHubDesktop.exe")
        GroupAdd("git", "ahk_class Chrome_WidgetWin_1")
    if WinActive("ahk_exe GitHubDesktop.exe")
        GroupActivate("git", "r")
    else if WinExist("ahk_exe GitHubDesktop.exe")
        WinActivate("ahk_exe GitHubDesktop.exe") ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToStreamdeck()
{
    if not WinExist("ahk_exe StreamDeck.exe")
        Run(A_ProgramFiles "\Elgato\StreamDeck\StreamDeck.exe")
        GroupAdd("stream", "ahk_class Qt5152QWindowIcon")
    if WinActive("ahk_exe StreamDeck.exe")
        GroupActivate("stream", "r")
    else if WinExist("ahk_exe Streamdeck.exe")
        WinActivate("ahk_exe StreamDeck.exe") ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToExcel()
{
    if not WinExist("ahk_exe EXCEL.EXE")
        {
            Run(A_ProgramFiles "\Microsoft Office\root\Office16\EXCEL.EXE")
            WinWait("ahk_exe EXCEL.EXE")
            WinActivate("ahk_exe EXCEL.EXE")
        }
    GroupAdd("xlmain", "ahk_class XLMAIN")
    if WinActive("ahk_exe EXCEL.EXE")
        GroupActivate("xlmain", "r")
    else if WinExist("ahk_exe EXCEL.EXE")
        WinActivate("ahk_exe EXCEL.EXE")
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToWord()
{
    if not WinExist("ahk_exe WINWORD.EXE")
        {
            Run(A_ProgramFiles "\Microsoft Office\root\Office16\WINWORD.EXE")
            WinWait("ahk_exe WINWORD.EXE")
            WinActivate("ahk_exe WINWORD.EXE")
        }
    GroupAdd("wordgroup", "ahk_class wordgroup")
    if WinActive("ahk_exe WINWORD.EXE")
        GroupActivate("wordgroup", "r")
    else if WinExist("ahk_exe WINWORD.EXE")
        WinActivate("ahk_exe WINWORD.EXE")
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToWindowSpy()
{
    if not WinExist("WindowSpy.ahk")
        Run(A_ProgramFiles "\AutoHotkey\UX\WindowSpy.ahk")
    GroupAdd("winspy", "ahk_class AutoHotkeyGUI")
    if WinActive("WindowSpy.ahk")
        GroupActivate("winspy", "r")
    else if WinExist("WindowSpy.ahk")
        WinActivate("WindowSpy.ahk") ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToYourPhone()
{
    if not WinExist("ahk_pid 13884") ;this process id may need to be changed for you. I also have no idea if it will stay the same
        Run(A_ScriptDir "\Support Files\shortcuts\Your Phone.lnk")
    GroupAdd("yourphone", "ahk_class ApplicationFrameWindow")
    if WinActive("Your Phone")
        GroupActivate("yourphone", "r")
    else if WinExist("Your Phone")
        WinActivate("Your Phone") ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToEdge()
{
    if not WinExist("ahk_exe msedge.exe")
        {
            Run("msedge.exe")
            WinWait("ahk_exe msedge.exe")
            WinActivate("ahk_exe msedge.exe")
        }
    GroupAdd("git", "ahk_exe msedge.exe")
    if WinActive("ahk_exe msedge.exe")
        GroupActivate("git", "r")
    else if WinExist("ahk_exe msedge.exe")
        WinActivate("ahk_exe msedge.exe") ;you have to use WinActivatebottom if you didn't create a window group.
}

/**
 * This switchTo function will quickly switch to & cycle between windows of the specified program. If there isn't an open window of the desired program, this function will open one
 */
switchToMusic()
{
    GroupAdd("MusicPlayers", "ahk_exe wmplayer.exe")
    GroupAdd("MusicPlayers", "ahk_exe vlc.exe")
    GroupAdd("MusicPlayers", "ahk_exe AIMP.exe")
    GroupAdd("MusicPlayers", "ahk_exe foobar2000.exe")
    if not WinExist("ahk_group MusicPlayers")
        musicGUI()
    if WinExist("ahk_group MusicPlayers")
        {
            if !WinActive("ahk_group MusicPlayers")
                WinActivate("ahk_group MusicPlayers")
            else
                GroupActivate "MusicPlayers", "r"
            loop {
                IME := WinGetTitle("A")
                if IME = "Default IME"
                    GroupActivate "MusicPlayers", "r"
                if IME != "Default IME"
                    break
            }
        }
    ;window := WinGetTitle("A") ;debugging
    ;tool.Cust(window) ;debugging
}

; ===============================================================
;
; GUI
;
; ===============================================================

/**
 * This function creates a GUI for the user to select which media player they wish to open.
 * 
 * Currently offers AIMP, Foobar, WMP & VLC.
 * 
 * This function is also used within switchToMusic()
*/
musicGUI()
{
    if WinExist("Music to open?")
        return
    progFi := "C:\Program Files"
    progFi32 := "C:\Program Files (x86)"
    aimpPath := progFi32 "\AIMP3\AIMP.exe"
    foobarPath := progFi32 "\foobar2000\foobar2000.exe"
    wmpPath := progFi32 "\Windows Media Player\wmplayer.exe"
    vlcPath := progFi "\VideoLAN\VLC\vlc.exe"

    ;if there is no music player open, a custom GUI window will open asking which program you'd like to open
    MyGui := Gui("AlwaysOnTop", "Music to open?") ;creates our GUI window
    MyGui.SetFont("S10") ;Sets the size of the font
    MyGui.SetFont("W600") ;Sets the weight of the font (thickness)
    MyGui.Opt("-Resize +MinSize260x120 +MaxSize260x120") ;Sets a minimum size for the window
    ;#now we define the elements of the GUI window
    ;defining AIMP
    aimplogo := MyGui.Add("Picture", "w25 h-1 Y9", A_WorkingDir "\Support Files\images\aimp.png")
    AIMP := MyGui.Add("Button", "X40 Y7", "AIMP")
    AIMP.OnEvent("Click", musicRun)
    ;defining Foobar
    foobarlogo := MyGui.Add("Picture", "w20 h-1 X14 Y40", A_WorkingDir "\Support Files\images\foobar.png")
    foobar := MyGui.Add("Button", "X40 Y40", "Foobar")
    foobar.OnEvent("Click", musicRun)
    ;defining Windows Media Player
    wmplogo := MyGui.Add("Picture", "w25 h-1 X140 Y9", A_WorkingDir "\Support Files\images\wmp.png")
    WMP := MyGui.Add("Button", "X170 Y7", "WMP")
    WMP.OnEvent("Click", musicRun)
    ;defining VLC
    vlclogo := MyGui.Add("Picture", "w28 h-1 X138 Y42", A_WorkingDir "\Support Files\images\vlc.png")
    VLC := MyGui.Add("Button", "X170 Y40", "VLC")
    VLC.OnEvent("Click", musicRun)
    ;defining music folder
    folderlogo := MyGui.Add("Picture", "w25 h-1  X14 Y86", A_WorkingDir "\Support Files\images\explorer.png")
    FOLDERGUI := MyGui.Add("Button", "X42 Y85", "MUSIC FOLDER")
    FOLDERGUI.OnEvent("Click", MUSICFOLDER)
    ;add an invisible button since removing the default off all the others did nothing
    removedefault := MyGui.Add("Button", "Default X0 Y0 W0 H0", "_")
    ;#finished with definitions

    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "dark mode") = "true"
        goDark()
    goDark()
    {
        titleBarDarkMode(MyGui.Hwnd)
        buttonDarkMode(AIMP.Hwnd)
        buttonDarkMode(foobar.Hwnd)
        buttonDarkMode(WMP.Hwnd)
        buttonDarkMode(VLC.Hwnd)
        buttonDarkMode(FOLDERGUI.Hwnd)
    }
    
    MyGui.Show()
    ;below is what happens when you click on each button
    musicRun(button, *)
    {
        text := button.Text
        if text = "AIMP"
            Run(aimpPath)
        if text = "Foobar"
            {
                Run(foobarPath)
                text := "foobar2000"
            }
        if text = "WMP"
            {
                Run(wmpPath)
                text := "wmplayer"
            }
        if text = "VLC"
            Run(vlcPath)
        WinWait("ahk_exe " text ".exe")
        WinActivate("ahk_exe " text ".exe")
        MyGui.Destroy()
    }

    MUSICFOLDER(*) {
        musicDir := "S:\Program Files\User\Music\"
        if DirExist(musicDir)
            {
                Run(musicDir)
                WinWait("Music")
                WinActivate("Music")
            }
        else
            {
                scriptPath :=  A_LineFile ;this is taking the path given from A_LineFile
                scriptName := SplitPath(scriptPath, &name) ;and splitting it out into just the .ahk filename
                MsgBox("The requested music folder doesn't exist`n`nWritten dir: " musicDir "`nScript: " name "`nLine: " A_LineNumber-11)
            }
        MyGui.Destroy()
    }
}

/**
 * This function calls a GUI to showcase some useful hotkeys available to the user while running my scripts. This function is also called during firstCheck()
 */
hotkeysGUI() {
    if WinExist("Handy Hotkeys - Tomshi Scripts")
        return
    hotGUI := Gui("", "Handy Hotkeys - Tomshi Scripts")
	hotGUI.SetFont("S11")
	hotGUI.Opt("-Resize AlwaysOnTop")
	Title := hotGUI.Add("Text", "H30 X8 W300", "Handy Hotkeys!")
	Title.SetFont("S15")

    ;all hotkeys
    selection := hotGUI.Add("ListBox", "r10 Choose1", ["#F1", "#F2", "#+r", "#+^r", "#h", "#c", "#f", "#+``", "^+c", "CapsLock & c"])
    selection.OnEvent("Change", text)

    selectionText := hotGUI.Add("Text", "W240 X180 Y80 H100", "Pulls up the settings GUI window to adjust a few settings available to my scripts! This window can also be accessed by right clicking on ``My Scripts.ahk`` in the taskbar. Try it now!")
    text(*) {
        if selection.Value = 1
            {
                selectionText.Move(, 80, "240", "100")
                selectionText.Text := "Pulls up the settings GUI window to adjust a few settings available to my scripts! This window can also be accessed by right clicking on ``My Scripts.ahk`` in the taskbar. Try it now!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 2
            {
                selectionText.Move(, 80, "240", "100")
                selectionText.Text := "Pulls up an informational window regarding the currently active scripts, as well as a quick and easy way to close/open any of them. Try it now!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 3
            {
                selectionText.Move(, 60, "380", "220")
                selectionText.Text := "Will refresh all scripts! At anytime if you get stuck in a script press this hotkey to regain control.`n`n(note: refreshing will not stop scripts run separately ie. from a streamdeck as they are their own process and not included in the refresh hotkey).`nAlternatively you can also press ^!{del} (ctrl + alt + del) to access task manager, even if inputs are blocked"
                hotGUI.Move(,, "590", "297")
            }
        if selection.Value = 4
            {
                selectionText.Move(, 60, "380", "220")
                selectionText.Text := "Will rerun all active ahk scripts, effectively hard restarting them!. If at anytime a normal refresh isn't enough attempt this hotkey.`n`n(note: refreshing will not stop scripts run separately ie. from a streamdeck as they are their own process and not included in the refresh hotkey).`nAlternatively you can also press ^!{del} (ctrl + alt + del) to access task manager, even if inputs are blocked"
                hotGUI.Move(,, "590", "297")
            }
        if selection.Value = 5
            {
                selectionText.Move(, 100, "240", "100")
                selectionText.Text := "Will call this GUI so you can reference these hotkeys at any time!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 6
            {
                selectionText.Move(, 100, "240", "100")
                selectionText.Text := "Will center the current active window in the middle the active display, or move the window to your main display if activated again!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 7
            {
                selectionText.Move(, 100, "240", "100")
                selectionText.Text := "Will put the active window in fullscreen if it isn't already, or pull it out of fullscreen if it already is!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 8
            {
                selectionText.Move(, 80, "240", "100")
                selectionText.Text := "(That's : win > SHIFT > ``, not the actual + key)`nWill suspend the ``My Scripts.ahk`` script! - this is similar to using the ``#F2`` hotkey and unticking the same script!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 9
            {
                selectionText.Move(, 80, "240", "100")
                selectionText.Text := "(That's : win > SHIFT > c, not the actual + key)`nWill search google for whatever text you have highlighted!`nThis hotkey is set to not activate while Premiere Pro/After Effects is active!"
                hotGUI.Move(,, "450", "297")
            }
        if selection.Value = 10
            {
                selectionText.Move(, 100, "240", "100")
                selectionText.Text := "Will remove and then either capitilise or completely lowercase the highlighted text depending on which is less frequent!"
                hotGUI.Move(,, "450", "297")
            }
    }

    ;buttons
    ;remove the default
	noDefault := hotGUI.Add("Button", "X0 Y0 W0 H0", "")
    ;close button
	closeButton := hotGUI.Add("Button", "X8 Y220", "Close")
	closeButton.OnEvent("Click", close)
    ;what happens when you close the GUI
    hotGUI.OnEvent("Escape", close)
    hotGUI.OnEvent("Close", close)
    ;onEvent Functions
	close(*) {
		hotGUI.Destroy()
	}

    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "dark mode") = "true"
        goDark()
    goDark()
    {
        titleBarDarkMode(hotGUI.Hwnd)
        buttonDarkMode(closeButton.Hwnd)
        buttonDarkMode(noDefault.Hwnd)
    }
    
    ;Show the GUI
	hotGUI.Show("AutoSize")
}

/**
 * This function calls a GUI help guide the user on what to do now that they've gotten `My Scripts.ahk` to run. This function is called during firstCheck()
 */
todoGUI()
{
    if WinExist("What to Do - Tomshi Scripts")
        return
    todoGUI := Gui("", "What to Do - Tomshi Scripts")
	todoGUI.SetFont("S11")
	todoGUI.Opt("-Resize AlwaysOnTop")
	Title := todoGUI.Add("Text", "H30 X8 W300", "What to Do")
	Title.SetFont("S15")

    bodyText := todoGUI.Add("Text","X8 W550", "
    (
        1. Once you've saved these scripts wherever you wish (the default value is ``E:\Github\ahk\`` if you want all the directory information to just line up without any editing) but if you wish to use a custom directory, my scripts should automatically adjust these variables when you run ``My Scripts.ahk`` (so if you're reading this, your directory should be ``
    )" A_WorkingDir "
    (
        ``) but if you wish to do a sanity check, check the ``location :=`` variable in ``KSA.ahk`` and if it lines up with your directory everything should work as intended.
             // do note; some ``Streamdeck AHK`` scripts still have other hard coded dir's as they are intended for my workflow and may error out if you try to run them. //

        2. Take a look at ``Keyboard Shortcuts.ini`` to set your own keyboard shortcuts for programs as well as define coordinates for a few remaining ImageSearches that cannot use variables for various reasons. These ``KSA`` values are used to allow for easy adjustments instead of needing to dig through scripts!

        3. Feel free to edit any of these scripts to your liking, change any of the hotkeys, then run any of the .ahk files and enjoy!
            - If you don't have a secondary keyboard, don't forget to take a look through QMK Keyboard.ahk to see what functions you can pull out and put on other keys!

        - Scripts that will work with no tinkering include ->
        - Alt Menu acceleration disabler
        - autodismiss error
        - autosave.ahk
        - adobe fullscreen check.ahk
    )")
    closeButton := todoGUI.Add("Button", "X500 Y400", "Close")
    closeButton.OnEvent("Click", close)

    todoGUI.OnEvent("Escape", close)
    todoGUI.OnEvent("Close", close)
    close(*) {
        todoGUI.Destroy()
    }

    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "dark mode") = "true"
        goDark()
    goDark()
    {
        titleBarDarkMode(todoGUI.Hwnd)
        buttonDarkMode(closeButton.Hwnd)
    }
    todoGUI.Show()
}

/**
 * This functions pulls up a GUI that shows which of my scripts are active and allows the user to suspend/close them or unsuspend/open them
 */
activeScripts(MyRelease)
{
    detect()
    if WinExist("Tomshi Scripts Release " MyRelease)
        return
    detect()
    MyGui := Gui("", "Tomshi Scripts Release " MyRelease)
    MyGui.SetFont("S11")
    MyGui.Opt("-Resize AlwaysOnTop")
    ;nofocus
    ;add an invisible button since removing the default off all the others did nothing
    removedefault := MyGui.Add("Button", "Default X0 Y0 w0 h0", "_")
    ;active scripts
    text := MyGui.Add("Text", "X8 Y8 W300 H20", "Current active scripts are:")
    text.SetFont("S13")
    if A_IsSuspended = 0
        my := MyGui.Add("CheckBox", "Checked1", "My Scripts.ahk")
    else
        my := MyGui.Add("CheckBox", "Checked0", "My Scripts.ahk")
    SetTimer(checkMain, -100)
    checkMain(*)
    {
        if WinExist("My Scripts.ahk is Suspended")
            WinWaitClose("My Scripts.ahk is Suspended")
        if A_IsSuspended = 0
            my.Value := 1
        else
            my.Value := 0
        SetTimer(, -1000)
    }
    my.ToolTip := "Clicking this checkbox will toggle suspend the script"
    my.OnEvent("Click", myClick)
    if WinExist("Alt_menu_acceleration_DISABLER.ahk - AutoHotkey")
        alt := MyGui.Add("CheckBox", "Checked1", "Alt_menu_acceleration_DISABLER.ahk")
    else
        alt := MyGui.Add("CheckBox", "Checked0", "Alt_menu_acceleration_DISABLER.ahk")
    alt.ToolTip := "Clicking this checkbox will open/close the script"
    alt.OnEvent("Click", scriptClick)
    if WinExist("autodismiss error.ahk - AutoHotkey")
        autodis := MyGui.Add("CheckBox", "Checked1", "autodismiss error.ahk")
    else
        autodis := MyGui.Add("CheckBox", "Checked0", "autodismiss error.ahk")
    autodis.ToolTip := "Clicking this checkbox will open/close the script"
    autodis.OnEvent("Click", scriptClick)
    if WinExist("autosave.ahk - AutoHotkey")
        autosave := MyGui.Add("CheckBox", "Checked1", "autosave.ahk")
    else
        autosave := MyGui.Add("CheckBox", "Checked0", "autosave.ahk")
    autosave.ToolTip := "Clicking this checkbox will open/close the script. Reopening it will restart the autosave timer"
    autosave.OnEvent("Click", scriptClick)
    if WinExist("adobe fullscreen check.ahk - AutoHotkey")
        premFull := MyGui.Add("CheckBox", "Checked1", "adobe fullscreen check.ahk")
    else
        premFull := MyGui.Add("CheckBox", "Checked0", "adobe fullscreen check.ahk")
    premFull.ToolTip := "Clicking this checkbox will open/close the script"
    premFull.OnEvent("Click", scriptClick)
    if WinExist("gameCheck.ahk - AutoHotkey")
        gameCheck := MyGui.Add("CheckBox", "Checked1", "gameCheck.ahk")
    else
        gameCheck := MyGui.Add("CheckBox", "Checked0", "gameCheck.ahk")
    gameCheck.ToolTip := "Clicking this checkbox will open/close the script"
    gameCheck.OnEvent("Click", scriptClick)
    if WinExist("Multi-Instance Close.ahk - AutoHotkey")
        multiCheck := MyGui.Add("CheckBox", "Checked1", "Multi-Instance Close.ahk")
    else
        multiCheck := MyGui.Add("CheckBox", "Checked0", "Multi-Instance Close.ahk")
    multiCheck.ToolTip := "Clicking this checkbox will open/close the script"
    multiCheck.OnEvent("Click", scriptClick)
    if WinExist("QMK Keyboard.ahk - AutoHotkey")
        qmk := MyGui.Add("CheckBox", "Checked1", "QMK Keyboard.ahk")
    else
        qmk := MyGui.Add("CheckBox", "Checked0", "QMK Keyboard.ahk")
    qmk.ToolTip := "Clicking this checkbox will open/close the script"
    qmk.OnEvent("Click", scriptClick)
    if WinExist("Resolve_Example.ahk - AutoHotkey")
        resolve := MyGui.Add("CheckBox", "Checked1", "Resolve_Example.ahk")
    else
        resolve := MyGui.Add("CheckBox", "Checked0", "Resolve_Example.ahk")
    resolve.ToolTip := "Clicking this checkbox will open/close the script"
    resolve.OnEvent("Click", scriptClick)

    ;images
    myImage := MyGui.Add("Picture", "w20 h-1 X275 Y33", A_WorkingDir "\Support Files\Icons\myscript.png")
    altImage := MyGui.Add("Picture", "w20 h-1 X275 Y+5", A_WorkingDir "\Support Files\Icons\error.ico")
    autodisImage := MyGui.Add("Picture", "w20 h-1 X275 Y+2", A_WorkingDir "\Support Files\Icons\dismiss.ico")
    autosaveImage := MyGui.Add("Picture", "w20 h-1 X275 Y+5", A_WorkingDir "\Support Files\Icons\save.ico")
    premFullImage := MyGui.Add("Picture", "w20 h-1 X275 Y+5", A_WorkingDir "\Support Files\Icons\fullscreen.ico")
    gameImage := MyGui.Add("Picture", "w20 h-1 X275 Y+5", A_WorkingDir "\Support Files\Icons\game.png")
    multiImage := MyGui.Add("Picture", "w20 h-1 X275 Y+5", A_WorkingDir "\Support Files\Icons\M-I_C.png")
    qmkImage := MyGui.Add("Picture", "w20 h-1 X275 Y+5", A_WorkingDir "\Support Files\Icons\keyboard.ico")
    resolveImage := MyGui.Add("Picture", "w20 h-1 X275 Y+2", A_WorkingDir "\Support Files\Icons\resolve.png")

    ;close button
    closeButton := MyGui.Add("Button", "X245", "Close")
    closeButton.OnEvent("Click", escape)

    if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "dark mode") = "true"
        goDark()
    goDark()
    {
        titleBarDarkMode(MyGui.Hwnd)
        buttonDarkMode(closeButton.Hwnd)
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
    ;below is all of the callback functions
    myClick(*){
        myVal := my.Value
        if myVal = 1
            Suspend(-1)
        else
            Suspend(-1)
    }
    scriptClick(script, *) {
        detect()
        val := script.Value
        if val != 1
            {
                WinClose(script.text " - AutoHotkey")
                return
            }
        if script.text = "My Scripts.ahk" || script.text = "QMK Keyboard.ahk" || script.text = "Resolve_Example.ahk"
            Run(A_WorkingDir "\" script.text)
        else
            Run(A_WorkingDir "\Timer Scripts\" script.text)
    }

    MyGui.OnEvent("Escape", escape)
    escape(*) {
        SetTimer(checkMain, 0)
        MyGui.Destroy()
    }

    MyGui.Show("Center AutoSize")
}