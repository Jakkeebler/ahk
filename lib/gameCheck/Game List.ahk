;Add games here! you can get this info using WindowSpy that comes with ahk or you can activate `settingsGUI()` (default hotkey is #F1::) while you have the game active, then press the "add game to `gameCheck()`" button. It will attemp to add you game to this list automatically.
;Format: `GameTitle ahk_exe game.exe`
GroupAdd("games", "Minecraft ahk_exe javaw.exe") ;minecraft
GroupAdd("games", "Terraria ahk_exe Terraria.exe") ;terraria
GroupAdd("games", "Overwatch ahk_exe Overwatch.exe") ;overwatch
GroupAdd("games", "Sector's Edge ahk_exe sectorsedge.exe") ;sectorsedge
; -- leave this line it gets used and is needed in settingsGUI()