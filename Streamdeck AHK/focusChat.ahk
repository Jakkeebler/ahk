#SingleInstance Force
;this is a script to just activate my chat window
if !WinExist("Twitch - Google Chrome")
    ExitApp()
if WinActive("Twitch - Google Chrome")
    return
WinActivate("Twitch - Google Chrome")