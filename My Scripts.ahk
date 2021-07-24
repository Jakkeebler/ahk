﻿#SingleInstance Force
SetWorkingDir, %A_ScriptDir%
SetNumLockState, AlwaysOn ;sets numlock to always on
SetCapsLockState, AlwaysOff ;sets caps lock to always off (you can still use caps lock for macros)
SetDefaultMouseSpeed, 0
I_Icon = C:\Program Files\ahk\Icons\myscript.png ;you'll need to change this path \\this code changes the icon for the script
ICON [I_Icon]                        ;Changes a compiled script's icon (.exe)
if I_Icon <>
IfExist, %I_Icon%
	Menu, Tray, Icon, %I_Icon%   ;Changes menu tray icon

; ===========================================================================================================================================================
;
; This script was created by & for Tomshi (https://www.youtube.com/c/tomshiii, https://www.twitch.tv/tomshi)
; Its purpose is to help speed up editing and random interactions with windows.
; You are free to modify this script to your own personal uses/needs
; Please give credit to the foundation if you build on top of it, similar to how I have below, otherwise you're free to do as you wish
;
; ===========================================================================================================================================================

; A chunk of the code in this script was either directly inspired by, or copied from Taran from LTT (https://github.com/TaranVH/), his videos on the subject
; are what got me into AHK to begin with and what brought the foundation of this script to life
; I use a streamdeck to run a lot of these scripts which is why a bunch of them are bound to F13-24 but really they could be replaced with anything
; basic AHK is about all I know relating to code so the layout might not be "standard" but it helps me read it and maintain it which is more important since it's for personal use

; I use to use notepad++ to edit this script, if you want proper syntax highlighting in notepad++ for ahk go here: https://www.autohotkey.com/boards/viewtopic.php?t=50
; I now use VSCode which can be found here: https://code.visualstudio.com/
; AHK syntax highlighting can be installed within the program itself

;===========================================================================================================================================================================
;
;		Windows
;
;===========================================================================================================================================================================
#IfWinNotActive ahk_exe Adobe Premiere Pro.exe
^!w:: ;this simply warps my mouse to my far monitor bc I'm lazy YEP
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseMove, 5044, 340
return

^+a::Run, C:\Program Files\ahk ;opens my script directory

;!a:: ;edit %a_ScriptDir% ;opens this script in notepad++ if you replace normal notepad with ++ \\don't recomment using this way at all, replacing notepad kinda sucks
;!a:: Run *RunAs "C:\Program Files (x86)\Notepad++\notepad++.exe" "%A_ScriptFullPath%" ;opens in notepad++ without needing to fully replace notepad with notepad++ (preferred) \\use this way
;Opens as admin bc of how I have my scripts located, if you don't need it elevated, remove *RunAs
!a:: ;ignore this version, comment it out and uncomment ^ for notepad++
Run "C:\Users\Tom\AppData\Local\Programs\Microsoft VS Code\Code.exe" ;opens in vscode (how I edit it)
if WinExist("ahk_exe Code.exe")
			WinActivate
		else
			WinWaitActive, ahk_exe Code.exe
return

!r:: 
Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Run "C:\Users\Tom\AppData\Local\Programs\Microsoft VS Code\Code.exe"
if WinExist("ahk_exe Code.exe")
			WinActivate
		else
			WinWaitActive, ahk_exe Code.exe
return

^+d::WinMove, ahk_exe Discord.exe,, 4480, -260, 1080, 1488 ;Make discord bigger so I can actually read stuff when not streaming

F22:: ;opens editing playlist, moves vlc into a small window, changes its audio device to goxlr
SetKeyDelay, 100
SetWinDelay, 0
	run, D:\Program Files\User\Music\pokemon.xspf
		if WinExist("ahk_exe vlc.exe")
			WinActivate
		else
			WinWaitActive, ahk_exe vlc.exe
	WinMove, VLC media player,, 2066, 0, 501, 412 ;isn't working atm??
	Send, +a+a+a+a+a+a
Return

^SPACE::WinSet, AlwaysOnTop, -1, A ; will toggle the current window to remain on top 

NumpadDiv::Run, *RunAs C:\Program Files\Microsoft Office\root\Office16\EXCEL.EXE 

^+c:: ;runs a google search of highlighted text
    Send, ^c
    Sleep 50
    Run, https://www.google.com/search?d&q=%clipboard%
    Return
;===========================================================================================================================================================================
;
;		Stream
;
;===========================================================================================================================================================================
#IfWinNotActive ahk_exe Adobe Premiere Pro.exe
F15:: ;Start everything for stream
SetWinDelay, 0 ;makes windows move instantly
	Run, C:\Program Files\ahk\obs64.lnk ;opening shortcuts helps to make sure obs doesn't complain about having an incorrect working directory
		if WinExist("ahk_exe obs64.exe") ;waits until obs is open then brings it into focus
			WinActivate
		else
			WinWaitActive, ahk_exe obs64.exe
	sleep 2500 ; you have to wait a while after obs opens before you can start sending it commands or it'll crash 
	SendInput, !p ;Opens alt context menu - The Above 2.5s sleep is essential as obs crashes if you instantly change the profile
	SendInput, {DOWN 7}
	SendInput, {ENTER} ;Changes profile to main stream profile.
	sleep 2000
	WinMove, OBS,,  2553, -892, 1111, 1047 ;Moves obs into position, important for me to keep because streamelements obs is wider and ruins main obs
{ ;this part of the script is just to set the source record hotkey(s) until they fix it
		WinActivate, ahk_exe obs64.exe ;just incase windows loses it
		SendInput, !f
		sleep 100
		SendInput, s
		sleep 2000
		SendInput, {DOWN 5}
		sleep 200
		SendInput, {TAB 52}
		sleep 200
		SendInput, ^+8
		sleep 1000
		SendInput, {TAB}
		SendInput, +{TAB 53}
		sleep 200
		SendInput, {UP}
		SendInput, {TAB}
		SendInput, {ENTER}
		sleep 200
}
	Run, firefox.exe https://docs.google.com/presentation/d/1b6pCuOIrw4pEF6GACxrBh8C-mB4XsDeHLM50cj4jAkQ/edit#slide=id.g90e8195d3c_16_958 ;opens the AM route doc to pauline questions
		if WinExist("ahk_exe firefox.exe")
			WinActivate
		else
			WinWaitActive, ahk_exe firefox.exe
	sleep 1000 ;waits before opening the next tab or firefox derps out
	Run, firefox.exe https://dashboard.twitch.tv/u/tomshi/stream-manager
	sleep 9000 ;if both tabs don't load in, it can mess with trying to separate them
		;{ ;if WinExist("ahk_exe firefox.exe")
			;WinActivate
		;else
			;WinWaitActive, ahk_exe firefox.exe ;the following code was yoinked from taran, it's just a deeper method of calling firefox forwards since sometimes it doesn't focus
			;WinActivatebottom ahk_exe firefox.exe
			;WinGet, hWnd, ID, ahk_class MozillaWindowClass
				;DllCall("SetForegroundWindow", UInt, hWnd) } ;old code, testing ;
			WinActivate ahk_exe firefox.exe
			;WinWaitActive, ahk_exe firefox.exe ;the following code was yoinked from taran, it's just a deeper method of calling firefox forwards since sometimes it doesn't focus
			WinActivatebottom ahk_exe firefox.exe
			WinGet, hWnd, ID, ahk_class MozillaWindowClass
				DllCall("SetForegroundWindow", UInt, hWnd) 
	SetKeyDelay, 100
	Send, !d ;opens the alt context menu to begin detatching the firefox tab
	Send, +{TAB 3}
	sleep, 100
	Send, +{F10}
	sleep, 100
	Send, v
	sleep, 100
	Send, w
	sleep, 2000
	WinMove, Twitch,, -6, 0, 1497, 886 ;moves browser tabs into position for stream
	WinMove, All Moons UPDATED v.1.3.0,, 1218, 658, 1347, 747 ;moves browser tabs into position for stream
	;Run, chrome.exe https://dashboard.twitch.tv/u/tomshi/stream-manager only need this if I'm doing something subpoint related
	Run, C:\Program Files\Docker\Docker\frontend\Docker Desktop.exe
	Run, C:\Program Files\Chatterino\chatterino.exe
	Run, F:\Twitch\lioranboard\LioranBoard Receiver(PC)\LioranBoard Receiver.exe
	Run, C:\Program Files (x86)\foobar2000\foobar2000.exe
	Run, F:\Twitch\Splits\Splits\LiveSplit_1.7.6\LiveSplit.exe
	Run, C:\Users\Tom\AppData\Local\Programs\streamlabels\StreamLabels.exe
	Run, C:\Program Files\ahk\Streamlabs Chatbot.lnk
	;Run, C:\Program Files\Elgato\GameCapture\GameCapture.exe // replaced by source record plugin
	Run, chrome.exe https://www.twitch.tv/popout/tomshi/chat
	WinMove, ahk_exe Discord.exe,, 4480, 432, 1080, 797 ;moves into position
	 ;required for brothers queue program for automatic mii wii playback
;if WinExist("ahk_exe Docker Desktop.exe") ;waits until docker is open then brings it into focus
;		WinActivate
;	else
;		WinWaitActive, ahk_exe ahk_exe Docker Desktop.exe
;	sleep 10000
;		coordmode, pixel, Window
;		coordmode, mouse, Window
;		MouseMove, 1128, 130 ;moves mouse to click the start button
;		click
sleep 1000
	Run, C:\Program Files\ahk\TomSongQueueue\Builds\ApplicationDj.exe
;		if WinExist("ahk_exe ApplicationDj.exe") ;waits until ttp's program is open then brings it into focus
;			WinActivate
;		else
;			WinWaitActive, ahk_exe ApplicationDj.exe
;sleep 2000
;	SendInput, y{enter}
	Run, F:\Twitch\lioranboard\LioranBoard Receiver(PC)\LioranBoard Receiver.exe ;try to run it again since apparently running it once sometimes isn't enough
Return

F13::
Run, C:\Program Files\ahk\TomSongQueueue\Builds\ApplicationDj.exe ;runs the queue program incase it opened too late
if WinExist("ahk_exe ApplicationDj.exe") ;waits until ttp's program is open then brings it into focus
			WinActivate
		else
			WinWaitActive, ahk_exe ApplicationDj.exe
sleep 1000 ;waits since it's not responsive to input for a second even after it has opened
SendInput, y{enter}
return

F17::
Run, C:\Program Files\ahk\TomSongQueueue\Builds\SongQueuer.exe
Return

F19:: ;this script goes through and closes everything I use for stream
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
	MouseMove, 878, 14
	WinActivate, ahk_exe Streamlabs Chatbot.exe
	WinClose, ahk_exe foobar2000.exe
	WinClose, All Moons UPDATED v.1.3.0
	WinClose, Twitch
	WinClose, ahk_exe Docker Desktop.exe
;WinClose, ahk_exe LiveSplit.exe ;don't include, just incase of gold/pbs
;WinClose, LiveSplit ;don't include, just incase of gold/pbs
	WinClose, ahk_exe chrome.exe
	WinClose, ahk_exe obs64.exe
	WinClose, ahk_exe StreamLabels.exe
	WinClose, ahk_exe chatterino.exe
	WinClose, ahk_exe LioranBoard Receiver.exe
	WinClose, ahk_exe ApplicationDj.exe
;WinKill, Streamlabs Chatbot
Return

F16:: ;opens streamelements obs and swaps to botshi profile
	Run, C:\Program Files\ahk\BOTSHI.lnk ;opening shortcuts helps to make sure obs and ahk have the same admin level so ahk can interact with it, otherwise obs wont accept inputs
	;Run, C:\Program Files\ahk\obs64.lnk
		WinWait ahk_exe obs64.exe ;waits until obs is open then brings it into focus. obs live fucked up their integration so you have to physically click on obs live before you can input alt commands. Thanks obs live
		sleep 3000 ;waits a little bit once obs has opened so it doesn't crash
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 457, 928
	SendInput, {Click}, !p ;I have to physically click on streamelements obs before it will accept any inputs, I have no idea why, this didn't happen originally but started happening in obs 27
	sleep 200 ;either these sleeps are necessary, or every SendInput needs to be on a separate line, obs can't take inputs that fast and breaks
	SendInput, {DOWN 6}
	sleep 200
	SendInput, {ENTER}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

#IfWinExist ahk_exe obs64.exe
^+r:: ;this script is to trigger the replay buffer in obs, as well as the source record plugin, I use this to save clips of stream 
		if WinExist("ahk_exe obs64.exe") ;focuses obs
			WinActivate
		else
			WinWaitActive, ahk_exe obs64.exe
	sleep 1000
	SendInput, ^p ;Main replay buffer hotkey must be set to this
	SendInput, ^+8 ;Source Record OBS Plugin replay buffer must be set to this
	;sleep 10
	;SendInput, ^+9 ;Source Record OBS Plugin replay buffer must be set to this
	sleep 10
Return

/*
;currently replaced by the F11 premiere hotkey
;=========================================================
;		Audition 
;=========================================================
#IfWinActive ahk_exe Adobe Audition.exe
F13:: ;Moves mouse and applies Limit preset, then normalises to -3db
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 300, 380
	SendInput, {Click}l{DOWN 3}{ENTER}
	sleep, 5
	MouseMove, 92, 717
	SendInput, {Click}
	sleep, 2200
	SendInput, !rnn{ENTER}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return
*/

;===========================================================================================================================================================================
;
;		Photoshop
;
;===========================================================================================================================================================================
#IfWinActive ahk_exe Photoshop.exe
^+p:: ;When highlighting the name of the document, this moves through and selects the output file as a png instead of the default psd
SetKeyDelay, 300 ;photoshop is sometimes slow as heck, delaying things just a bit ensures you get the right thing every time
	Send, {TAB}{RIGHT}
	SendInput, {Up 21} ;makes sure you have the top most option selected
	sleep 50 ;this probably isn't needed, but I have here for saftey just because photoshop isn't the best performance wise
	SendInput, {DOWN 17}
	Send, {Enter}+{Tab}
Return

;===========================================================================================================================================================================
;
;		Premiere
;
;===========================================================================================================================================================================
#IfWinActive ahk_exe Adobe Premiere Pro.exe

SetKeyDelay, 0 ;this is just here incase I add some sends in the future
F11:: ;hover over an audio track you want normalized, this will then send it to adobe audition to be limited and normalised.
; If there are multiple audio tracks and you only want one, alt click it individually first.
/*
using this caused problems with premieres selections
SendInput, !{Click} ;alt clicks the audio track to just select it and not the whole track
sleep 100 ;ahk is too fast
SetKeyDelay, 0
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
MouseMove, xposP, 513
*/
	SendInput, {Click Right}
	sleep 200
	SendInput, {Down 8} ;menus down to send to adobe audition
	sleep 200
	SendInput, {Enter}
		if WinExist("ahk_exe Adobe Audition.exe") ;waits until audition opens
			WinActivate
		else
			WinWaitActive, ahk_exe Adobe Audition.exe
	WinMaximize, ahk_exe Adobe Audition.exe ;for whatever reason audition opens windowed sometimes, this just forces fullscreen		
	sleep 4000 ;audition is slow asf to load
coordmode, pixel, Screen
coordmode, mouse, Screen
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 1192, 632 ;moves the mouse to the middle of the screen
	SendInput, {click} ;clicks in the middle of the screen to ensure the current audio is actually selected, audition is just jank as hell and it's easier to just add this step than to deal with it not working sometimes
	sleep 1000
	MouseMove, 301, 373 ;moves the mouse to the preset selector
	SendInput, {Click}l{DOWN 3}{ENTER} ;menus to the limit preset I have
	sleep, 100
	MouseMove, 80, 714
	SendInput, {Click}
	sleep, 2200
	SendInput, !rnn{ENTER} ;menus to the normalise preset in the alt menu
	sleep, 2200
	MouseMove, 1192, 632 ;moves back to the middle of the screen and clicks
	SendInput, {click}
	SendInput, ^s ;saves so the changes translate over to premiere
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
	WinMinimize, ahk_exe Adobe Audition.exe ;minimises audition and reactivates premiere
	WinActivate, ahk_exe Adobe Premiere Pro.exe
Return

;===========================================================================================================================================================================
;
;		hold and drag (or click)
;
;===========================================================================================================================================================================
F1:: ;press then hold alt and drag to increase/decrese scale. Let go of alt to confirm 
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordmode, pixel, Screen
coordmode, mouse, Screen
BlockInput, SendAndMouse ;// can't use block input as you need to drag the mouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 227, 1101
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F1, P ;gets the state of the f1 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 100
			;MouseMove, x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
			;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
			sleep 50
			send, {enter}
			;MouseMove, %xposP%, %yposP% ;if you want to press the reset arrow, uncomment this line
			;blockinput, MouseMoveOff ;if you want to press the reset arrow, uncomment this line
			;BlockInput, off ;if you want to press the reset arrow, uncomment this line
		}
blockinput, MouseMoveOff
BlockInput, off
	KeyWait, F1
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP% 
Return

F2:: ;press then hold alt and drag to increase/decrese x position. Let go of alt to confirm 
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordmode, pixel, Screen
coordmode, mouse, Screen
BlockInput, SendAndMouse 
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 226, 1079
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F2, P ;gets the state of the f2 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 960 ;I always edit in a 1080p timeline so it's just easier to input those values, you could MouseMove over to the reset arrow instead like F2 if that's better for you
			;MouseMove, x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
			;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
			sleep 50
			send, {enter}
			;MouseMove, %xposP%, %yposP% ;if you want to press the reset arrow, uncomment this line
			;blockinput, MouseMoveOff ;if you want to press the reset arrow, uncomment this line
			;BlockInput, off ;if you want to press the reset arrow, uncomment this line
		}
