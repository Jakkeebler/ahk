﻿#Include SD_functions.ahk
if not WinExist("ahk_exe obs64.exe")
	{
		Run '*RunAs "C:\Program Files\ahk\ahk\Stream\Streaming.ahk"'
		Run "C:\Program Files\Chatterino\chatterino.exe"
		MsgBox("have you opened the goxlr stuff yet bud")
		Run "C:\Program Files\ahk\ahk\shortcuts\obs64.lnk" ;opening shortcuts helps to make sure obs and ahk have the same admin level so ahk can interact with it, otherwise obs wont accept inputs
		WinWaitActive("ahk_exe obs64.exe") ;waits until obs is open then brings it into focus. obs live fucked up their integration so you have to physically click on obs live before you can input alt commands. Thanks obs live
		WinMove 2553, -926, 1104, 1087
		sleep 3000 ;waits a little bit once obs has opened so it doesn't crash
		coords()
		MouseGetPos &xposP, &yposP
		blockOn()
		WinActivate("ahk_exe obs64.exe")
		SendInput "{Click}!p" ;I have to physically click on streamelements obs before it will accept any inputs, I have no idea why, this didn't happen originally but started happening in obs 27
		sleep 200 ;either these sleeps are necessary, or every SendInput needs to be on a separate line, obs can't take inputs that fast and breaks
		SendInput "{DOWN 6}"
		sleep 200
		SendInput "{ENTER}"
		coords()
		blockOff()
		if WinExist("ahk_exe chatterino.exe")
			{
				WinMove(2559, 152, 662, 772)
				WinActivate("ahk_exe chatterino.exe")
				coordw()
				WinGetPos(,, &width, &height, "A")
				if ImageSearch(&xpos, &ypos, 0, 0, %&width%, %&height%/ "3", "*2 " Chatterino "botshiactive.png")
					{
						;toolCust("it thinks it's active", "1000") ;debugging
						coords()
						MouseMove(%&xposP%, %&yposP%)
						return
					}
				else 
					if ImageSearch(&xpos, &ypos, 0, 0, %&width%, %&height%/ "3", "*2 " Chatterino "botshinotactive.png")
					{
						;toolCust("it thinks it's not active", "1000") ;debugging
						MouseMove(%&xpos%, %&ypos%)
						SendInput("{Click}")
						coords()
						MouseMove(%&xposP%, %&yposP%)
						return
					}
			}
	}
ExitApp