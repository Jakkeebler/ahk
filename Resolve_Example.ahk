﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetDefaultMouseSpeed, 0
#SingleInstance Force
; SetNumLockState, AlwaysOn ;uncomment if you want numlock to always be ON
; SetCapsLockState, AlwaysOff uncomment if you want capslock to always be OFF
I_Icon = C:\Program Files\ahk\Icons\resolve.png ;you'll need to change this path \\this code changes the icon for the script
ICON [I_Icon]                        ;Changes a compiled script's icon (.exe)
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon
#include C:\Program Files\ahk\MS_functions.ahk ;includes function definitions so they don't clog up this script

;\\CURRENT SCRIPT VERSION\\This is a "script" local version and doesn't relate to the Release Version
;\\v1.1

;\\CURRENT RELEASE VERSION
;\\v1.2
; ==================================================================================================
;
; 							THIS SCRIPT IS FOR v1.1 OF AUTOHOTKEY
;				 		IT WILL NOT RUN IN v2.0 WITHOUT HEAVY MODIFICATION
;
;			I hope to one day port funcitonality to v2.0 - that will take a long time though as
;				I am not a programmer, and a lot of the 2.0 changes go right over my head
;
; ==================================================================================================
;
; This script was created by Tomshi (https://www.youtube.com/c/tomshiii, https://www.twitch.tv/tomshi)
; Its purpose is to port over similar macros from my "My Scripts.ahk" to allow faster editing within resolve for you non adobe editors
; You are free to modify this script to your own personal uses/needs
; Please give credit to the foundation if you build on top of it, otherwise you're free to do as you wish
;
; ==================================================================================================
#IfWinNotActive ahk_exe Resolve.exe

^!a:: Run *RunAs "C:\Program Files (x86)\Notepad++\notepad++.exe" "%A_ScriptFullPath%" ;opens in notepad++ without needing to fully replace notepad with notepad++ (preferred)
;Opens as admin bc of how I have my scripts located, if you don't need it elevated, remove *RunAs

;!a:: ;if for whatever reason you choose to use vscode instead of notepad++, use this version instead of above
;Run "C:\Users\Tom\AppData\Local\Programs\Microsoft VS Code\Code.exe" ;opens in vscode (how I edit it)
;if WinExist("ahk_exe Code.exe")
;			WinActivate
;		else
;			WinWaitActive, ahk_exe Code.exe
;return

^!r::
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return

; ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

; ALL PIXEL VALUES WILL NEED TO BE ADJUSTED IF YOU AREN'T USING A 1440p MONITOR (AND MIGHT STILL EVEN IF YOU ARE)

; ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

; This is an example script I've created for davinci resolve porting over some similar functionality I use
; in my premiere scripts. Things aren't as clean and there may be better ways to do things
; keep in mind I don't use resolve and I've just cooked this up as an example for you to mess with yourself

;=========================================================
;		DAVINCI RESOLVE
;=========================================================
#IfWinActive ahk_exe Resolve.exe

;=========================================================
;		keyboard shortcut replacements
;=========================================================
; ///// these all assume you're using resolve's default keybinds

q::+[ ; reassign shift[ to ripple start to playhead ;...or assign it to q
w::+] ; reassign shift] to ripple start to playhead ;...or assign it to w
~s::^\ ; ctrl \ is how to split tracks in resolve ;needs ~ or you can't save lmao. likely better to just remap in resolve
XButton2::MButton ; middle mouse is how you normally scroll horizontally in resolve, middle mouse is obnoxious to press though
WheelRight::Down
WheelLeft::Up
;change "normal edit mode" to v to make it like premiere
;change "blade edit mode" to c to make it like how I use premiere
;change "ripple delete" to shift c to make it like how I use premiere

;=========================================================
;		hold and drag (or click)
;=========================================================
; ///// for these scripts to work, the inspector tab must be open and scrolled to the top
; ///// you could add functionality to scroll up a few times if you run into that being an issue a lot

F1::
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2196, 139 ;this highlights the video tab
	MouseMove, 2329, 215 ;moves to the scale value
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F1, P ;gets the state of the f1 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 1
			;MouseMove, x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
			;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
			sleep 50
			send, {enter}
			click 2295, 240 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
			;MouseMove, %xposP%, %yposP% ;if you want to press the reset arrow, uncomment this line
			;blockinput, MouseMoveOff ;if you want to press the reset arrow, uncomment this line
			;BlockInput, off ;if you want to press the reset arrow, uncomment this line
		}
blockOff()
	KeyWait, F1
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP%
Return

/*
;Not entirely sure Resolve has similar function to premiere where you can reposition a clip by draggin it around in the preview window
F2:: ;press then hold alt and drag to move position. Let go of alt to confirm
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
;MouseGetPos, xposP, yposP ;if you wish to use the reset arrow, uncomment this line
BlockInput, On
SetDefaultMouseSpeed 0
	Click 142 1059 ;you can simply double click the preview window to achieve the same result in premiere, but doing so then requires you to wait over .5s before you can reinteract
	sleep 100
GetKeyState, stateFirstCheck, F2, P ;gets the state of the f1 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			MouseMove, 418, 1055
			;MsgBox, you've moved to the position
			sleep 50
			Send, {click left}
			blockinput, MouseMoveOff
			BlockInput, off
			MouseMove, %xposP%, %yposP%
			return
		}
else
	MouseMove, 2300, 238 ;with it which imo is just dumb, so unfortunately clicking "motion" is both faster and more reliable
	SendInput, {Click Down}
blockinput, MouseMoveOff
BlockInput, off
	KeyWait, F2
	SendInput, {Click Up}
;MouseMove, %xposP%, %yposP% ; // moving the mouse position back to origin after doing this is incredibly disorienting
;MouseMove, %xposP%, %yposP% ; // moving the mouse position back to origin after doing this is incredibly disorienting
Return
*/

