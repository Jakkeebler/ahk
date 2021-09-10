﻿SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.
#SingleInstance Force
#Requires AutoHotkey v2.0-beta.1 ;this script requires AutoHotkey v2.0

;\\CURRENT SCRIPT VERSION\\This is a "script" local version and doesn't relate to the Release Version
;\\v2.4

;\\CURRENT RELEASE VERSION
;\\v2.0

;EnvSet allows you to store information to call later, via EnvGet("Discord") for example, which cuts out the need to write ' A_WorkingDir "\ImageSearch\Discord\photoexample.png" ' for every piece of code
EnvSet("Discord", A_WorkingDir "\ImageSearch\Discord\")
EnvSet("Premiere", A_WorkingDir "\ImageSearch\Premiere\")
EnvSet("Photoshop", A_WorkingDir "\ImageSearch\Photoshop\")
EnvSet("Resolve", A_WorkingDir "\ImageSearch\Resolve\")
EnvSet("VSCode", A_WorkingDir "\ImageSearch\VSCode\")

; ==================================================================================================================================================
;
;		Coordmode \\ Last updated: v2.1.6
;
; ==================================================================================================================================================
coords() ;sets coordmode to "screen"
{
	coordmode "pixel", "screen"
	coordmode "mouse", "screen"
}

coordw() ;sets coordmode to "window"
{
	coordmode "pixel", "window"
	coordmode "mouse", "window"
}

coordc() ;sets coordmode to "caret"
{
	coordmode "caret", "window"
}

; ==================================================================================================================================================
;
;		Tooltip \\ Last updated: v2.3.13
;
; ==================================================================================================================================================
toolFind(message, timeout) ;create a tooltip for errors finding things
;&message is what you want the tooltip to say after "couldn't find"
;&timeout is how many ms you want the tooltip to last
{
	ToolTip("couldn't find " %&message%)
	SetTimer(timeouttime, - %&timeout%)
	timeouttime()
	{
		ToolTip("")
	}
}

toolCust(message, timeout) ;create a tooltip with any message
;&message is what you want the tooltip to say
;&timeout is how many ms you want the tooltip to last
{
	ToolTip(%&message%)
	SetTimer(timeouttime, - %&timeout%)
	timeouttime()
	{
		ToolTip("")
	}
}
; ==================================================================================================================================================
;
;		Blockinput \\ Last updated: v2.0.1
;
; ==================================================================================================================================================
blockOn() ;blocks all user inputs
{
	BlockInput "SendAndMouse"
	BlockInput "MouseMove"
	BlockInput "On"
	;it has recently come to my attention that all 3 of these operate independantly and doing all 3 of them at once is no different to just using "BlockInput "on"" but uh. oops, too late now I guess 
}

blockOff() ;turns off the blocks on user input
{
	blockinput "MouseMoveOff"
	BlockInput "off"
}

; ==================================================================================================================================================
;
;		discord \\ Last updated: v2.4
;
; ==================================================================================================================================================
disc(button) ;This function uses an imagesearch to look for buttons within the right click context menu as defined in the screenshots in \ahk\ImageSearch\disc[button].png
;NOTE THESE WILL ONLY WORK IF YOU USE THE SAME DISPLAY SETTINGS AS ME. YOU WILL LIKELY NEED YOUR OWN SCREENSHOTS AS I HAVE DISCORD ON A VERTICAL SCREEN SO ALL MY SCALING IS WEIRD
;dark theme
;chat font scaling: 20px
;space between message groups: 16px
;zoom level: 100
;saturation; 70%

;&button in the png name of a screenshot of the button you want the function to press
{
	KeyWait(A_PriorKey) ;use A_PriorKey when you're using 2 buttons to activate a macro
	coordw() ;important to leave this as window as otherwise the image search function might try searching your entire screen which isn't desirable. Alternatively, if you move discord around a lot, it might make more sense to just search your whole screen.
	MouseGetPos(&x, &y)
	blockOn()
	click "right" ;this opens the right click context menu on the message you're hovering over
	sleep 50 ;sleep required so the right click context menu has time to open
	If ImageSearch(&xpos, &ypos, 312, 64, 1066, 1479, "*2 " EnvGet("Discord") %&button%) ;These coords define the entire area discord contains text. Recommended to close the right sidebar or do this in a dm so you see the entire area discord normally shows messages. If you constantly move/resize discord you'll have to just search your entire screen instead - which you can do by adjust the coords in these image searches
			MouseMove(%&xpos%, %&ypos%)
	else
		{
			sleep 500 ;this is a second attempt incase discord was too slow and didn't catch the button location the first time
			If ImageSearch(&xpos, &ypos, 312, 64, 1066, 1479, "*2 " EnvGet("Discord") %&button%) ;this line is searching for the location of your selected button. Same goes for above. The coords here are the same as above
				MouseMove(%&xpos%, %&ypos%) ;Move to the location of the button
			else ;if everything fails, this else will trigger
				{
					MouseMove(%&x%, %&y%) ;moves the mouse back to the original coords
					blockOff()
					toolFind("the requested button", "2000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
		}
	Click
	sleep 100
	If ImageSearch(&xdir, &ydir, 330, 1380, 1066, 1461, "*2 " EnvGet("Discord") "DiscDirReply.bmp") ;this is to get the location of the @ notification that discord has on by default when you try to reply to someone. If you prefer to leave that on, remove from the above sleep 100, to the else below. The coords here define just the bottom chat box AND the tiny bar that appears above it when you "reply" to someone
		{
			MouseMove(%&xdir%, %&ydir%) ;moves to the @ location
			Click
			MouseMove(%&x%, %&y%) ;moves the mouse back to the original coords
			blockOff()
		}
	else
		{
			MouseMove(%&x%, %&y%) ;moves the mouse back to the original coords
			blockOff()
			;toolFind("the @ ping button", "500") ;useful tooltip to help you debug when it can't find what it's looking for
			return
		}
}

; ==================================================================================================================================================
;
;		Mouse Drag \\ Last updated: v2.3
;
; ==================================================================================================================================================
mousedrag(tool, toolorig) ;press a button(ideally a mouse button), this script then changes to something similar to a "hand tool" and clicks so you can drag, then you set the hotkey for it to swap back to (selection tool for example)
;&tool is the thing you want the program to swap TO (ie, hand tool, zoom tool, etc)
;&toolorig is the button you want the script to press to bring you back to your tool of choice
{
	click "middle" ;middle clicking helps bring focus to the timeline/workspace you're in, just incase
	SendInput %&tool% "{LButton Down}" 
	KeyWait A_ThisHotkey
	SendInput "{LButton Up}"
	SendInput %&toolorig% 
}

; ==================================================================================================================================================
;
;		better timeline movement \\ Last updated: v2.3.11
;
; ==================================================================================================================================================
timeline(timeline, x1, x2, y1) ;a weaker version of the right click premiere script. Set this to a button (mouse button ideally, or something obscure like ctrl + capslock)
;&timeline in this function defines the y pixel value of the top bar in your video editor that allows you to click it to drag along the timeline
;x1 is the furthest left pixel value of the timeline that will work with your cursor warping up to grab it
;x2 is the furthest right pixel value of the timeline that will work with your cursor warping up to grab it
;y1 is just below the bar that your mouse will be warping to, this way your mouse doesn't try doing things when you're doing other stuff above the timeline
{
	coordw()
	MouseGetPos &xpos, &ypos
	if(%&xpos% > %&x1% and %&xpos% < %&x2%) and (%&ypos% > %&y1%) ;this function will only trigger if your cursor is within the timeline. This ofcourse can break if you accidently move around your workspace
		{
			blockOn()
			MouseMove %&xpos%, %&timeline% ;this will warp the mouse to the top part of your timeline defined by &timeline
			SendInput "{Click Down}"
			MouseMove %&xpos%, %&ypos%
			blockOff()
			KeyWait A_ThisHotkey
			SendInput "{Click Up}"
		}
	else
		return
}

; ==================================================================================================================================================
;
;		Premiere \\ Last updated: v2.4
;
; ==================================================================================================================================================
preset(item) ;this preset is for the drag and drop effect presets in premiere
;&item in this function defines what it will type into the search box (the name of your preset within premiere)
{
	KeyWait(A_PriorKey) ;use A_PriorKey when you're using 2 buttons to activate a macro
	blockOn()
	coords()
	MouseGetPos &xpos, &ypos
		SendInput "^+7" ;set ctrl shift 7 to the "effects window"
		SendInput "^b" ;set ctrl b to "select find box"
		SendInput "^a{DEL}"
		sleep 60
		coordc() ;change caret coord mode to window
		CaretGetPos(&carx, &cary) ;get the position of the caret (blinking line where you type stuff)
		MouseMove %&carx%, %&cary% ;move to the caret (instead of defined pixel coords) to make it less prone to breaking
		SendInput %&item% ;create a preset of any effect, must be in a folder as well
		MouseMove 40, 68,, "R" ;move down to the saved preset (must be in an additional folder)
		SendInput "{Click Down}"
		MouseMove %&xpos%, %&ypos% ;in some scenarios if the mouse moves too fast a video editing software won't realise you're dragging. If this happens to you, add ', "2" ' to the end of this mouse move
		SendInput "{Click Up}"
	blockOff()
}

num(xval, yval, scale) ;this function is to simply cut down repeated code on my numpad punch in scripts. it punches the video into my preset values for highlight videos
;&xval is the pixel value you want this function to paste into the X coord text field in premiere
;&yval is the pixel value you want this function to paste into the y coord text field in premiere
;&scale is the scale value you want this function to paste into the scale text field in premiere
{
	KeyWait(A_PriorHotkey) ;you can use A_PriorHotKey when you're using 1 button to activate a macro
	coordw()
	blockOn()
	MouseGetPos &xpos, &ypos
		SendInput "^+9" ;set ctrl shift 9 to highlight the "timeline"
		SendInput "^{F5}" ;changes the track colour so I know that the clip has been zoomed in
		If ImageSearch(&x, &y, 0, 960, 446, 1087, "*2 " EnvGet("Premiere") "video.png") ;moves to the "video" section of the effects control window tab
			goto next
		else
			{
				MouseMove %&xpos%, %&ypos%
				blockOff()
				toolFind("the video section", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
				return
			}
		;SendInput "{WheelUp 30}" ;no longer required as the function wont finish if it can't find the image
		;MouseMove 122,1060 ;location for "motion"
		next:
		If ImageSearch(&x2, &y2, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "motion2.png") ;moves to the motion tab
			MouseMove(%&x2% + "10", %&y2% + "10")
		else
			{
				If ImageSearch(&x3, &y3, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "\motion3.png") ;this is a second check incase "motion" is already highlighted
					MouseMove(%&x3% + "10", %&y3% + "10")
				else ;if everything fails, this else will trigger
					{
						MouseMove %&xpos%, %&ypos% ;moves back to the original coords
						blockOff()
						toolFind("the motion tab", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
						return
					}
			}
		SendInput "{Click}"
		SendInput "{Tab 2}" %&xval% "{Tab}" %&yval% "{Tab}" %&scale% "{ENTER}"
		SendInput "{Enter}"
		MouseMove %&xpos%, %&ypos%
		blockOff()
}

/* ;not used anymore
fElse(data) ;a preset for the premiere scale, x/y and rotation scripts ;these wont work for resolve in their current form, you could adjust it to fit easily by copying over that code
;&data is what the script is typing in the text box (what your reset values are. ie 960 for a pixel coord, or 100 for scale)
{
	Click "{Click Up}"
	sleep 10
	Send %&data% 
	;MouseMove x, y ;if you want to press the reset arrow, input the windows spy SCREEN coords here then comment out the above Send^
	;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
	sleep 50
	send "{enter}"
}
 */

valuehold(filepath, filepath2, optional) ;a preset to warp to one of a videos values (scale , x/y, rotation) click and hold it so the user can drag to increase/decrease. Also allows for tap to reset.
;&filepath is the png name of the image ImageSearch is going to use to find what value you want to adjust (either with/without the keyframe button pressed)
;&filepath2 is the png name of the image ImageSearch is going to use to find what value you want to adjust (the opposite of above)
;&optional is used to add extra x axis movement after the pixel search. This is used to press the y axis text field in premiere as it's directly next to the x axis text field
{
	coords()
	blockOn()
	MouseGetPos &xpos, &ypos
		If ImageSearch(&x, &y, 0, 911,705, 1354, "*2 " EnvGet("Premiere") %&filepath%) ;finds the value you want to adjust, then finds the value adjustment to the right of it
			{
				If PixelSearch(&xcol, &ycol, %&x%, %&y%, %&x% + "740", %&y% + "40", 0x288ccf, 3) ;searches for the blue text to the right of the value you want to adjust
					MouseMove(%&xcol% + %&optional%, %&ycol%)
				else
					{
						blockOff()
						toolFind("the blue text", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
						return
					}			
			}
		else ;this is for when you have the "toggle animation" keyframe button pressed
			{
                If ImageSearch(&x, &y, 0, 911,705, 1354, "*2 " EnvGet("Premiere") %&filepath2%) ;finds the value you want to adjust, then finds the value adjustment to the right of it
                    {
                        If PixelSearch(&xcol, &ycol, %&x%, %&y%, %&x% + "740", %&y% + "40", 0x288ccf, 3) ;searches for the blue text to the right of the value you want to adjust
                            MouseMove(%&xcol% + %&optional%, %&ycol%)
                        else
                            {
                                blockOff()
                                toolFind("the blue text", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
                                return
                            }			
                    }
				else ;if everything fails, this else will trigger
					{
						blockOff()
						toolFind("the image", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
						return
					}		
			}
		sleep 100 ;required, otherwise it can't know if you're trying to tap to reset
		if GetKeyState(A_ThisHotkey, "P")
			{
				SendInput "{Click Down}"
				blockOff()
				KeyWait A_ThisHotkey
				SendInput "{Click Up}"
				MouseMove %&xpos%, %&ypos%
			}
		else
			{
				If ImageSearch(&x2, &y2, %&x%, %&y% - "10", %&x% + "1500", %&y% + "20", "*2 " EnvGet("Premiere") "reset.png") ;searches for the reset button to the right of the value you want to adjust
					{
						MouseMove(%&x2%, %&y2%)
						SendInput("{Click}")
					}
				else ;if everything fails, this else will trigger
					{
						MouseMove %&xpos%, %&ypos%
						blockOff()
						toolFind("the reset button", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
						return
					}
				MouseMove %&xpos%, %&ypos%
				blockOff()
			}
}
; ==================================================================================================================================================
;
;		Photoshop \\ Last updated: v2.4
;
; ==================================================================================================================================================
psProp(image) ;a preset to warp to one of a photos values values (scale , x/y, rotation) click and hold it so the user can drag to increase/decrease.
;&image is the png name of the image that imagesearch will use
{
	coords()
	MouseGetPos &xpos, &ypos
	coordw()
	blockOn()
	If ImageSearch(&xdec, &ydec, 60, 30, 744, 64, "*5 " EnvGet("Photoshop") "text2.png") ;checks to see if you're typing
		SendInput("^{Enter}")
	If ImageSearch(&xdec, &ydec, 60, 30, 744, 64, "*5 " EnvGet("Photoshop") "text.png") ;checks to see if you're in the text tool
		SendInput("v") ;if you are, it'll press v to go to the selection tool
	If ImageSearch(&xdec, &ydec, 60, 30, 744, 64, "*5 " EnvGet("Photoshop") "InTransform.png") ;checks to see if you're already in the free transform window
		{
			If ImageSearch(&x, &y, 60, 30, 744, 64, "*5 " EnvGet("Photoshop") %&image%) ;if you are, it'll then search for your button of choice and move to it
				MouseMove(%&x%, %&y%)
			else ;if everything fails, this else will trigger
				{
					blockOff()
					toolFind("the value you wish`nto adjust_1", "1000")
					return
				}
		}
	else
		{
			SendInput("^t") ;if you aren't in the free transform it'll simply press ctrl t to get you into it
			ToolTip("we must wait for photoshop`nbecause it's slow as hell")
			sleep 300 ;photoshop is slow
			ToolTip("")
			If ImageSearch(&x, &y, 111, 30, 744, 64, "*5 " EnvGet("Photoshop") %&image%) ;moves to the position variable
				MouseMove(%&x%, %&y%)
			else ;if everything fails, this else will trigger
				{
					MouseMove %&xpos%, %&ypos%
					blockOff()
					toolFind("the value you wish`nto adjust_2", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
		}		
		sleep 100 ;this sleep is necessary for the "tap" functionality below (in the 'else') to work
		SendInput "{Click Down}"
			if GetKeyState(A_ThisHotkey, "P")
			{
				blockOff()
				KeyWait A_ThisHotkey
				SendInput "{Click Up}"
				MouseMove %&xpos%, %&ypos%
			}
			else ;since we're in photoshop here, we'll simply make the "tap" functionality have ahk hit enter twice so it exits out of the free transform
			{
				Click "{Click Up}"
				;fElse(%&data%) ;check MS_functions.ahk for the code to this preset
				MouseMove %&xpos%, %&ypos%
				SendInput("{Enter 2}")
				blockOff()
				return
			}
}

; ==================================================================================================================================================
;
;		Resolve \\ Last updated: v2.4
;
; ==================================================================================================================================================
Rscale(item) ;to set the scale of a video within resolve
;&item is the number you want to type into the text field (100% in reslove requires a 1 here for example)
;this function, as you can probably tell, doesn't use an imagesearch. It absolutely SHOULD, but I don't use resolve and I guess I just never got around to coding in an imagesearch.
{
	KeyWait(A_PriorKey) ;use A_PriorKey when you're using 2 buttons to activate a macro
	coordw()
	blockOn()
	MouseGetPos &xpos, &ypos
		click "2333, 218" ;clicks on video
		SendInput %&item%
		SendInput "{ENTER}"
		click "2292, 215" ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again.  Using the arrow would honestly be faster here
	MouseMove %&xpos%, %&ypos%
	blockOff()
}

rfElse(data) ;a preset for the resolve scale, x/y and rotation scripts
;&data is what the script is typing in the text box to reset its value
;this function, as you can probably tell, doesn't use an imagesearch. It absolutely SHOULD, but I don't use resolve and I guess I just never got around to coding in an imagesearch.
{
	SendInput "{Click Up}"
	sleep 10
	Send %&data%
	;MouseMove, x, y ;if you want to press the reset arrow, input the windowspy SCREEN coords here then comment out the above Send^
	;click ;if you want to press the reset arrow, uncomment this, remove the two lines below
	;alternatively you could also run imagesearches like in the other resolve functions to ensure you always end up in the right place
	sleep 10
	send "{enter}"
	click "2295, 240" ;resolve is a bit weird if you press enter after text, it still lets you keep typing numbers, to prevent this, we just click somewhere else again.
}

REffect(folder1, folder2, effect) ;apply any effect to the clip you're hovering over.
;&folder1 is the path directory to a screenshot of the drop down sidebar option (in the effects window) you WANT to be active - ACTIVATED
;&folder2 is the path directory to a screenshot of the drop down sidebar option (in the effects window) you WANT to be active - NOT ACTIVATED
;&effect is the name of the effect you want this function to type into the search box

;This function will, in order;
;Check to see if the effects window is open on the left side of the screen
;Check to make sure the effects sidebar is expanded
;Ensure you're clicked on the appropriate drop down
;Open or close/reopen the search bar
;Search for your effect of choice, then drag back to the click you were hovering over originally
{
	KeyWait(A_PriorKey) ;use A_PriorKey when you're using 2 buttons to activate a macro
	coordw() ;
	blockOn()
	MouseGetPos &xpos, &ypos
	If ImageSearch(&xe, &ye, 8, 8, 618, 122, "*1 " EnvGet("Resolve") "effects.png") ;checks to see if the effects button is deactivated
		{
			MouseMove(%&xe%, %&ye%)
			SendInput("{Click}")
			goto closeORopen
		}
	else
		{
			If ImageSearch(&xe, &ye, 8, 8, 618, 122, "*1 " EnvGet("Resolve") "effects2.png") ;checks to see if the effects button is activated
				goto closeORopen
			else ;if everything fails, this else will trigger
				{
					blockOff()
					toolFind("the effects button", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
		}
closeORopen:
;MsgBox("close/open")
	If ImageSearch(&xopen, &yopen, 8, 114, 617, 1358, "*2 " EnvGet("Resolve") "open.png") ;checks to see if the effects window sidebar is open
		goto EffectFolder
	else
		{
			If ImageSearch(&xclosed, &yclosed, 8, 114, 617, 1358, "*2 " EnvGet("Resolve") "closed.png") ;checks to see if the effects window sidebar is closed
				{
					MouseMove(%&xclosed%, %&yclosed%)
					SendInput("{Click}")
					goto EffectFolder
				}
			else
				{
					blockOff()
					toolFind("open/close button", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
		}
EffectFolder:
;MsgBox("effect folder")
	If ImageSearch(&xfx, &yfx, 8, 114, 617, 1358, "*2 " EnvGet("Resolve") %&folder1%) ;checks to see if the drop down option you want is activated
		goto SearchButton
	else
		{
			If ImageSearch(&xfx, &yfx, 8, 114, 617, 1358, "*2 " EnvGet("Resolve") %&folder2%) ;checks to see if the drop down option you want is deactivated
				{
					MouseMove(%&xfx%, %&yfx%)
					SendInput("{Click}")
					goto SearchButton
				}
			else ;if everything fails, this else will trigger
				{
					blockOff()
					toolFind("the fxfolder", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}	
		}
SearchButton:
;MsgBox("search button")
	If ImageSearch(&xs, &ys, 8, 118, 617, 1356, "*2 " EnvGet("Resolve") "search2.png") ;checks to see if the search icon is deactivated
		{
			MouseMove(%&xs%, %&ys%)
			SendInput("{Click 2}")
			goto final
		}
	else
	{
		If ImageSearch(&xs, &ys, 8, 118, 617, 1356, "*2 " EnvGet("Resolve") "search3.png") ;checks to see if the search icon is activated
			{
				MouseMove(%&xs%, %&ys%)
				SendInput("{Click 2}")
				goto final
			}
		else ;if everything fails, this else will trigger
			{
				blockOff()
				toolFind("search button", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
				return
			}
	}
final:
;MsgBox("final")
	sleep 50
	SendInput(%&effect%)
	MouseMove(0, 130,, "R")
	SendInput "{Click Down}"
	MouseMove %&xpos%, %&ypos%, 2 ;moves the mouse at a slower, more normal speed because resolve doesn't like it if the mouse warps instantly back to the clip
	SendInput "{Click Up}"
	blockOff()
	return
}

rvalhold(image1, image2, plus, rfelseval) ;this function provides similar functionality to my valuehold() function for premiere
;&image1 is the png name of a screenshot of the property you wish to adjust (either activated or not)
;&image2 is the png name of a screenshot of the property you wish to adjust (oppisite to above)
;&plus is the pixel value you wish to add to the x value to grab the Y value
;&rfelseval is the value you wish to pass to rfelse()
{
	coordw()
	blockOn()
	MouseGetPos &xpos, &ypos
	If ImageSearch(&xi, &yi, 2142, 33, 2561, 115, "*2 " EnvGet("Resolve") "inspector.png")
		goto video
	else
		{
			If ImageSearch(&xi, &yi, 2142, 33, 2561, 115, "*2 " EnvGet("Resolve") "inspector2.png")
				{
					MouseMove(%&xi%, %&yi%)
					click ;this opens the inspector tab
					goto video
				}
		}
	video:
	If ImageSearch(&xn, &yn, 2148, 116, 2562, 169, "*5 " EnvGet("Resolve") "video.png") ;if you're already in the video tab, it'll find this image then move on
		goto rest
	else
		{
			If ImageSearch(&xn, &yn, 2148, 116, 2562, 169, "*5 " EnvGet("Resolve") "videoN.png") ;if you aren't already in the video tab, this line will search for it
					{
						MouseMove(%&xn%, %&yn%)
						click ;"2196 139" ;this highlights the video tab
					}
			else
				{
					blockOff()
					MouseMove %&xpos%, %&ypos%
					toolFind("video tab", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
		}
	rest:
	;MouseMove 2329, 215 ;moves to the scale value.
	if ImageSearch(&xz, &yz, 2147, 86, 2561, 750, "*5 " EnvGet("Resolve") %&image1%) ;searches for the zoom property
		MouseMove(%&xz% + %&plus%, %&yz% + "5") ;moves the mouse to the value next to zoom. This function assumes x/y are linked
	else
		{
			if ImageSearch(&xz, &yz, 2147, 86, 2561, 750, "*5 " EnvGet("Resolve") %&image2%) ;if you've already adjusted values in resolve, their text slightly changes colour, this pass is just checking for that instead
				MouseMove(%&xz% + %&plus%, %&yz% + "5")
			else
				{
					toolFind("zoom", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
		}
	sleep 100
	SendInput "{Click Down}"	
	if GetKeyState(A_ThisHotkey, "P")
		{
			blockOff()
			KeyWait A_ThisHotkey
			SendInput "{Click Up}"
			MouseMove %&xpos%, %&ypos%
		}
	else
		{
			rfElse(%&rfelseval%) ;do note rfelse doesn't use any imagesearch information and just uses raw pixel values (not a great idea), so if you have any issues, do look into changing that
			MouseMove %&xpos%, %&ypos%
			blockOff()
			return
		}
}

rflip(button1, button2) ;this function searches for and presses the horizontal/vertical flip button
;&button1 is the png name of a screenshot of the button you wish to click (either activated or deactivated)
;&button2 is the png name of a screenshot of the button you wish to click (oppisite to above)
{
	coordw()
	blockOn()
	MouseGetPos &xpos, &ypos
	If ImageSearch(&xn, &yn, 2148, 116, 2562, 169, "*5 " EnvGet("Resolve") "videoN.png") ;makes sure the video tab is selected
		{
			MouseMove(%&xn%, %&yn%)
			click
		}
	If ImageSearch(&xh, &yh, 2146, 168, 2556, 382, "*5 " EnvGet("Resolve") %&button1%) ;searches for the button when it isn't activated already
		{
			MouseMove(%&xh%, %&yh%)
			click
			MouseMove %&xpos%, %&ypos%
			blockOff()
			return
		}
	else
		{
			If ImageSearch(&xho, &yho, 2146, 168, 2556, 382, "*5 " EnvGet("Resolve") %&button2%) ;searches for the button when it is activated already
				{
					MouseMove(%&xho%, %&yho%)
					click 
					MouseMove %&xpos%, %&ypos%
					blockOff()
					return
				}
			else
				{
					blockOff()
					MouseMove %&xpos%, %&ypos%
					toolFind("desired button", "1000")
				}
		}
}

; ==================================================================================================================================================
;
;		VSCode \\ Last updated: v2.4
;
; ==================================================================================================================================================
vscode(script) ;a script to quickly naviate between my scripts
;&script is just what script I want to open
{
	KeyWait(A_PriorKey)
	coords()
	blockOn()
	MouseGetPos(&x, &y)
	If ImageSearch(&xex, &yex, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") "explorer.png")
		{
			MouseMove(%&xex%, %&yex%)
			SendInput("{Click}")
			MouseMove(%&x%, %&y%)
			sleep 50
		}
	If ImageSearch(&xpos, &ypos, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") %&script% "_Changes.png")
		goto click
	else
		{
			If ImageSearch(&xpos, &ypos, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") %&script% "_nochanges.png")
				goto click
			else
				{
					If ImageSearch(&xpos, &ypos, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") %&script% "_red.png")
						goto click
					else
						{
							If ImageSearch(&xpos, &ypos, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") %&script% "_Highlighted.png")
								{
									blockOff()
									toolCust("you're already in the &" %&script% A_Space "script`nyou dork", "2000")
									return
								}
							else
								{
									If ImageSearch(&xpos, &ypos, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") %&script% "_ChangesHighlighted.png")
										{
											blockOff()
											toolCust("you're already in the &" %&script% A_Space "script`nyou dork", "2000")
											return
										}
									else
										{
											If ImageSearch(&xpos, &ypos, 0, 0, 460, 1390, "*2 " EnvGet("VSCode") %&script% "_redHighlighted.png")
												{
													blockOff()
													toolCust("you're already in the &" %&script% A_Space "script`nyou dork", "2000")
													return
												}
											else
												{
													blockOff()
													toolFind("the script", "1000")
													return
												}
										}
								}
						}
				}
		}
	click:
	MouseMove(%&xpos%, %&ypos%)
	SendInput("{Click}")
	MouseMove(%&x%, %&y%)
	blockOff()
}

; ==================================================================================================================================================
;
;		QMK Stuff \\ Last updated: v2.4
;
; ==================================================================================================================================================
;All of these functions are just to allow QMK Keyboard.ahk to be more readable
movepreview() ;press then hold this hotkey and drag to move position. Let go of this hotkey to confirm, Simply Tap this hotkey to reset values
{
	coords()
	blockOn()
	MouseGetPos &xpos, &ypos
	If ImageSearch(&x, &y, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "motion.png") ;moves to the motion tab
			MouseMove(%&x% + "25", %&y%)
	else
		{
			blockOff()
			toolFind("the motion tab", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
			return
		}

	sleep 100
	if GetKeyState(A_ThisHotkey, "P") ;gets the state of the f4 key, enough time now has passed that if I just press the button, I can assume I want to reset the paramater instead of edit it
		{ ;you can simply double click the preview window to achieve the same result in premiere, but doing so then requires you to wait over .5s before you can reinteract with it which imo is just dumb, so unfortunately clicking "motion" is both faster and more reliable to move the preview window
			Click
			MouseMove 2300, 238 ;move to the preview window
			SendInput "{Click Down}"
			blockOff()
			KeyWait A_ThisHotkey
			SendInput "{Click Up}"
			;MouseMove %&xpos%, %&ypos% ; // moving the mouse position back to origin after doing this is incredibly disorienting
		}
	else
		{
			;MouseMove 352, 1076 ;move to the reset arrow
			if ImageSearch(&xcol, &ycol, 8, 1049, 589, 1090, "*2 " EnvGet("Premiere") "reset.png") ;these coords are set higher than they should but for whatever reason it only works if I do that????????
					MouseMove(%&xcol%, %&ycol%)
			else ;if everything fails, this else will trigger
				{
					blockOff()
					MouseMove %&xpos%, %&ypos%
					toolFind("the reset button", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}
			Click
			sleep 50
			MouseMove %&xpos%, %&ypos%
			blockOff()
		}
}

reset() ;This script moves to the reset button to reset the "motion" effects
{
	KeyWait(A_PriorHotkey) ;you can use A_PriorHotKey when you're using 1 button to activate a macro
	coordw()
	blockOn()
	MouseGetPos &xpos, &ypos
	If ImageSearch(&x2, &y2, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "motion2.png") ;checks if the "motion" value is in view
		goto inputs
	else
		{
			If ImageSearch(&x2, &y2, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "motion3.png") ;checks if the "motion" value is in view
				goto inputs
			else
				{
					blockOff()
					toolFind("the motion value", "1000")
					return
				}
		}
	inputs:
		SendInput "^+9"
		SendInput "^{F1}" ;highlights the timeline, then changes the track colour so I know that clip has been zoomed in
		;MouseMove 359, 1063 ;location for the reset arrow
		if ImageSearch(&xcol, &ycol, %&x2%, %&y2% - "20", %&x2% + "700", %&y2% + "20", "*2 " EnvGet("Premiere") "reset.png") ;this will look for the reset button directly next to the "motion" value
			MouseMove(%&xcol%, %&ycol%)
		;SendInput, {WheelUp 10} ;not necessary as we use imagesearch to check for the motion value
		click
	MouseMove %&xpos%, %&ypos%
	blockOff()
}

manScale(key1, key2, keyend) ;a script that will warp to and press the scale button in premiere to manually input a value
;&key1 is the hotkey you use to activate this function
;&key2 is the other hotkey you use to activate this function (if you only use 1 button to activate it, remove one of the keywaits and this variable)
;&keyend is whatever key you want the function to wait for before finishing
{
	coords()
	BlockInput "MouseMove"
	BlockInput "On"
	MouseGetPos &xpos, &ypos
	If ImageSearch(&x, &y, 0, 911,705, 1354, "*2 " EnvGet("Premiere") "scale.png") ;finds the scale value you want to adjust, then finds the value adjustment to the right of it
		{
			If PixelSearch(&xcol, &ycol, %&x%, %&y%, %&x% + "740", %&y% + "40", 0x288ccf, 3) ;searches for the blue text to the right of the scale value
				MouseMove(%&xcol%, %&ycol%)
			else
				{
					blockOff()
					toolFind("the blue text", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}			
		}
	else ;this is for when you have the "toggle animation" keyframe button pressed
		{
			If ImageSearch(&x, &y, 0, 911,705, 1354, "*2 " EnvGet("Premiere") "scale2.png") ;finds the scale value you want to adjust, then finds the value adjustment to the right of it
				{
					If PixelSearch(&xcol, &ycol, %&x%, %&y%, %&x% + "740", %&y% + "40", 0x288ccf, 3) ;searches for the blue text to the right of the scale value
						MouseMove(%&xcol%, %&ycol%)
					else
						{
							blockOff()
							toolFind("the blue text", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
							return
						}			
				}
			else ;if everything fails, this else will trigger
				{
					blockOff()
					toolFind("scale", "1000") ;useful tooltip to help you debug when it can't find what it's looking for
					return
				}		
		}
	KeyWait(%&key1%) ;waits for you to let go of hotkey
	KeyWait(%&key2%) ;waits for you to let go of hotkey
	SendInput "{Click}"
	KeyWait(%&keyend%, "D") ;waits until the final hotkey is pressed before continuing
	SendInput("{Enter}")
	MouseMove %&xpos%, %&ypos%
	Click("middle")
	blockOff()
}

gain(amount) ;a macro to increase/decrease gain. This macro will check to ensure the timeline is in focus and a clip is selected
;&amount is the value you want the gain to adjust (eg. -2, 6, etc)
{
	KeyWait(A_PriorHotkey) ;you can use A_PriorHotKey when you're using 1 button to activate a macro
	ControlFocus "DroverLord - Window Class3" , "Adobe Premiere Pro 2021"
	If ImageSearch(&x3, &y3, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "noclips.png") ;checks to see if there aren't any clips selected as if it isn't, you'll start inputting values in the timeline instead of adjusting the gain
		{
			SendInput("^+9" "d")
			goto inputs
		}
	else
		{
			classNN := ControlGetClassNN(ControlGetFocus("A"))
			if "DroverLord - Window Class3"
				goto inputs
			else
				{
					toolCust("gain macro couldn't figure`nout what to do", "1000")
					return
				}
		}
	inputs:
	SendInput "g" "+{Tab}{UP 3}{DOWN}{TAB}" %&amount% "{ENTER}"
}

gainSecondary() ;a macro to open up the gain menu. This macro will check to ensure the timeline is in focus and a clip is selected
{
KeyWait(A_PriorHotkey) ;you can use A_PriorHotKey when you're using 1 button to activate a macro
	ControlFocus "DroverLord - Window Class3" , "Adobe Premiere Pro 2021"
	If ImageSearch(&x3, &y3, 1, 965, 624, 1352, "*2 " EnvGet("Premiere") "noclips.png") ;checks to see if there aren't any clips selected as if it isn't, you'll start inputting values in the timeline instead of adjusting the gain
		{
			SendInput("^+9" "d")
			goto inputs
		}
	else
		{
			classNN := ControlGetClassNN(ControlGetFocus("A"))
			if "DroverLord - Window Class3"
				goto inputs
			else
				{
					toolCust("gain macro couldn't figure`nout what to do", "1000")
					return
				}
		}
	inputs:
	SendInput "g"
}

; ==================================================================================================================================================
;
;		Fkey AutoLaunch \\ Last updated: v2.2
;
; ==================================================================================================================================================
switchToExplorer()
{
;switchToExplorer(){
if not WinExist("ahk_class CabinetWClass")
	Run "explorer.exe"
GroupAdd "explorers", "ahk_class CabinetWClass"
if WinActive("ahk_exe explorer.exe")
	GroupActivate "explorers", "r"
else
	if WinExist("ahk_class CabinetWClass")
	WinActivate "ahk_class CabinetWClass" ;you have to use WinActivatebottom if you didn't create a window group.
}

switchToPremiere()
{
;switchToPremiere(){
if not WinExist("ahk_class Premiere Pro")
	{
	;Run, Adobe Premiere Pro.exe
	;Adobe Premiere Pro CC 2017
	; Run, C:\Program Files\Adobe\Adobe Premiere Pro CC 2017\Adobe Premiere Pro.exe ;if you have more than one version instlaled, you'll have to specify exactly which one you want to open.
	Run "Adobe Premiere Pro.exe"
	}
else
	if WinExist("ahk_class Premiere Pro")
	WinActivate "ahk_class Premiere Pro"
}

switchToFirefox()
{
;switchToFirefox(){
sendinput "{SC0E8}" ;scan code of an unassigned key. Do I NEED this?
if not WinExist("ahk_class MozillaWindowClass")
	Run "firefox.exe"
if WinActive("ahk_exe firefox.exe")
	{
	Class := WinGetClass("A")
	;WinGetClass class, A
	if (class = "Mozillawindowclass1")
		msgbox "this is a notification"
	}
if WinActive("ahk_exe firefox.exe")
	Send "^{tab}"
else
	{
		if WinExist("ahk_exe firefox.exe")
			;WinRestore ahk_exe firefox.exe
				WinActivate "ahk_exe firefox.exe"
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	;Controls := WinGetControlsHwnd("ahk_class MozillaWindowClass")
	;WinGet hWnd ID ahk_class MozillaWindowClass
	;Result := DllCall("SetForegroundWindow UInt hWnd")
	;DllCall("SetForegroundWindow" UInt hWnd) 
	}
}

switchToOtherFirefoxWindow()
{
;switchToOtherFirefoxWindow(){
;sendinput, {SC0E8} ;scan code of an unassigned key

;Process Exist firefox.exe
;msgbox errorLevel `n%errorLevel%
	If (PID := ProcessExist("firefox.exe"))
	{
	GroupAdd "firefoxes", "ahk_class MozillaWindowClass"
	if WinActive("ahk_class MozillaWindowClass")
		GroupActivate "firefoxes", "r"
	else
		WinActivate "ahk_class MozillaWindowClass"
	}
	else
	Run "firefox.exe"
}

switchToVSC()
{
;switchToVSCodehub(){
if not WinExist("ahk_exe Code.exe")
	Run "C:\Users\Tom\AppData\Local\Programs\Microsoft VS Code\Code.exe"
GroupAdd "Code", "ahk_class Chrome_WidgetWin_1"
if WinActive("ahk_exe Code.exe")
	GroupActivate "Code", "r"
else
	if WinExist("ahk_exe Code.exe")
	WinActivate "ahk_exe Code.exe" ;you have to use WinActivatebottom if you didn't create a window group.
}

switchToGithub()
{
;switchToGithub(){
if not WinExist("ahk_exe GitHubDesktop.exe")
	Run "C:\Users\Tom\AppData\Local\GitHubDesktop\GitHubDesktop.exe"
GroupAdd "git", "ahk_class Chrome_WidgetWin_1"
if WinActive("ahk_exe GitHubDesktop.exe")
	GroupActivate "git", "r"
else
	if WinExist("ahk_exe GitHubDesktop.exe")
	WinActivate "ahk_exe GitHubDesktop.exe" ;you have to use WinActivatebottom if you didn't create a window group.
}

switchToStreamdeck()
{
;switchToStreamdeck(){
if not WinExist("ahk_exe StreamDeck.exe")
	Run "C:\Program Files\Elgato\StreamDeck\StreamDeck.exe"
GroupAdd "stream", "ahk_class Qt5152QWindowIcon"
if WinActive("ahk_exe StreamDeck.exe")
	GroupActivate "stream", "r"
else
	if WinExist("ahk_exe Streamdeck.exe")
	WinActivate "ahk_exe StreamDeck.exe" ;you have to use WinActivatebottom if you didn't create a window group.
}

switchToExcel()
{
	if not WinExist("ahk_exe EXCEL.EXE")
		Run A_ProgramFiles "\Microsoft Office\root\Office16\EXCEL.EXE"
	GroupAdd "xlmain", "ahk_class XLMAIN"
	if WinActive("ahk_exe EXCEL.EXE")
		GroupActivate "xlmain", "r"
	else
		if WinExist("ahk_exe EXCEL.EXE")
		WinActivate "ahk_exe EXCEL.EXE"
}

switchToWindowSpy()
{
	if not WinExist("WindowSpy.ahk")
		Run A_ProgramFiles "\AutoHotkey\WindowSpy.ahk"
	GroupAdd "winspy", "ahk_class AutoHotkeyGUI"
	if WinActive("WindowSpy.ahk")
		GroupActivate "winspy", "r"
	else
		if WinExist("WindowSpy.ahk")
		WinActivate "WindowSpy.ahk" ;you have to use WinActivatebottom if you didn't create a window group.
}


; ==================================================================================================================================================
; Old
; ==================================================================================================================================================
/* ;this was the old way of doing the discord functions (v2.0.7) that included just right clicking and making the user do things. I've saved the one with all variations of code it went through, the other two have been removed for cleanup as they were functionally identical
;PLEASE NOTE, I ORIGINALLY HAD THIS SCRIPT WARP THE MOUSE TO CERTAIN POSITIONS TO HIT THE RESPECTIVE BUTTONS BUT THE POSITION OF BUTTONS IN DISCORD WITHIN THE RIGHT CLICK CONTEXT MENU CHANGE DEPENDING ON WHAT PERMS YOU HAVE IN A SERVER, SO IT WOULD ALWAYS TRY TO DO RANDOM THINGS LIKE PIN A MESSAGE OR OPEN A THREAD. There isn't really anything you can do about that. I initially tried to just send through multiple down/up inputs but apparently discord rate limits you to like 1 input every .5-1s so that's fun.
discedit()
{
	{
		coords()
		MouseGetPos(&x, &y)
		blockOn()
		if(%&y% > 876) ;this value will need to be adjusted per your monitor. Because my monitor is rotated to sit vertically, "lower" on my screen is actually a higher y pixel value, hence the > instead of <
			{
				click "right"
				MouseMove(%&x%, 948) ;this value will need to be adjusted per your monitor - it's where the edit button sits when your mouse is towards the bottom of discord
				MouseMove(29, 0,, "R")
				;blockOff()
				;keywait "LButton", "D" ;tried to make it so the user presses the button you want since it moves everywhere depending on what perms you have in a server
				;click					;but it was too disorienting to make the user move, click, then warp the mouse back to the og position so
				;MouseMove(%&x%, %&y%)	;this is the best you can do here with the limitations of discord
			}
		else
			{
				click "right"
				MouseMove(29, 111,, "R") ;the y value here will need to be adjusted per your monitor
				;blockOff()				;I'll preserve this code in this first script, but remove it from the following two examples
				;keywait "LButton", "D"
				;click
				;MouseMove(%&x%, %&y%)
			}
		blockOff()
	}
}

this is the original way of doing value hold. Theoretically this isn't that bad, but if I move my effect controls too much, it would theoretically break
valuehold(x1, y1, x2, y2, button, data, optional) ;a preset to warp to one of a videos values (scale , x/y, rotation) click and hold it so the user can drag to increase/decrease. Also allows for tap to reset.
;&x1 is the pixel value for the first x coord for PixelSearch
;&y1 is the pixel value for the first y coord for PixelSearch
;&x2 is the pixel value for the second x coord for PixelSearch
;&y2 is the pixel value for the second y coord for PixelSearch
;&button is what button the function is being activated by (if you call this function from F1, put F1 here for example)
;&data is what the script is typing in the text box (what your reset values are. ie 960 for a pixel coord, or 100 for scale)
;&optional is used to add extra x axis movement after the pixel search. This is used to press the y axis text field in premiere as it's directly next to the x axis text field
{
	coords()
	blockOn()
	MouseGetPos &xpos, &ypos
		;MouseMove 226, 1079 ;move to the "x" value
		;If ImageSearch(&x, &y, 1, 965, 624, 1352, "*2 " A_WorkingDir "\ImageSearch\Premiere\position.png") ;moves to the position variable ;using an imagesearch here like this is only useful if I make the mouse move across until it "finds" the blue text. idk how to do that yet so this is getting commented out for now
			;MouseMove(%&x%, %&y%)
		If PixelSearch(&xcol, &ycol, %&x1%, %&y1%, %&x2%, %&y2%, 0x288ccf, 3) ;looks for the blue text to the right of scale
			MouseMove(%&xcol% + %&optional%, %&ycol%)
		sleep 100
		SendInput "{Click Down}"
			if GetKeyState(%&button%, "P")
			{
				blockOff()
				KeyWait %&button%
				SendInput "{Click Up}"
				MouseMove %&xpos%, %&ypos%
			}
			else
			{
				fElse(%&data%) ;check MS_functions.ahk for the code to this preset
				MouseMove %&xpos%, %&ypos%
				blockOff()
			}
}

gain() ;old gain code (v2.3.14)to use imagesearch instead of the ClassNN information
	/*
	If ImageSearch(&x3, &y3, 1, 965, 624, 1352, "*2 " A_WorkingDir "\ImageSearch\Premiere\motion2.png")
		goto inputs
	else
		{
			If ImageSearch(&x3, &y3, 1, 965, 624, 1352, "*2 " A_WorkingDir "\ImageSearch\Premiere\motion3.png") ;checks to see if the "motion" tab is highlighted as if it is, you'll start inputting values in that tab instead of adjusting the gain
				{
					SendInput("^+9") ;selects the timeline
					goto inputs
				}
			else
				{
					If ImageSearch(&x3, &y3, 1, 965, 624, 1352, "*2 " A_WorkingDir "\ImageSearch\Premiere\noclips.png") ;checks to see if there aren't any clips selected as if it isn't, you'll start inputting values in the timeline instead of adjusting the gain
						{
							SendInput("^+9" "d")
							goto inputs
						}
					else
						{
							toolCust("gain macro couldn't figure`nout what to do", "1000")
							return
						}
				}
		} */