blockinput, MouseMoveOff
BlockInput, off
	KeyWait, F2
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP% 
Return

F3:: ;press then hold alt and drag to increase/decrese y position. Let go of alt to confirm 
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordmode, pixel, Screen
coordmode, mouse, Screen
BlockInput, SendAndMouse 
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 275, 1080
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F3, P ;gets the state of the f3 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 540 ;I always edit in a 1080p timeline so it's just easier to input those values, you could MouseMove over to the reset arrow instead like F2 if that's better for you
			;MouseMove, x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
			;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
			sleep 50
			send, {enter}
			;MouseMove, %xposP%, %yposP% ;if you want to press the reset arrow, uncomment this line
			;blockinput, MouseMoveOff ;if you want to press the reset arrow, uncomment this line
			;BlockInput, off ;if you want to press the reset arrow, uncomment this line
		}
blockinput, MouseMoveOff
BlockInput, off
	KeyWait, F3
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP% 
Return

F4:: ;press then hold alt and drag to move position. Let go of alt to confirm 
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordmode, pixel, Screen
coordmode, mouse, Screen
BlockInput, SendAndMouse
BlockInput, MouseMove
;MouseGetPos, xposP, yposP ;if you wish to use the reset arrow, uncomment this line
BlockInput, On
	Click 142 1059 
	sleep 100
