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

;\\v2.16.11

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
		}
	UPDATE := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check", "true")
	FC := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "first check", "false")
	ADOBE := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "adobe temp", "")
	WORK := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir", "E:\Github\ahk")
	TOOL := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "tooltip", "true")
	ADOBE_GB := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe GB", 45)
	ADOBE_FS := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe FS", 5)
	deleteOld(&ADOBE, &WORK, &UPDATE, &FC, &TOOL) ;deletes any of the old files I used to track information
	if FileExist(A_MyDocuments "\tomshi\settings.ini")
		FileDelete(A_MyDocuments "\tomshi\settings.ini") ;if the user is on a newer release version, we automatically replace the settings file with their previous information/any new information defaults
	FileAppend("[Settings]`nupdate check=" UPDATE "`ntooltip=" TOOL "`nadobe GB=" ADOBE_GB "`nadobe FS=" ADOBE_FS "`n`n[Track]`nadobe temp=" ADOBE "`nworking dir=" WORK "`nfirst check=" FC "`nversion=" MyRelease, A_MyDocuments "\tomshi\settings.ini")
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
	try {
		main := ComObject("WinHttp.WinHttpRequest.5.1")
		main.Open("GET", "https://raw.githubusercontent.com/Tomshiii/ahk/dev/My%20Scripts.ahk")
		main.Send()
		main.WaitForResponse()
		string := main.ResponseText
	} catch as e {
		toolCust("Couldn't get version info`nYou may not be connected to the internet")
		errorLog(A_ThisFunc "()", "Couldn't get version info, you may not be connected to the internet", A_LineFile, A_LineNumber)
		return
	}
	foundpos := InStr(string, 'v',,,2)
	endpos := InStr(string, '"', , foundpos, 1)
	end := endpos - foundpos
	global version := SubStr(string, foundpos, end)
	toolCust("Current " A_ScriptName " Version = " MyRelease "`nCurrent Github Release = " version, 2000)
	;checking to see if the user wishes to check for updates
	check := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
	if check = "true"
		{
			if VerCompare(MyRelease, version) < 0
				{
					;grabbing changelog info
					try {
						change := ComObject("WinHttp.WinHttpRequest.5.1")
						change.Open("GET", "https://raw.githubusercontent.com/Tomshiii/ahk/main/changelog.md")
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
					gitButton := MyGui.Add("Button", "X530 Y10", "GitHub")
					gitButton.OnEvent("Click", githubButton)
					;set download button
					downloadbutt := MyGui.Add("Button", "X445 Y350", "Download")
					downloadbutt.OnEvent("Click", Down)
					;set cancel button
					cancelbutt := MyGui.Add("Button", "Default X530 Y350", "Cancel")
					cancelbutt.OnEvent("Click", closegui)
					;set changelog
					ChangeLog := MyGui.Add("Edit", "X8 Y50 r18 -WantCtrlA ReadOnly w590")
					;set "don't prompt again" checkbox
					noprompt := MyGui.Add("Checkbox", "vNoPrompt X300 Y357", "Don't prompt again")
					noprompt.OnEvent("Click", prompt)
					;getting value for changelog
					ChangeLog.Value := LatestChangeLog

					MyGui.Show()
					prompt(*) {
						if noprompt.Value = 1
							IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
						if noprompt.Value = 0
							IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
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
	largestSize := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe GB", 45)

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

	titleText := settingsGUI.Add("Text", "W100 H20 X9 Y7", "Settings")
	titleText.SetFont("S13 Bold")
	
	if IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "update check") = "true"
		updateCheckToggle := settingsGUI.Add("Checkbox", "Checked1 Y+5", "Check for Updates")
	else
		updateCheckToggle := settingsGUI.Add("Checkbox", "Checked0 Y+5", "Check for Updates")
	updateCheckToggle.OnEvent("Click", update)
	update(*)
	{
		updateVal := updateCheckToggle.Value
		if updateVal = 1
			IniWrite("true", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
		else
			IniWrite("false", A_MyDocuments "\tomshi\settings.ini", "Settings", "update check")
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

	adobeGBinitVal := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe GB")
	adobeGBEdit := settingsGUI.Add("Edit", "Y+10 r1 W50", "")
	settingsGUI.Add("UpDown",, adobeGBinitVal)
	adobeEditText := settingsGUI.Add("Text", "X+5 Y+-20", "``adobeTemp()`` GB limit")
	adobeGBEdit.OnEvent("Change", adobeGB)
	adobeGB(*)
	{
		IniWrite(adobeGBEdit.Value, A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe GB")
	}
	
	adobeFSinitVal := IniRead(A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe FS")
	adobeFSEdit := settingsGUI.Add("Edit", "X9 Y+10 r1 W50", "")
	settingsGUI.Add("UpDown",, adobeFSinitVal)
	adobeFSEditText := settingsGUI.Add("Text", "X+5 Y+-20", "``adobe fullscreen check.ahk`` check rate (s)")
	adobeFSEdit.OnEvent("Change", adobeFS)
	adobeFS(*)
	{
		detect()
		IniWrite(adobeFSEdit.Value, A_MyDocuments "\tomshi\settings.ini", "Settings", "adobe FS")
		if WinExist("adobe fullscreen check.ahk - AutoHotkey")
			PostMessage 0x0111, 65303,,, "adobe fullscreen check.ahk - AutoHotkey"
	}

	resetText := settingsGUI.Add("Text", "W100 H20 X9 Y+20", "Reset")
	resetText.SetFont("S13 Bold")

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

	saveAndClose := settingsGUI.Add("Button", "W85 H30 X9 Y+15", "Save && Exit")
	saveAndClose.OnEvent("Click", close)

	workDir := IniRead(A_MyDocuments "\tomshi\settings.ini", "Track", "working dir")
	workDirText := settingsGUI.Add("Text", "X+15 Y+-30", "Current working dir;`n" workDir)
	workDirText.SetFont("S10")


	settingsGUI.OnEvent("Escape", close)
	settingsGUI.OnEvent("Close", close)
	close(*)
	{
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

	settingsGUI.Show("Center AutoSize")
}


; ===========================================================================================================================================
;
;		Coordmode \\ Last updated: v2.1.6
;
; ===========================================================================================================================================
/* coords()
 sets coordmode to "screen"
 */
coords()
{
    coordmode "pixel", "screen"
    coordmode "mouse", "screen"
}

/* coordw()
  sets coordmode to "window"
  */
coordw()
{
    coordmode "pixel", "window"
    coordmode "mouse", "window"
}

/* coordc()
  * sets coordmode to "caret"
  */
coordc()
{
    coordmode "caret", "window"
}

; ===========================================================================================================================================
;
;		Tooltip \\ Last updated: v2.15.3
;
; ===========================================================================================================================================
/* toolCust()
  create a tooltip with any message
  @param message is what you want the tooltip to say
  @param timeout is how many ms you want the tooltip to last. This value can be omitted and it will default to 1s
  @param find is whether you want this function to state "Couldn't find " at the beginning of it's tooltip. Simply add 1 for this variable if you do, or omit it if you don't
  */
toolCust(message, timeout := 1000, find := "")
{
	if find != 1
		messageFind := ""
	else
		messageFind := "Couldn't find "
    ToolTip(messageFind message)
    SetTimer(timeouttime, - timeout)
    timeouttime()
    {
        ToolTip("")
    }
}

; ===========================================================================================================================================
;
;		Blockinput \\ Last updated: v2.0.1
;
; ===========================================================================================================================================
/* blockOn()
  blocks all user inputs [IF YOU GET STUCK IN A SCRIPT PRESS YOUR REFRESH HOTKEY (CTRL + R BY DEFAULT) OR USE CTRL + ALT + DEL to open task manager and close AHK]
  */
blockOn()
{
    BlockInput "SendAndMouse"
    BlockInput "MouseMove"
    BlockInput "On"
    ;it has recently come to my attention that all 3 of these operate independantly and doing all 3 of them at once is no different to just using "BlockInput "on"" but uh. oops, too late now I guess
}

/* blockOff()
  turns off the blocks on user input
  */
blockOff()
{
    blockinput "MouseMoveOff"
    BlockInput "off"
}

; ===========================================================================================================================================
;
;		Mouse Drag \\ Last updated: v2.12.3
;
; ===========================================================================================================================================
/* mousedrag()
  Press a button(ideally a mouse button), this script then changes to something similar to a "hand tool" and clicks so you can drag, then you set the hotkey for it to swap back to (selection tool for example). This function will (on first use) check the coordinates of the timeline and store them, then on subsequent uses ensuring the mouse position is within the bounds of the timeline before firing - this is useful to ensure you don't end up accidentally dragging around UI elements of Premiere.
  This version is specifically for Premiere Pro, the function below this one is for any other program
  @param tool is the thing you want the program to swap TO (ie, hand tool, zoom tool, etc)
  @param toolorig is the button you want the script to press to bring you back to your tool of choice
  */
mousedrag(tool, toolorig)
{
    if GetKeyState("RButton", "P") ;this check is to allow some code in `right click premiere.ahk` to work
        return
    MouseGetPos(&x, &y) ;from here down to the begining of again() is checking for the width of your timeline and then ensuring this function doesn't fire if your mouse position is beyond that, this is to stop the function from firing while you're hoving over other elements of premiere causing you to drag them across your screen
    static xValue := 0
    static yValue := 0
    static xControl := 0
    static yControl := 0
    if xValue = 0 || yValue = 0 || xControl = 0 || yControl = 0
        {
            try {
                SendInput(timelineWindow)
                effClassNN := ControlGetClassNN(ControlGetFocus("A")) ;gets the ClassNN value of the active panel
                ControlGetPos(&xpos, &ypos, &width, &height, effClassNN) ;gets the x/y value and width/height of the active panel
                static xValue := width - 22 ;accounting for the scroll bars on the right side of the timeline
                static yValue := ypos + 46 ;accounting for the area at the top of the timeline that you can drag to move the playhead
                static xControl := xpos + 238 ;accounting for the column to the left of the timeline
                static yControl := height + 40 ;accounting for the scroll bars at the bottom of the timeline
                if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
                    WinWaitClose("ahk_class tooltips_class32")
                toolCust(A_ThisFunc "() found the coordinates of the timeline.`nThis function will not check coordinates again until a script refresh")
            } catch as e {
                if WinExist("ahk_class tooltips_class32") ;checking to see if any tooltips are active before beginning
                    WinWaitClose("ahk_class tooltips_class32")
                toolCust("Couldn't find the ClassNN value")
                errorLog(A_ThisFunc "()", "Couldn't find the ClassNN value", A_LineFile, A_LineNumber)
                goto skip
            }
        }
    if x > xValue || x < xControl || y < yValue || y > yControl ;this line of code ensures that the function does not fire if the mouse is outside the bounds of the timeline. This code should work regardless of where you have the timeline (if you make you're timeline comically small you may encounter issues)
        return
    skip:
    again()
    {
        if A_ThisHotkey = DragKeywait ;we check for the defined value here because LAlt in premiere is used to zoom in/out and sometimes if you're pressing buttons too fast you can end up pressing both at the same time
            {
                if not GetKeyState(A_ThisHotkey, "P") ;this is here so it doesn't reactivate if you quickly let go before the timer comes back around
                    return
            }
        else if not GetKeyState(DragKeywait, "P")
            return
        click("middle") ;middle clicking helps bring focus to the timeline/workspace you're in, just incase
        SendInput tool "{LButton Down}"
        if A_ThisHotkey = DragKeywait ;we check for the defined value here because LAlt in premiere is used to zoom in/out and sometimes if you're pressing buttons too fast you can end up pressing both at the same time
            KeyWait(A_ThisHotkey)
        else
            KeyWait(DragKeywait) ;A_ThisHotkey won't work here as the assumption is that LAlt & Xbutton2 will be pressed and ahk hates that
        SendInput("{LButton Up}")
        SendInput toolorig
    }
    SetTimer(again, -400)
    again()
}

/* mousedragNotPrem()
  press a button(ideally a mouse button), this script then changes to something similar to a "hand tool" and clicks so you can drag, then you set the hotkey for it to swap back to (selection tool for example)
  @param tool is the thing you want the program to swap TO (ie, hand tool, zoom tool, etc)
  @param toolorig is the button you want the script to press to bring you back to your tool of choice
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
/* timeline()
  a weaker version of the right click premiere script. Set this to a button (mouse button ideally, or something obscure like ctrl + capslock)
  @param timeline in this function defines the y pixel value of the top bar in your video editor that allows you to click it to drag along the timeline
  @param x1 is the furthest left pixel value of the timeline that will work with your cursor warping up to grab it
  @param x2 is the furthest right pixel value of the timeline that will work with your cursor warping up to grab it
  @param y1 is just below the bar that your mouse will be warping to, this way your mouse doesn't try doing things when you're doing other stuff above the timeline
  */
timeline(timeline, x1, x2, y1)
{
    coordw()
    MouseGetPos(&xpos, &ypos)
    if(xpos > x1 and xpos < x2) and (ypos > y1) ;this function will only trigger if your cursor is within the timeline. This ofcourse can break if you accidently move around your workspace
        {
            blockOn()
            MouseMove(xpos, timeline) ;this will warp the mouse to the top part of your timeline defined by &timeline
            SendInput("{Click Down}")
            MouseMove(xpos, ypos)
            blockOff()
            KeyWait(A_ThisHotkey)
            SendInput("{Click Up}")
        }
    else
        return
}


; ===========================================================================================================================================
;
;		Error Log \\ Last updated: v2.11
;
; ===========================================================================================================================================
/* errorLog()
  A function designed to log errors in scripts if they occur
  @param func just type `A_ThisFunc "()"` if it's a function or `A_ThisHotkey "::"` if it's a hotkey
  @param error is what text you want logged to explain the error
  @param lineFile just type `A_LineFile`
  @param lineNumber just type `A_LineNumber`
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
                time := A_YYYY "_" A_MM "_" A_DD ", " A_Hour ":" A_Min ":" A_Sec "." A_MSec
                start := "\\ ErrorLogs`n\\ AutoHotkey v" A_AhkVersion "`n\\ OS`n" A_Tab "\\ " OSName "`n" A_Tab "\\ " A_OSVersion "`n" A_Tab "\\ " OSArch "`n\\ CPU`n" A_Tab "\\ " CPU "`n" A_Tab "\\ Logical Processors - " Logical "`n\\ RAM`n" A_Tab "\\ Total Physical Memory - " Memory "GB`n" A_Tab "\\ Free Physical Memory - " FreePhysMem "GB`n\\ Current DateTime - " time "`n\\ Ahk Install Path - " A_AhkPath "`n`n"
            }
        }
    scriptPath :=  lineFile ;this is taking the path given from A_LineFile
    scriptName := SplitPath(scriptPath, &name) ;and splitting it out into just the .ahk filename
    FileAppend(start A_Hour ":" A_Min ":" A_Sec "." A_MSec " // ``" func "`` encountered the following error: " '"' error '"' " // Script: ``" name "``, Line Number: " lineNumber "`n", A_WorkingDir "\Error Logs\" A_YYYY "_" A_MM "_" A_DD "_ErrorLog.txt")
}

; ===========================================================================================================================================
;
;		Other \\ Last updated: v2.16.11
;
; ===========================================================================================================================================
/* getHotkeys()
This function will return the name of the first & second hotkeys pressed when two are required for a macro to fire.
@param first is the variable that will be filled with the first activation hotkey. Must be written as `&var`
@param second is the variable that will be filled with the second activation hotkey. Must be written as `&var`
*/
getHotkeys(&first, &second)
{
   getHotkey := A_ThisHotkey
   length := StrLen(getHotkey)
   if StrLen(getHotkey) = 2
	{
		first := SubStr(getHotkey, 1, 1)
		second := SubStr(getHotkey, 2, 1)
		return
	}
   andValue := InStr(getHotkey, "&",, 1, 1)
   first := SubStr(getHotkey, 1, length - (length - andValue) - 2)
   second := SubStr(getHotkey, andValue + 2, length - andValue + 2)
   return
}