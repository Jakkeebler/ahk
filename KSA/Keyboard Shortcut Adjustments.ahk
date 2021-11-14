;All filepaths are absolute since this script gets #Include(ed) in other scripts that have different WorkingDir(s) than this one
;[Premiere]

;==activate windows==

/*
 This value will send the keyboard shortcut you have set to activate the Effect Controls Window within Premiere.
 
 Can be set within KSA.ahk/ini
 */
effectControls := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Effect Controls")

/*
 This value will send the keyboard shortcut you have set to activate the Media Browser Window within Premiere.
 
 Can be set within KSA.ahk/ini
 */
mediaBrowser := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Media Browser")

/*
 This value will send the keyboard shortcut you have set to activate the Projects Window within Premiere.
 
 Can be set within KSA.ahk/ini
 */
projectsWindow := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Projects")

/*
 This value will send the keyboard shortcut you have set to activate the Effects Window within Premiere.
 
 Can be set within KSA.ahk/ini
 */
effectsWindow := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Effects")

/*
 This value will send the keyboard shortcut you have set to activate the timeline Window within Premiere.
 
 Can be set within KSA.ahk/ini
 */
timelineWindow := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Timeline")

;==tools==
/*
 This value will send the keyboard shortcut you have set to swap to the hand tool within Premiere

 Can be set within KSA.ahk/ini
 */
handPrem := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Hand")

/*
 This value will send the keyboard shortcut you have set to swap to the selection tool within Premiere

 Can be set within KSA.ahk/ini
 */
selectionPrem := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Selection")

;==other shortcuts==
/*
 This value will send the keyboard shortcut you have set to select the find box within Premiere

 Can be set within KSA.ahk/ini
 */
findBox := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Find Box")

/*
 This value will send the keyboard shortcut you have set to open the gain menu within Premiere

 Can be set within KSA.ahk/ini
 */
gainAdjust := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Gain")

/*
 This value will send the keyboard shortcut you have set to zoom out of the timeline within Premiere

 Can be set within KSA.ahk/ini
 */
zoomOut := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Zoom Out")

/*
 This value will send the keyboard shortcut you have set to create a new text layer within Premiere

 Can be set within KSA.ahk/ini
 */
newText := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "New Text Layer")

/*
 This value will send the keyboard shortcut you have set to go to the next edit point within Premiere

 Can be set within KSA.ahk/ini
 */
nextEditPoint := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Next Edit Point")

/*
 This value will send the keyboard shortcut you have set to go to the previous edit point within Premiere

 Can be set within KSA.ahk/ini
 */
previousEditPoint := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Previous Edit Point")

/*
 This value will send the keyboard shortcut you have set to nudge down clips on the timeline within Premiere

 Can be set within KSA.ahk/ini
 */
nudgeDown := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Nudge Clip Down")

/*
 This value will send the keyboard shortcut you have set to select the clip at playhead within Premiere

 Can be set within KSA.ahk/ini
 */
selectAtPlayhead := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Select at Playhead")

/*
 This value will send the keyboard shortcut you have set to deselect all within Premiere

 Can be set within KSA.ahk/ini
 */
deselectAll := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Deselect All")

/*
 This value will send the keyboard shortcut you have set to open the speed menu within Premiere

 Can be set within KSA.ahk/ini
 */
speedMenu := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Speed")

/*
 This value will send the keyboard shortcut you have set to move the playhead to the cursor within Premiere

 Can be set within KSA.ahk/ini
 */
playheadtoCursor := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Playhead to Cursor")

;==Labels==
labelViolet := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Violet")
labelIris := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Iris")
labelCaribbean := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Caribbean")
labelLavender := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Lavender")
labelCerulean := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Cerulean")
labelForest := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Forest")
labelRose := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Rose")
labelMango := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Mango")
labelPurple := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Purple")
labelBlue := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Blue")
labelTeal := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Teal")
labelMagenta := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Magenta")
labelTan := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Tan")
labelGreen := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Green")
labelRed := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Red")
labelYellow := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Premiere", "Yellow")

;[Photoshop]

;==tools==

/*
 This value will send the keyboard shortcut you have set to change to the hand tool within Photoshop

 Can be set within KSA.ahk/ini
 */
handTool := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Hand")

/*
 This value will send the keyboard shortcut you have set to change to the pen tool within Photoshop

 Can be set within KSA.ahk/ini
 */
