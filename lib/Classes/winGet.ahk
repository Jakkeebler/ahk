/************************************************************************
 * @description A class to contain a library of functions that interact with windows and gain information.
 * @author tomshi
 * @date 2022/12/20
 * @version 1.0.5
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
     * This function will grab the monitor that the mouse is currently within and return it as well as coordinate information in the form of a function object. ie if your mouse is within monitor 1 having code `monitor := getMouseMonitor()` would make `monitor.monitor` = 1
     * @returns {object} containing the monitor number, the left/right/top/bottom pixel coordinate
     */
    static MouseMonitor()
    {
        coord.s()
        MouseGetPos(&x, &y)
        numberofMonitors := SysGet(80)
        loop numberofMonitors {
            try {
                MonitorGet(A_Index, &left, &Top, &Right, &Bottom)
                if x > left && x < Right
                    {
                        if y < Bottom && y > Top
                            ;MsgBox(x " " y "`n" left " " Right " " Bottom " " Top "`nwithin monitor " A_Index)
                            return {monitor: A_Index, left: left, right: right, top: top, bottom: bottom}
                    }
                if A_Index >= numberofMonitors
                    throw TargetError("Couldn't find the monitor", A_ThisFunc "()")
            }
            catch TargetError as e {
                block.Off() ;to stop the user potentially getting stuck
                tool.Cust(A_ThisFunc "() failed to get the monitor that the mouse is within", 2.0)
                errorLog(e, A_ThisFunc "()")
                Exit()
            }
        }
    }

    /**
     * This function gets and returns the title for the current active window, autopopulating the `title` variable
     * @param {VarRef} title populates with the active window
     */
    static Title(&title?)
    {
        try {
            check := WinGetProcessName("A")
            if check = "AutoHotkey64.exe"
                ignore := WinGetTitle(check)
            else
                ignore := ""
            title := WinGetTitle("A",, ignore)
            if !IsSet(title) || title = "" || title = "Program Manager"
                throw Error e
            return title
        } catch as e {
            tool.Cust(A_ThisFunc "() couldn't determine the active window or you're attempting to interact with an ahk GUI")
            errorLog(e, A_ThisFunc "()")
            block.Off()
            Exit()
        }
    }

    /**
     * This function is designed to check what state the active window is in. If the window is maximised it will return 1, else it will return 0. It will also populate the `title` variable with the current active window
     * @param {var} title is the active window, this function will populate the `title` variable with the active window
     * @param {String} window is if you wish to provide the function with the window instead of relying it to try and find it based off the active window, this paramater can be omitted
     */
    static isFullscreen(&title?, window := false)
    {
        if window != false
            {
                title := window
                goto skip
            }
        this.Title(&title)
        skip:
        if title = "Program Manager" ;this is the desktop. You don't want the desktop trying to get fullscreened unless you want to replicate the classic windows xp lagscreen
            title := ""
        try {
            return WinGetMinMax(title,, "Editing Checklist -") ;a return value of 1 means it is maximised
        } catch as e {
            tool.Cust(A_ThisFunc "() couldn't determine the active window")
            errorLog(e, A_ThisFunc "()")
            block.Off()
            Exit
        }
    }

    /**
     * This function will grab the title of premiere if it exists and check to see if a save is necessary
     * @param {var} premCheck is the title of premiere, we want to pass this value back to the script
     * @param {var} titleCheck is checking to see if the premiere window is available to save, we want to pass this value back to the script
     * @param {var} saveCheck is checking for an * in the title to say a save is necessary, we want to pass this value back to the script
     */
    static PremName(&premCheck, &titleCheck?, &saveCheck?)
    {
        try {
            if !WinExist(editors.Premiere.winTitle)
                {
                    premCheck := false
                    titleCheck := ""
                    saveCheck := ""
                    return false
                }
            premCheck := WinGetTitle(editors.Premiere.class)
            if premCheck = ""
                premCheck := WinGetTitle(editors.Premiere.winTitle)
            titleCheck := InStr(premCheck, "Adobe Premiere Pro " ptf.PremYear " -") ;change this year value to your own year. | we add the " -" to accomodate a window that is literally just called "Adobe Premiere Pro [Year]"
            saveCheck := SubStr(premCheck, -1, 1) ;this variable will contain "*" if a save is required
            return true
        } catch as e {
            block.Off()
            tool.Cust("Couldn't determine the titles of Adobe programs")
            errorLog(e, A_ThisFunc "()")
            return false
        }
    }

    /**
     * This function will grab the title of after effects if it exists and check to see if a save is necessary
     * @param {var} aeCheck is the title of after effects, we want to pass this value back to the script
     * @param {var} aeSaveCheck is checking for an * in the title to say a save is necessary, we want to pass this value back to the script
     */
    static AEName(&aeCheck, &aeSaveCheck?)
    {
        try {
            if !WinExist(editors.AE.winTitle)
                {
                    aeCheck := false
                    aeSaveCheck := ""
                    return false
                }
            aeCheck := WinGetTitle(editors.AE.winTitle)
            aeSaveCheck := SubStr(aeCheck, -1, 1) ;this variable will contain "*" if a save is required
            return true
        } catch as e {
            block.Off()
            tool.Cust("Couldn't determine the titles of Adobe programs")
            errorLog(e, A_ThisFunc "()")
            return false
        }
    }

    /**
     * This function is designed to retrieve the name of the client using some string manipulation of the dir path within Premiere's title. It uses `ptf.comms` as the "root" dir and expects the next folder in the path to be the client name.
     * @return {String} The clients name
     */
    static ProjClient()
    {
        /**
         * cutting repeat code
         */
        err(Err) {
            tool.Cust(Err, 2.0)
            errorLog(, A_ThisFunc "()", Err, A_LineFile, A_LineNumber)
        }
        ;// if the user doesn't have either editors active
        if !WinActive(editors.Premiere.winTitle) && !WinActive(editors.AE.winTitle) {
                err("editors aren't active")
                return false
            }
        ;// if PremName fails to grab the title
        if !this.PremName(&premCheck, &titleCheck) {
                err("Unable to perform action as title is unable to be obtained")
                return false
            }
        path := SplitPathObj(premCheck)
        ;// if the comms folder isn't in the title path
        if !InStr(path.dir, ptf.comms) {
                err("``ptf.comms`` folder not found in Premiere title")
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
     * @param {var} id is the processname of the active window, we want to pass this value back to the script
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
            errorLog(e, A_ThisFunc "()")
            return false
        }
    }

    /**
     * A function that returns the path of an open explorer window
     *
     * Original code found here by svArtist: https://www.autohotkey.com/boards/viewtopic.php?p=422751#p387113
     * @param {number} hwnd You can pass in the hwnd of the window you wish to focus, else this parameter can be omitted and it will use the active window
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
     * A function to return the size of a path in `bytes`.
     * Code from: `DepthTrawler` : https://discord.com/channels/115993023636176902/734109033832906874/1053085736196382771 (ahk discord)
     *
     * @param {String} path is the filepath you wish to check
     * @returns {Integer} the filesize in `bytes`
     */
    static FolderSize(path) {
        return ComObject("Scripting.FileSystemObject").GetFolder(path).Size
    }
}