GetKeyState, stateFirstCheck, F4, P ;gets the state of the f4 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
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
else					;you can simply double click the preview window to achieve the same result in premiere, but doing so then requires you to wait over .5s before you can reinteract 
	MouseMove, 2300, 238 ;with it which imo is just dumb, so unfortunately clicking "motion" is both faster and more reliable
	SendInput, {Click Down}
blockinput, MouseMoveOff
BlockInput, off
	KeyWait, F4
	SendInput, {Click Up}
;MouseMove, %xposP%, %yposP% ; // moving the mouse position back to origin after doing this is incredibly disorienting 
;MouseMove, %xposP%, %yposP% ; // moving the mouse position back to origin after doing this is incredibly disorienting 
Return

F5:: ;press then hold alt and drag to increase/decrese scale. Let go of alt to confirm 
	;SendInput, d ;d must be set to "select clip at playhead" //if a clip is already selected the effects disappear :)
coordmode, pixel, Screen
coordmode, mouse, Screen
BlockInput, SendAndMouse ;// can't use block input as you need to drag the mouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 219, 1165
	sleep 100
	SendInput, {Click Down}
GetKeyState, stateFirstCheck, F5, P ;gets the state of the f5 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
	if stateFirstCheck = U ;this function just does what I describe above
		{
			Click up left
			sleep 10
			Send, 0 ;resets rotation to 0
			sleep 50
			send, {enter}
		}
