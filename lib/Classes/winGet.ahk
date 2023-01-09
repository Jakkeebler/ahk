/************************************************************************
 * @description A class to contain a library of functions that interact with windows and gain information.
 * @author tomshi
 * @date 2023/01/09
 * @version 1.4.0
 ***********************************************************************/

; { \\ #Includes
#Include <Classes\ptf>
#Include <Classes\tool>
#Include <Classes\block>
#Include <Classes\coord>
#Include <Functions\errorLog>
; }

class WinGet {
    /**
     * This function is a helper function for a few other functions down below and removes repeat code
     * It compares the coordinates passed into it, to the coordinates of all monitors connected to the system
     * If the passed in coordinates are within one of the monitor coordinates, this function will return the monitor number as well as the monitor coordinates that the original coordinates are within
     */
    Monitor(x, y)
    {
        numberofMonitors := SysGet(80)
        static attempt := 0
        loop numberofMonitors {
            try {
                MonitorGet(A_Index, &left, &Top, &Right, &Bottom)
                if x > left && x < Right
                    {
                        if y < Bottom && y > Top
                            ;MsgBox(x " " y "`n" left " " Right " " Bottom " " Top "`nwithin monitor " A_Index)
                            return {monitor: A_Index, left: left, right: right, top: top, bottom: bottom}
                    }
            }
        }
    }

    /**
     * This function will grab the monitor that the active window is currently within and return it as well as coordinate information in the form of a function object.
     *
     * *If a window is overlapping multiple monitors, this function may attempt to fullscreen the window first to get the correct monitor.*
     * @param {String} title? allows you to pass a custom winTitle into the function instead of using the currently active window
     * @return {Object}
     * ```
     * window := winget.WinMonitor()
     * window.monitor      ;// returns monitor the window is within
     * window.left         ;// returns left x position
     * window.right        ;// returns right x position
     * window.top          ;// returns top y position
     * window.bottom       ;// returns bottom y position
     * ```
     */
    static WinMonitor(title?)
    {
        if !IsSet(title)
            this.Title(&title)
        tryagain:
        WinGetPos(&x ,&y,,, title,, "Editing Checklist -")
        ;// sometimes windows when fullscreened will be at -8, -8 and not 0, 0
		;// so we just add 10 pixels to both variables to ensure we're in the correct monitor
        monObj := WinGet().Monitor(x + 10, y + 10)
        if !IsObject(monObj) {
            ;// if the window is overlapping multiple monitors, fullscreen it first then try again so it is only on the one monitor
            if !winget.isFullscreen(&testWin, title)
                {
                    WinMaximize(title,, "Editing Checklist -")
                    goto tryagain
                }
        }
        return {monitor: monObj.monitor, left: monObj.left, right: monObj.right, top:monObj.top, bottom: monObj.bottom}
    }

    /**
     * This function will grab the monitor that the mouse is currently within and return it as well as coordinate information in the form of a function object.
     * @param {Integer} x allows you to pass a custom x coordinate
     * @param {Integer} y allows you to pass a custom y coordinate
     *
     * *Both `x` & `y` have to be passed to the function to test a coordinate, otherwise the function will use the current mouse coordinates*
     * @return {Object}
     * ```
     * ;mouse is within monitor 1 (2560x1440)
     * monitor := winget.MouseMonitor()
     * monitor.monitor      ;// returns 1
     * monitor.left         ;// returns 0
     * monitor.right        ;// returns 2560
     * monitor.top          ;// returns 0
     * monitor.bottom       ;// returns 1440
     * ```
     * @returns {Object} containing the monitor number, the left/right/top/bottom pixel coordinate
     */
    static MouseMonitor(x?, y?)
    {
        if !IsSet(x?) || !IsSet(y?) {
            coord.s()
            MouseGetPos(&x, &y)
        }
        monObj := WinGet().Monitor(x, y)
        if !IsObject(monObj)
            {
                errorLog(TargetError("Failed to get the requested monitor", -1),, 1)
                Exit()
            }
        return {monitor: monObj.monitor, left: monObj.left, right: monObj.right, top:monObj.top, bottom: monObj.bottom}
    }