penTool := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Pen")

/*
 This value will send the keyboard shortcut you have set to change to the selection tool within Photoshop

 Can be set within KSA.ahk/ini
 */
selectionTool := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Selection")

/*
 This value will send the keyboard shortcut you have set to change to the zoom tool within Photoshop

 Can be set within KSA.ahk/ini
 */
zoomTool := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Zoom")

;==hotkeys==

/*
 This value will send the keyboard shortcut you have set to go into free transform within Photoshop

 Can be set within KSA.ahk/ini
 */
freeTransform := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Free Transform")

/*
 This value will send the keyboard shortcut you have set to open the image size menu within Photoshop

 Can be set within KSA.ahk/ini
 */
imageSize := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Image Size")

/*
 This value will send the keyboard shortcut you have set to save as copy within Photoshop

 Can be set within KSA.ahk/ini
 */
saveasCopy := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Photoshop", "Save As Copy")

;[After Effects]

;==tools==

/*
 This value will send the keyboard shortcut you have set to change to the hand tool within After Effects

 Can be set within KSA.ahk/ini
 */
handAE := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Hand")

/*
 This value will send the keyboard shortcut you have set to change to the selection tool within After Effects

 Can be set within KSA.ahk/ini
 */
selectionAE := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Selection")

;==hotkeys==

/*
 This value will send the keyboard shortcut you have set to go the the next keyframe within After Effects

 Can be set within KSA.ahk/ini
 */
nextKeyframe := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Next Keyframe")

/*
 This value will send the keyboard shortcut you have set to go the the previous keyframe within After Effects

 Can be set within KSA.ahk/ini
 */
previousKeyframe := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Previous Keyframe")

;==properties==

/*
 This value will send the keyboard shortcut you have set to open the scale property within After Effects

 Can be set within KSA.ahk/ini
 */
scaleProp := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Scale")

/*
 This value will send the keyboard shortcut you have set to open the position property within After Effects

 Can be set within KSA.ahk/ini
 */
positionProp := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Position")

/*
 This value will send the keyboard shortcut you have set to open the anchor point property within After Effects

 Can be set within KSA.ahk/ini
 */
anchorpointProp := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Anchor Point")

/*
 This value will send the keyboard shortcut you have set to open the opacity property within After Effects

 Can be set within KSA.ahk/ini
 */
opacityProp := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Opacity")

/*
 This value will send the keyboard shortcut you have set to open the rotation property within After Effects

 Can be set within KSA.ahk/ini
 */
rotationProp := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "After Effects", "Rotation")

;[Resolve]

;==hotkeys==

/*
 This value will send the keyboard shortcut you have set to select the clip at playhead within Resolve

 Can be set within KSA.ahk/ini
 */
resolveSelectPlayhead := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Resolve", "Select at Playhead")

;[OBS]

/*
 This value will send the keyboard shortcut you have set to save a clip from the replay buffer within OBS Studio

 Can be set within KSA.ahk/ini
 */
replayBuffer := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "OBS", "Replay Buffer")

/*
 This value will send the keyboard shortcut you have set to save a clip from the Source Record Plugin within OBS Studio

 Can be set within KSA.ahk/ini
 */
sourceRecord1 := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "OBS", "Source Record 1")

/*
 This value will send the keyboard shortcut you have set to enable the preview window within OBS Studio

 Can be set within KSA.ahk/ini
 */
enableOBSPreview := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "OBS", "Enable Preview")

/*
 This value will send the keyboard shortcut you have set to disable the preview window within OBS Studio

 Can be set within KSA.ahk/ini
 */
disableOBSPreview := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "OBS", "Disable Preview")

;[Hotkeys]

/*
 This value is a key or key combination that is being called upon within a function. These values will need to be adjusted within KSA.ini to fit however you choose to activate these functions
 */
levelsHotkey := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Hotkeys", "Levels")

/*
 This value is a key or key combination that is being called upon within a function, these values will need to be adjusted within KSA.ahk/ini to fit however you choose to activate these functions
 */
replyHotkey := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Hotkeys", "Reply")

/*
 This value is a key or key combination that is being called upon within a function, these values will need to be adjusted within KSA.ahk/ini to fit however you choose to activate these functions
 */
textHotkey := IniRead("C:\Program Files\ahk\ahk\KSA\Keyboard Shortcuts.ini", "Hotkeys", "Text")