blockinput, MouseMoveOff
BlockInput, off
	KeyWait, F5
	SendInput, {Click Up}
MouseMove, %xposP%, %yposP% 
Return

;===========================================================================================================================================================================
;
;		NUMPAD SCRIPTS
;
;===========================================================================================================================================================================
Numpad7:: ;This script moves the mouse to a pixel position to highlight the "motion tab" then menu and change values to zoom into a custom coord and zoom level
	SendInput, ^+9
	SendInput, ^{F5} ;highlights the timeline, then changes the track colour so I know that clip has been zoomed in
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	;Send ^+8 ;highlight the effect control panel
	;Send ^+8 ;again because adobe is dumb and sometimes doesn't highlight if you're fullscreen somewhere
	click, 214, 1016
	SendInput, {WheelUp 30}
	MouseMove, 122,1060 ;location for "motion"
	SendInput, ^+k ;shuttle stop. idk why this one is still here, but uh, leave it since it's not breaking anything
	SendInput, {Click}
	SendInput, {Tab}1912{Tab}0{Tab}200{ENTER}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

Numpad8:: ;This script moves the mouse to a pixel position to highlight the "motion tab" then menu and change values to zoom into a custom coord and zoom level
	SendInput, ^+9
	SendInput, ^{F5} ;highlights the timeline, then changes the track colour so I know that clip has been zoomed in
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
	MouseGetPos, xposP, yposP
	click, 214, 1016
	SendInput, {WheelUp 30}
	MouseMove, 122,1060
	SendInput, {Click}
	SendInput, {Tab}2880{Tab}-538{Tab}300
	SendInput, {Enter}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