    /**
     * This function gets and returns the title for the current active window, autopopulating the `title` variable
     * @param {VarRef} title populates with the active window
     */
    static Title(&title?)
    {
        try {
            check := WinGetProcessName("A")
            ignore := (check = "AutoHotkey64.exe") ? WinGetTitle(check) : ""
            title := WinGetTitle("A",, ignore)
            if !IsSet(title) || title = "" || title = "Program Manager"
                throw
            return title
        } catch {
            errorLog(UnsetError("Couldn't determine the active window or you're attempting to interact with an ahk GUI", -1),, 1)
            block.Off()
            Exit()
        }
    }

    /**
     * This function is designed to check what state the active window is in. If the window is maximised it will return 1, else it will return 0. It will also populate the `title` variable with the current active window
     * @param {VarRef} title is the active window, this function will populate the `title` variable with the active window
     * @param {String} window is if you wish to provide the function with the window instead of relying it to try and find it based off the active window, this paramater can be omitted
     */
    static isFullscreen(&title?, window := false)
    {
        title := (window != false) ? window : this.Title(&title)
        if title = "Program Manager" ;this is the desktop. You don't want the desktop trying to get fullscreened unless you want to replicate the classic windows xp lagscreen
            title := ""
        try {
            return WinGetMinMax(title,, "Editing Checklist -") ;a return value of 1 means it is maximised
        } catch {
            errorLog(UnsetError("Couldn't determine the active window or you're attempting to interact with an ahk GUI", -1),, 1)
            block.Off()
            Exit()
        }
    }

    /**
     * This function will grab the title of premiere if it exists and check to see if a save is necessary
     * @param {VarRef} premCheck is the complete title of premiere
     * @param {VarRef} titleCheck is checking to see if the premiere window is available to save based off what's found in the current title. Will return unset if premiere cannot be found or a boolean false if unavailable to save. Otherwise it will contain a number greater than 0
     * @param {VarRef} saveCheck is checking for an * in the title to say a save is necessary. Will return unset if premiere cannot be found or a boolean false if save is not required. Otherwise it will return boolean true
     * @returns {Object}
     * ```
     * prem := winget.PremName()
     * prem.winTitle        ;// is the current title of the open premiere window
     * prem.titleCheck      ;// a boolean value of if the window is available to save
     * prem.saveCheck       ;// a boolean value of if a save is currently necessary
     * ```
     */
    static PremName(&premCheck?, &titleCheck?, &saveCheck?)
    {
        try {
            if !WinExist(editors.Premiere.winTitle)
                return {winTitle: false, titleCheck: unset, saveCheck: unset}
            premCheck := WinGetTitle(editors.Premiere.class)
            if premCheck = ""
                premCheck := WinGetTitle(editors.Premiere.winTitle)
            titleCheck := InStr(premCheck, "Adobe Premiere Pro 20" ptf.PremYearVer " -") ;we add the " -" to accomodate a window that is literally just called "Adobe Premiere Pro [Year]"
            saveCheck := (SubStr(premCheck, -1, 1) = "*") ? true : false
            return {winTitle: premCheck, titleCheck: true, saveCheck: saveCheck}
        } catch as e {
            block.Off()
            tool.Cust("Couldn't determine the titles of Adobe programs")
            errorLog(e)
            return {winTitle: false, titleCheck: unset, saveCheck: unset}
        }
    }

    /**
     * This function will grab the title of after effects if it exists and check to see if a save is necessary
     * @param {VarRef} aeCheck is the complete title of after effects
     * @param {VarRef} titleCheck is checking to see if the after effects window is available to save based off what's found in the current title. Will return unset if after effects cannot be found or a boolean false if unavailable to save. Otherwise it will contain a number greater than 0
     * @param {VarRef} saveCheck is checking for an * in the title to say a save is necessary.  Will return unset if after effects cannot be found or a boolean false if save is not required. Otherwise it will return boolean true
     * @returns {Object}
     * ```
     * ae := winget.AEName()
     * ae.winTitle        ;// is the current title of the open ae window
     * ae.titleCheck      ;// a boolean value of if the window is available to save
     * ae.saveCheck       ;// a boolean value of if a save is currently necessary
     * ```
     */
    static AEName(&aeCheck?, &titleCheck?, &saveCheck?)
    {
        try {
            if !WinExist(editors.AE.winTitle)
                return {winTitle: false, titleCheck: unset, saveCheck: unset}
            aeCheck := WinGetTitle(editors.AE.winTitle)
            titleCheck := InStr(aeCheck, "Adobe After Effects 20" ptf.AEYearVer " -") ;we add the " -" to accomodate a window that is literally just called "Adobe After Effects [Year]"
            saveCheck := (SubStr(aeCheck, -1, 1) = "*") ? true : false
            return {winTitle: aeCheck, titleCheck: true, saveCheck: saveCheck}
        } catch as e {
            block.Off()
            tool.Cust("Couldn't determine the titles of Adobe programs")
            errorLog(e)
            return {winTitle: false, titleCheck: unset, saveCheck: unset}
        }
    }

