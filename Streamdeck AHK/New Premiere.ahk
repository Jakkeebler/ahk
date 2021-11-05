#SingleInstance Force
SetWorkingDir A_ScriptDir
SetDefaultMouseSpeed 0

EnvSet("Premiere", "C:\Program Files\ahk\ahk\ImageSearch\Premiere\")
#Include SD_functions.ahk

If WinActive("ahk_exe Adobe Premiere Pro.exe")
    {
        ;; This part makes you select the folder you wish to create the project in
        SelectedFolder := DirSelect("*E:\", 3, "Create your desired folder then select it.")
        if SelectedFolder = ""
            return
        DirCreate(SelectedFolder "\proxies") ;creates the proxy folder we'll need later
        DirCreate(SelectedFolder "\renders\draft") ;creates a folder to render drafts into
        DirCreate(SelectedFolder "\renders\final") ;creates a folder to render the final into

        WinActivate("ahk_exe Adobe Premiere Pro.exe")
        coordw()
        blockOn()
        if ImageSearch(&x, &y, 0, 0, 629, 348, "*2 " EnvGet("Premiere") "newProj.png")
            {
                Click(%&x%, %&y%)
                WinWait("New Project")
                blockOff()
                IB := InputBox("Enter the name of your project", "Project", "w100 h100")
                    if IB.Result = "Cancel"
                        return
                ;blockOn()
                WinActivate("ahk_exe Adobe Premiere Pro.exe")
                SendInput(IB.Value) ;INSERT PROJECT NAME HERE
                SendInput("{Tab 2}" "{Enter}")
                WinWait("Please select the destination path for your new project.")
                sleep 500
                SendInput("{F4}")
                sleep 300
                SendInput("^a{Del}" SelectedFolder) ;SEND PATH HERE
                SendInput("{Enter}")
                sleep 250
                SendInput("+{Tab 5}")
                sleep 500
                SendInput("{Enter}")
                sleep 1000
                if ImageSearch(&xin, &yin, 0, 0, 629, 348, "*2 " EnvGet("Premiere") "ingest.png")
                    {
                        Click(%&xin%, %&yin%)
                        sleep 500
                        SendInput("{Tab 6}" "{Space}")
                        sleep 1000
                        SendInput("{Tab}" "{Space}" "{Down 2}" "{Space}")
                        sleep 1000
                        SendInput("{Tab}" "{Space}")
                        sleep 300
                        SendInput("{Up 5}" "{Space}")
                        sleep 300
                        SendInput("{Tab 2}" "{Space}")
                        sleep 300
                        SendInput("{Up}" "{Space}")
                        WinWait("Select Folder")
                        sleep 800
                        SendInput("{F4}")
                        sleep 800
                        SendInput("^a{Del}" SelectedFolder "\proxies") ;INSERT PATH AND PROXIES HERE
                        sleep 800
                        SendInput("{Enter}")
                        sleep 250
                        SendInput("+{Tab 5}")
                        sleep 250
                        SendInput("{Enter}")
                        sleep 2000
                        SendInput("{Tab}" "{Space}")
                        sleep 1000
                        blockOff()
                        Run(SelectedFolder) ;open an explorer window for your selected directory
                        return
                    }
                else
                    {
                        blockOff()
                        toolFind("the ingest tab", "1000")
                        return
                    }
            }
        else
            {
                blockOff()
                toolFind("the new project button", "1000")
                return
            }
    }