Numpad9:: ;This script moves the mouse to a pixel position to reset the "motion" effects
	SendInput, ^+9
	SendInput, {F12} ;highlights the timeline, then changes the track colour so I know that clip has been reset back to normal
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 359, 1063
	;SendInput, {WheelUp 10} ;if you do this, for whatever reason "click" no longer works without an insane amount of delay, idk why
	click
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

Numpad2:: ;INCREASE GAIN BY 2db == set g to open gain window
	SendInput, g
	SendInput, +{Tab}{UP 3}{DOWN}{TAB}2{ENTER}
Return

Numpad1:: ;REDUCE GAIN BY -2db
	SendInput, g
	SendInput, +{Tab}{UP 3}{DOWN}{TAB}-2{ENTER}
Return

Numpad3:: ;INCREASE GAIN BY 6db
	SendInput, g
	SendInput, +{Tab}{UP 3}{DOWN}{TAB}6{ENTER}
Return

;===========================================================================================================================================================================
;
;		Drag and Drop Effect Presets
;
;===========================================================================================================================================================================
!g:: ;hover over a track on the timeline, press this hotkey, then watch as ahk drags that preset onto the hovered track
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
	SendInput, ^+7
	SendInput, ^b ;Requires you to set ctrl shift 7 to the effects window, then ctrl b to select find box
		sleep 60
	SendInput, ^a{DEL}
	SendInput, gaussian blur 20 ;create a preset of blur effect with this name, must be in a folder as well
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
	MouseMove, 3354, 259
	sleep 100
	MouseMove, 40, 68,, R
	SendInput, {Click Down}
