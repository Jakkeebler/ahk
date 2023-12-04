#SingleInstance Off
; { \\ #Includes
#Include <Classes\ytdlp>
#Include <Classes\Streamdeck_ptf>
#Include <Functions\getHTMLTitle>
; }

SDptf := SD_ptf()
outputFileName := "%(title)s [%(id)s].%(ext)s"

;// I use these scripts to quickly download videos from youtube to use for editing within Premiere Pro.
;// Premiere Pro doesn't accept vp9 files or av1 files so I download the highest quality file and reencode it to h264
ytdlp().download(Format('-N 8 --output "{}" --recode-video mp4', outputFileName), SDptf.vfxFolder)