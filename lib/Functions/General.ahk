global Discord := A_WorkingDir "\Support Files\ImageSearch\Discord\"
global Premiere := A_WorkingDir "\Support Files\ImageSearch\Premiere\"
global AE := A_WorkingDir "\Support Files\ImageSearch\AE\"
global Photoshop := A_WorkingDir "\Support Files\ImageSearch\Photoshop\"
global Resolve := A_WorkingDir "\Support Files\ImageSearch\Resolve\"
global VSCodeImage := A_WorkingDir "\Support Files\ImageSearch\VSCode\"
global Explorer := A_WorkingDir "\Support Files\ImageSearch\Windows\Win11\Explorer\"
global Firefox := A_WorkingDir "\Support Files\ImageSearch\Firefox\"

;define browsers
GroupAdd("Browsers", "ahk_exe firefox.exe")
GroupAdd("Browsers", "ahk_exe chrome.exe")
GroupAdd("Browsers", "ahk_exe Code.exe")

;define editors
GroupAdd("Editors", "ahk_exe Adobe Premiere Pro.exe")
GroupAdd("Editors", "ahk_exe AfterFX.exe")
GroupAdd("Editors", "ahk_exe Resolve.exe")
GroupAdd("Editors", "ahk_exe Photoshop.exe")

;\\v2.20
; ===========================================================================================================================================
;
;		Coordmode \\ Last updated: v2.20
;
; ===========================================================================================================================================
class coordinates {
    /**
     * This function is a part of the class `coordinates`
     * 
     * Sets coordmode to "screen"
     */
    s() => (coordmode("pixel", "screen"), coordmode("mouse", "screen"))

    /**
     * This function is a part of the class `coordinates`
     * 
     * Sets coordmode to "window"
     */
    w() => (coordmode("pixel", "window"), coordmode("mouse", "window"))
    
    /**
     * This function is a part of the class `coordinates`
     * 
     * sets coordmode to "caret"
     */
    c() => coordmode("caret", "window")
}
coord := coordinates()

; ===========================================================================================================================================
;
;		Tooltip \\ Last updated: v2.20
;
; ===========================================================================================================================================

class tooltips {
    /**
     * This function is a part of the class `tooltips`
     * 
     * Create a tooltip with any message. This tooltip will then follow the cursor and only redraw itself if the user has moved the cursor.
     * 
     * If you wish for the tooltip to plant next to the mouse and not follow the cursor, similar to a normal tooltip, that can be achieved with something along the lines of;
     * 
     * `tool.Cust(message,,, MouseGetPos(&x, &y) x + 15, y)`
     * @param {string} message is what you want the tooltip to say
     * @param {number} timeout is how many ms you want the tooltip to last. This value can be omitted and it will default to 1s
     * @param {boolean} find is whether you want this function to state "Couldn't find " at the beginning of it's tooltip. Simply add 1 (or true) for this variable if you do, or omit it if you don't
     * @param {number} xy the x & y coordinates you want the tooltip to appear. These values are unset by default and can be omitted
     * @param {integer} WhichToolTip omit this parameter if you don't need multiple tooltips to appear simultaneously. Otherwise, this is a number between 1 and 20 to indicate which tooltip window to operate upon. If unspecified, that number is 1 (the first).
     */
    Cust(message, timeout := 1000, find := false, x?, y?, WhichToolTip?)
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
     * This function is a part of the class `tooltips`
     * 
     * This function will check to see if any tooltips are active before continuing
     * @param {Integer} timeout allows you to pass in a time value (in seconds) that you want WinWaitClose to wait before timing out. This value can be omitted and does not need to be set
     */
    Wait(timeout?)
    {
        detectVal := A_DetectHiddenWindows
        DetectHiddenWindows(0) ;we need to ensure detecthiddenwindows is disabled before proceeding or this function may never stop waiting
        if WinExist("ahk_class tooltips_class32") 
            WinWaitClose("ahk_class tooltips_class32",, timeout?)
        DetectHiddenWindows(detectVal)
    }
}
tool := tooltips()

; ===========================================================================================================================================
;
;		Blockinput \\ Last updated: v2.20
;
; ===========================================================================================================================================
class inputs {
    /**
     * This function is a part of the class `inputs`
     * 
     * Blocks all user inputs [IF YOU GET STUCK IN A SCRIPT PRESS YOUR REFRESH HOTKEY (CTRL + R BY DEFAULT) OR USE CTRL + ALT + DEL to open task manager and close AHK]
     */
    On() => (BlockInput("SendAndMouse"), BlockInput("MouseMove"), BlockInput("On")) ;it has recently come to my attention that all 3 of these operate independantly and doing all 3 of them at once is no different to just using "BlockInput "on"" but uh. oops, too late now I guess