MouseMove, %xposP%, %yposP% 
	SendInput, {Click Up}
blockinput, MouseMoveOff
BlockInput, off
Return

!p:: ;hover over a track on the timeline, press this hotkey, then watch as ahk drags that preset onto the hovered track
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
	SendInput, ^+7
	SendInput, ^b ;Requires you to set ctrl shift 7 to the effects window, then ctrl b to select find box
		sleep 60
	SendInput, ^a{DEL}
	SendInput, parametric ;create parametric eq preset with this name, must be in a folder as well
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
	MouseMove, 3354, 259
		Sleep 100
	MouseMove, 40, 68,, R
	SendInput, {Click Down}
MouseMove, %xposP%, %yposP% 
	SendInput, {Click Up}
blockinput, MouseMoveOff
BlockInput, off
Return

!h:: ;hover over a track on the timeline, press this hotkey, then watch as ahk drags that preset onto the hovered track
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
	SendInput, ^+7
	SendInput, ^b ;Requires you to set ctrl shift 7 to the effects window, then ctrl b to select find box
		sleep 60
	SendInput, ^a{DEL}
	SendInput, hflip ;create hflip preset with this name, must be in a folder as well
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
	MouseMove, 3354, 259
		sleep 100
	MouseMove, 40, 68,, R
	SendInput, {Click Down}