F3:: ;press then hold alt and drag to increase/decrese x position. Let go of alt to confirm
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2196, 139 ;this highlights the video tab
	MouseMove, 2332, 239 ;moves to the x axis value
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F3, P ;gets the state of the f1 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 0
			;MouseMove, x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
			;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
			sleep 50
			send, {enter}
			click 2295, 240 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
			;MouseMove, %xposP%, %yposP% ;if you want to press the reset arrow, uncomment this line
			;blockinput, MouseMoveOff ;if you want to press the reset arrow, uncomment this line
			;BlockInput, off ;if you want to press the reset arrow, uncomment this line
		}
blockOff()
	KeyWait, F3
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP%
Return

F4:: ;press then hold alt and drag to increase/decrese y position. Let go of alt to confirm
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2196, 139 ;this highlights the video tab
	MouseMove, 2457, 240 ;moves to the y axis value
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F4, P ;gets the state of the f1 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 0
			;MouseMove, x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
			;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
			sleep 50
			send, {enter}
			click 2295, 240 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
			;MouseMove, %xposP%, %yposP% ;if you want to press the reset arrow, uncomment this line
			;blockinput, MouseMoveOff ;if you want to press the reset arrow, uncomment this line
			;BlockInput, off ;if you want to press the reset arrow, uncomment this line
		}
blockOff()
	KeyWait, F4
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP%
Return

F5:: ;press then hold alt and drag to increase/decrese scale. Let go of alt to confirm
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2196, 139 ;this highlights the video tab
	MouseMove, 2456, 265 ;moves to the rotation value
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F5, P ;gets the state of the f1 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 0 ;resets rotation to 0
			sleep 50
			send, {enter}
			click 2295, 240 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
		}
blockOff()
	KeyWait, F5
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP%
Return

;=========================================================
;		flips
;=========================================================
!h:: ;flip horizontally
SetDefaultMouseSpeed 0
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2196, 139 ;this highlights the video tab
	click 2301, 363
MouseMove, %xposP%, %yposP%
blockOff()
Return

!v:: ;flip vertically
SetDefaultMouseSpeed 0
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2196, 139 ;this highlights the video tab
	click 2340, 367
MouseMove, %xposP%, %yposP%
blockOff()
Return

;=========================================================
;		Scale Adjustments
;=========================================================
^1:: ;makes the scale of current selected clip 100
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2333, 218 ;clicks on video
	SendInput, 1{ENTER} ;effectively 100%
	click 2292, 215 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
MouseMove, %xposP%, %yposP%
blockOff()
Return

^2:: ;makes the scale of current selected clip 100
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2333, 218 ;clicks on video
	SendInput, 2{ENTER} ;effectively 200%
	click 2292, 215 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
MouseMove, %xposP%, %yposP%
blockOff()
Return

^3:: ;makes the scale of current selected clip 100
coordw()
blockOn()
SetDefaultMouseSpeed 0
MouseGetPos, xposP, yposP
	click 2333, 218 ;clicks on video
	SendInput, 3{ENTER} ;effectively 300%
	click 2292, 215 ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
MouseMove, %xposP%, %yposP%
blockOff()
Return

;===========================================================================================================================================================================
;
;		Drag and Drop Effect Presets
;
;===========================================================================================================================================================================
!g:: ;hover over a track on the timeline, press this hotkey, then watch as ahk drags that "favourite" onto the hovered track
coordw() ;this script requires the "effects library" to be open on the left side of screen
blockOn()
MouseGetPos, xposP, yposP
	;Click 566, 735 ;clicks mag glass in the "effects library" window \\bad idea since clicking it again closes the search bar .-.
	;SendInput, gaussian
	MouseMove, 80, 1046 ;add effect as a favourite instead, makes things easier as clicking the mag glass changes depending on if it's already open
	sleep 100
	SendInput, {Click Down}
SetDefaultMouseSpeed 2 ;resolve doesn't like if your mouse warps right back to the timeline, this is necessary
MouseMove, %xposP%, %yposP%
	;sleep 500
	SendInput, {Click Up}
blockOff()
return

;===========================================================================================================================================================================
;
;		better timeline movement (don't use rightclick, you'll lose context menus)
;
;===========================================================================================================================================================================
Xbutton1:: ;this script isn't as powerful as the premiere version, but to my knowledge resolve doesn't have a keyboard shortcut to move the playhead, so this is the best we have
coordw()
blockOn()
MouseGetPos, xposP, yposP
	MouseMove, xposP, 827
	SendInput, {Click Down}
	MouseMove, %xposP%, %yposP%
	blockOff()
	KeyWait, Xbutton1
	SendInput, {Click Up}
return

;=========================================================
;		other
;=========================================================

/*
Numpad1::
SetDefaultMouseSpeed 0
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	click 2257, 141 ;this highlights the audio tab
	click 2454, 216
	SendInput, -2
	MouseMove, 2495, 211
	click ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again. Using the arrow would hoennstly be faster here
blockinput, MouseMoveOff
BlockInput, off
MouseMove, %xposP%, %yposP%
Return
; This is great and all, but only lets you go to preset values, the best way in resolve is to just set a keyboard shortcut
; in the "audio" section to increase/decrease audio by 1/3db
*/