    /**
     * This function is designed to retrieve the name of the client using some string manipulation of the dir path within Premiere's title. It uses `ptf.comms` as the "root" dir and expects the next folder in the path to be the client name.
     * @return {String} The clients name
     */
    static ProjClient()
    {
        ;// if the user doesn't have either editors active
        if !WinExist(editors.Premiere.winTitle) && !WinExist(editors.AE.winTitle) {
                errorLog(TargetError("Couldn't determine an editor window", -1),, 1)
                return false
            }
        ;// if PremName fails to grab the title
        if !this.PremName(&premCheck, &titleCheck) && !this.AEName(&aeCheck) {
                errorLog(TargetError("Unable to determine the client as the title is unable to be obtained", -1),, 1)
                return false
            }
        path := IsSet(premCheck) ? obj.SplitPath(premCheck) : obj.SplitPath(aeCheck)
        ;// if the comms folder isn't in the title path
        if !InStr(path.dir, ptf.comms) {
                errorLog(UnsetError("``ptf.comms`` folder not found in Premiere title", -1, path.dir),, 1)
                return false
            }
        return ClientName := SubStr(
            premCheck,                                                      ;// string
            start := (InStr(premCheck, ptf.comms) + StrLen(ptf.comms) + 1), ;// starting pos
            InStr(premCheck, "\",, start, 1) - start                        ;// length
        )
    }

    /**
     * This function will grab the proccess ID of the current active window
     * @param {VarRef} id is the processname of the active window, we want to pass this value back to the script
     */
    static ID(&id)
    {
        try {
            id := WinGetProcessName("A")
            if WinActive("ahk_exe explorer.exe")
                id := "ahk_class CabinetWClass"
            return true
        } catch as e {
            tool.Cust("couldn't grab active window")
            errorLog(e)
            return false
        }
    }

    /**
     * A function that returns the path of an open explorer window
     *
     * Original code found here by svArtist: https://www.autohotkey.com/boards/viewtopic.php?p=422751#p387113
     * @param {Integer} hwnd You can pass in the hwnd of the window you wish to focus, else this parameter can be omitted and it will use the active window
     * @returns {String} the directory path of the explorer window
     */
    static ExplorerPath(hwnd := 0)
    {
        if(hwnd==0){
            explorerHwnd := WinActive("ahk_class CabinetWClass")
            if(explorerHwnd==0)
                explorerHwnd := WinExist("ahk_class CabinetWClass")
        }
        else
            explorerHwnd := WinExist("ahk_class CabinetWClass ahk_id " . hwnd)

        if (explorerHwnd){
            for window in ComObject("Shell.Application").Windows{
                try{
                    if (window && window.hwnd && window.hwnd==explorerHwnd)
                        return window.Document.Folder.Self.Path
                }
            }
        }
        return false
    }

    /**
     * A function to return the size of a path in `bytes` by default.
     * Code from: `DepthTrawler` : https://discord.com/channels/115993023636176902/734109033832906874/1053085736196382771 (ahk discord)
     *
     * @param {String} path is the filepath you wish to check
     * @param {Integer} option decides if you wish for the return value to be something other than `bytes`.
     *
     * `1`: returns `MB`
     *
     * `2`: returns `GB`
     *
     * `3`: returns `TB`
     * @returns {Integer} the filesize in `bytes` by default or in the option selected
     */
    static FolderSize(path, option?) {
        if !IsSet(option)
            return ComObject("Scripting.FileSystemObject").GetFolder(path).Size
        if option > 3
            {
                ;// throw
                errorLog(ValueError("Parameter #2 invalid - Value Too High", -1, option),,, 1)
            }
        ;// you convert bytes to another unit by x / (1024^y)
        ;// ie. bytes => MB ; x / (1024x1024x1024) OR x / 1024^2
        return (ComObject("Scripting.FileSystemObject").GetFolder(path).Size)/(1024**(option+1))
    }
}