MouseMove, %xposP%, %yposP% 
	SendInput, {Click Up}
blockinput, MouseMoveOff
BlockInput, off
Return

!c:: ;hover over a track on the timeline, press this hotkey, then watch as ahk drags that preset onto the hovered track
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
	SendInput, ^+7
	SendInput, ^b ;Requires you to set ctrl shift 7 to the effects window, then ctrl b to select find box
		sleep 60
	SendInput, ^a{DEL}
	SendInput, croptom ;create croptom preset with this name, must be in a folder as well
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
	MouseMove, 3354, 259
		sleep 100
	MouseMove, 40, 68,, R
	SendInput, {Click Down}
MouseMove, %xposP%, %yposP% 
	SendInput, {Click Up}
blockinput, MouseMoveOff
BlockInput, off
Return

!t:: ;hover over a text element on the timeline, press this hotkey, then watch as ahk drags that preset onto the hovered track
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
	SendInput, ^+7
	SendInput, ^b ;Requires you to set ctrl shift 7 to the effects window, then ctrl b to select find box
		sleep 60
	SendInput, ^a{DEL}
	SendInput, loremipsum ;create loremipsum preset with this name, must be in a folder as well
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
	MouseMove, 205, 1039
	sleep 100
	SendInput, {WheelUp 10}
	MouseMove, 31, 1080
	sleep 500 ;apparently if you don't give premiere half a second before trying to hide a text layer, it just doesn't click?? or it's ahk??
	Click, Left
	sleep 100
	MouseMove, 3354, 259
	MouseMove, 40, 68,, R
	SendInput, {Click Down}
MouseMove, %xposP%, %yposP% 
	SendInput, {Click Up}
blockinput, MouseMoveOff
BlockInput, off
Return

;===========================================================================================================================================================================
;
;		Scale Adjustments
;
;===========================================================================================================================================================================
^1:: ;makes the scale of current selected clip 100
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 237,1102
	SendInput, {CLICK}100{ENTER}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

