SetWorkingDir(A_ScriptDir)

if !DirExist(A_MyDocuments "\AutoHotkey")
    DirCreate(A_MyDocuments "\AutoHotkey")

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

path := '"' A_ScriptDir "\..\..\Lib" '"'

cmdLine := 'mklink /D "' A_MyDocuments '\AutoHotkey\Lib" ' path '"'
;final command should look like;
; mklink /D "mydocumentspathhere\AutoHotkey\Lib" "rootrepopath\lib"

if DirExist(A_MyDocuments "\AutoHotkey\Lib")
    {
        SetTimer(change_buttonNames, 15)
        change_buttonNames() {
            if !WinExist("Backup lib files")
                return
            SetTimer(, 0)
            WinActivate("Backup lib files")
            ControlSetText "&Continue", "Button1"
        }
        warn := MsgBox("This script will delete your entire lib folder found here:`n" A_MyDocuments "\AutoHotkey\Lib`n`nIf you use files other than mine, please back them up before continuing or they will be lost.", "Backup lib files", "1 48 256 4096")
        if warn = "Cancel"
            return
        DirDelete(A_MyDocuments "\AutoHotkey\Lib", 1)
    }

Run('*RunAs ' A_ComSpec)
WinWaitActive("ahk_exe cmd.exe")
sleep 1000
SendInput(cmdLine)
SendInput("{Enter}")
sleep 500
WinClose("ahk_exe cmd.exe")