    /**
     * This function is a part of the class `inputs`
     * 
     * turns off the blocks on user input
     */
    Off() => (Blockinput("MouseMoveOff"), BlockInput("off"))
}
block := Inputs()

; ===========================================================================================================================================
;
;		Mouse Drag \\ Last updated: v2.12.3
;
; ===========================================================================================================================================
/**
 * press a button(ideally a mouse button), this script then changes to something similar to a "hand tool" and clicks so you can drag, then you set the hotkey for it to swap back to (selection tool for example)
 * @param {String} tool is the hotkey you want the program to swap TO (ie, hand tool, zoom tool, etc). (consider using values in KSA)
 * @param {String} toolorig is the button you want the script to press to bring you back to your tool of choice. (consider using values in KSA)
*/
mousedragNotPrem(tool, toolorig)
{
    click("middle") ;middle clicking helps bring focus to the timeline/workspace you're in, just incase
    SendInput tool "{LButton Down}"
    KeyWait(A_ThisHotkey)
    SendInput("{LButton Up}")
    SendInput toolorig
}

; ===========================================================================================================================================
;
;		better timeline movement \\ Last updated: v2.3.11
;
; ===========================================================================================================================================
/**
 * A weaker version of the right click premiere script. Set this to a button (mouse button ideally, or something obscure like ctrl + capslock)
 * @param {Integer} timeline in this function defines the y pixel value of the top bar in your video editor that allows you to click it to drag along the timeline
 * @param {Integer} x1 is the furthest left pixel value of the timeline that will work with your cursor warping up to grab it
 * @param {Integer} x2 is the furthest right pixel value of the timeline that will work with your cursor warping up to grab it
 * @param {Integer} y1 is just below the bar that your mouse will be warping to, this way your mouse doesn't try doing things when you're doing other stuff above the timeline
 */
timeline(timeline, x1, x2, y1)
{
    coord.w()
    MouseGetPos(&xpos, &ypos)
    if(xpos > x1 and xpos < x2) and (ypos > y1) ;this function will only trigger if your cursor is within the timeline. This ofcourse can break if you accidently move around your workspace
        {
            block.On()
            MouseMove(xpos, timeline) ;this will warp the mouse to the top part of your timeline defined by &timeline
            SendInput("{Click Down}")
            MouseMove(xpos, ypos)
            block.Off()
            KeyWait(A_ThisHotkey)
            SendInput("{Click Up}")
        }
    else
        return
}


; ===========================================================================================================================================
;
;		Error Log \\ Last updated: v2.17.2
;
; ===========================================================================================================================================
/**
 * A function designed to log errors in scripts if they occur
 * @param {String} func just type `A_ThisFunc "()"` if it's a function or `A_ThisHotkey "::"` if it's a hotkey
 * @param {String} error is what text you want logged to explain the error
 * @param {String} lineFile just type `A_LineFile`
 * @param {String} lineNumber just type `A_LineNumber`
 */