^2:: ;makes the scale of current selected clip 200
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 237,1102
	SendInput, {CLICK}200{ENTER}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

^3:: ;makes the scale of current selected clip 300
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
MouseGetPos, xposP, yposP
	MouseMove, 237,1102
	SendInput, {CLICK}300{ENTER}
MouseMove, %xposP%, %yposP% 
blockinput, MouseMoveOff
BlockInput, off
Return

;===========================================================================================================================================================================
;
;		Mouse Scripts
;
;===========================================================================================================================================================================
WheelRight:: +Down ;Set shift down to "Go to next edit point on any track"
WheelLeft:: +Up ;Set shift up to "Go to previous edit point on any track
F14::^+w ;Set mouse button to always spit out f14, then set ctrl shift w to "Nudge Clip Selection up"

Xbutton1::^w ;Set ctrl w to "Nudge Clip Selection Down"

Xbutton2:: ;changes the tool to the hand tool while mouse button is held
	click middle
	SendInput, {h}{LButton Down} ;set hand tool to "h"
	KeyWait, Xbutton2
	SendInput, {LButton Up}{v} ;set select tool to v
Return
;=========================================================
;		SPEED MACROS		;Must set ctrl + d to open the speed menu
;=========================================================
^+1:: SendInput, ^d20{ENTER} ;Sets speed(s) to 20(or applicable number)
^+2::SendInput, ^d25{ENTER}
^+3::SendInput, ^d50{ENTER}
^4::SendInput, ^d75{ENTER}
^5::SendInput, ^d100{ENTER}
^6::SendInput, ^d200{ENTER}





/*
;===========================================================================================================================================================================
						OLD
;===========================================================================================================================================================================
F6:: ;how to move mouse on one axis
SetKeyDelay, 0
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseGetPos, xposP, yposP
MouseMove, xposP, 513,, R
Return

F6:: ;how to move mouse on one axis, relative to current position
SetKeyDelay, 0
coordmode, pixel, Screen
coordmode, mouse, Screen
MouseMove, 0, 513,, R
Return
*/

#IfWinNotActive ahk_exe Adobe Premiere Pro.exe
/*
;Detatch a firefox tab

#IfWinActive ahk_exe firefox.exe
F14:: ;detatch a tab when it fails to do so
SendInput, !d
sleep, 100
Send, +{TAB}
sleep, 100
Send, +{TAB}
sleep, 100
Send, +{TAB}
sleep, 200
Send, +{F10}
sleep, 200
Send, v
sleep, 200
Send, w
sleep, 200
Return
*/

;change obs profile
/*
F9::
SendInput, !p
SendInput, {DOWN 7}
SendInput, {ENTER}
Return
*/

/*
;open obs and change its profle

^+!o::  ;====learning how WinActivate works====
Run, C:\Program Files\AHK\obs64.lnk
if WinExist("ahk_exe obs64.exe")
	WinActivate
else
	WinWaitActive, ahk_exe obs64.exe
sleep 1000
SendInput, !p
SendInput, {DOWN 7}
SendInput, {ENTER}
Return
*/

/*
~~~~~~~~~~~~~~~~~Timecode Scripts~~~~~~~~~~~~~~~~~
^!c:: ;moves the mouse to the timecode and copies it  //these were mostly for the beginner tutorial, I don't use anymore
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
SetKeyDelay, 0
MouseGetPos, xposP, yposP
	MouseMove, 79,93
	SendInput, {Click}
	SendInput, ^c
MouseMove, %xposP%, %yposP%
	SendInput, {Click}
blockinput, MouseMoveOff
BlockInput, off
Return

^+c:: ;moves the mouse to the timecode and clicks it
coordmode, pixel, Window
coordmode, mouse, Window
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
SetKeyDelay, 0
	MouseMove, 79,93
	SendInput, {Click}
	SendInput, ^c
blockinput, MouseMoveOff
BlockInput, off
Return
*/