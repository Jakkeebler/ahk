#SingleInstance Force
#Include "..\SD_functions.ahk"
convert2('for /R %f IN (*.mkv) DO ffmpeg -i "%f" -codec copy -map 0:a -map 0:v "%~nf.mp4"' "{Enter}")
;for /R %f IN (*.mkv) DO ffmpeg -i "%f" -codec copy -map 0:a -map 0:v "%~nf.mp4"