errorLog(func, error, lineFile, lineNumber)
{
    start := ""
    text := ""
    if not DirExist(A_WorkingDir "\Error Logs")
        DirCreate(A_WorkingDir "\Error Logs")
    if not FileExist(A_WorkingDir "\Error Logs\" A_YYYY "_" A_MM "_" A_DD "_ErrorLog.txt")
        {
            try {
                ;These values can be found at the following link (and the other appropriate tabs) - https://docs.microsoft.com/en-gb/windows/win32/cimwin32prov/win32-process
                For Process in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_Process")
                    OSNameResult := Process.OSName
                removePathPos := InStr(OSNameResult, "|",,, 1)
                if removePathPos != 0
                    OSName := SubStr(OSNameResult, 1, removePathPos - 1)
                else
                    OSName := OSNameResult
                For OperatingSystem in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_OperatingSystem")
                    OSArch := OperatingSystem.OSArchitecture
                For Processor in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_Processor")
                    CPU := Processor.Name
                For ComputerSystem in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_ComputerSystem")
                    Logical := ComputerSystem.NumberOfLogicalProcessors
                For ComputerSystem in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_ComputerSystem")
                    Response := ComputerSystem.TotalPhysicalMemory / "1073741824"
                For OperatingSystem in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_OperatingSystem")
                    Response2 := OperatingSystem.FreePhysicalMemory / "1048576"
                Memory := Round(Response, 2)
                FreePhysMem := Round(Response2, 2)
                InstalledVersion := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "version")
                LatestReleaseBeta := getScriptRelease(True)
                LatestReleaseMain := getScriptRelease()
                if LatestReleaseBeta = LatestReleaseMain
                    LatestReleaseBeta := ""
                time := A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec "." A_MSec
                start := "\\ ErrorLogs`n\\ AutoHotkey v" A_AhkVersion "`n\\ Tomshi's Scripts" "`n`t\\ Installed Version - " InstalledVersion "`n`t\\ Latest Version Released`n`t`t\\ main - " LatestReleaseMain "`n`t`t\\ beta - " LatestReleaseBeta "`n\\ OS`n`t\\ " OSName "`n`t\\ " A_OSVersion "`n`t\\ " OSArch "`n\\ CPU`n`t\\ " CPU "`n`t\\ Logical Processors - " Logical "`n\\ RAM`n`t\\ Total Physical Memory - " Memory "GB`n`t\\ Free Physical Memory - " FreePhysMem "GB`n\\ Current DateTime - " time "`n\\ Ahk Install Path - " A_AhkPath "`n`n"
            }
        }
    scriptPath :=  lineFile ;this is taking the path given from A_LineFile
    scriptName := SplitPath(scriptPath, &name) ;and splitting it out into just the .ahk filename
    FileAppend(start A_Hour ":" A_Min ":" A_Sec "." A_MSec " // ``" func "`` encountered the following error: " '"' error '"' " // Script: ``" name "``, Line Number: " lineNumber "`n", A_WorkingDir "\Error Logs\" A_YYYY "_" A_MM "_" A_DD "_ErrorLog.txt")
}

; ===========================================================================================================================================
;
;		Other \\ Last updated: v2.17.3
;
; ===========================================================================================================================================
/**
 * This function will return the name of the first & second hotkeys pressed when two are required for a macro to fire. If the hotkey used with this function is only 2 characters long, it will assign each of those to &first & &second respectively. If one of those characters is a special key (ie. ! or ^) it will return the virtual key so `KeyWait` will still work as expected
 * @param {var} first is the variable that will be filled with the first activation hotkey. Must be written as `&var`
 * @param {var} second is the variable that will be filled with the second activation hotkey. Must be written as `&var`
*/
getHotkeys(&first, &second)
{
   getHotkey := A_ThisHotkey
   length := StrLen(getHotkey)
   if length = 2
	{
		first := SubStr(getHotkey, 1, 1)
		second := SubStr(getHotkey, 2, 1)
		vk(variable)
		{
			if variable = "#" || variable = "!" || variable = "^" || variable = "+" || variable = "<^>!"
				{
					if variable = "#"
						variable := "Win"
					if variable = "!"
						variable := "Alt"
					if variable = "^"
						variable := "Ctrl"
					if variable = "+"
						variable := "Shift"
					if variable = "<^>!"
						variable := "AltGr"
					check := GetKeyVK(variable)
					vkReturn := Format("vk{:X}", check)
					return vkReturn
				}
			else
				return
		}
		check1 := vk(first)
		check2 := vk(second)
		if check1 != ""
			first := check1
		if check2 != ""
			second := check2
		return
	}
   andValue := InStr(getHotkey, "&",, 1, 1)
   first := SubStr(getHotkey, 1, length - (length - andValue) - 2)
   second := SubStr(getHotkey, andValue + 2, length - andValue + 2)
   return
}

/**
 * `Floor()` is a built in math function of ahk to round down to the nearest integer, but when you want a decimal place to round down, you don't really have that many options. This function will allow us to round down after a certain amount of decimal places. <https://www.autohotkey.com/board/topic/50826-solved-round-down-a-number-with-2-digits/>
 * @param {Integer} num is the number you want this function to evaluate
 * @param {Integer} dec is the amount of decimal places you wish the function to evaluate to
 */
floorDecimal(num,dec) => RegExReplace(num,"(?<=\.\d{" dec "}).*$")

/**
 * A function to loop through and hard reset all active ahk scripts
 */
hardReset()
{
    detect()

    tool.Cust("All active ahk scripts are being rerun")
    value := WinGetList("ahk_class AutoHotkey")
    for this_value in value
        {
            name := WinGettitle(this_value)
            path := SubStr(name, 1, InStr(name, " -",,, 1) -1)
            SplitPath(path, &ScriptName)
            if ScriptName = "checklist.ahk" || ScriptName = "My Scripts.ahk" || ScriptName = "launcher.ahk"
                continue
            Run(path)
        }
    tool.Wait()
    Run(A_ScriptFullPath) ;run this current script last so all of the rest actually happen
}

/**
 * A function to cut repeat code and set some values required to detect ahk scripts
 * @param {Integer} windows is what hidden window mode you wish for the script to take. This value `defaults to true`
 * @param {Integer} title is what title match mode you wish for the script to take. This value `defaults to 2`
 */
detect(windows := true, title := 2) => (DetectHiddenWindows(windows), SetTitleMatchMode(title))