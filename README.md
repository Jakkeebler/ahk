# ahk
This repo is a combination of all the scripts I use almost daily to help with either making content (videos or streaming related), or just speeding up mundane and random interactions with a computer.

Included is also the Excel document I use to keep track of any hotkeys I set, just as an easier and more visual way of understanding what is/isn't available.

- Video going over how AHK can help speed up [editing workflows](https://youtu.be/Iv-oR7An_iI)
  - Video walking through _all (at the time)_ of my [ahk v2.0 scripts](https://youtu.be/3rFDEonACxo)
    - Video walking through even older [ahk v1.1 scripts](https://youtu.be/QOztbpTe_Es)

A lot of the code in the earliest versions of My Scripts.ahk was either inspired by, or taken from Taran from LTT (https://github.com/TaranVH/). His videos on ahk got me into fiddling around with it myself so many thanks. These scripts were then further elaborated on, then transformed into an ahk v2.0 compliant script and now mostly contains my own tinkerings. Any scripts directly from Taran are labeled as so down below in the Explanation section.

You can watch me use some of these scripts in action while I edit away on twitch when I stream on my bot account: https://www.twitch.tv/botshiii

### Version Information:
This repo is to maintain work on the ahk v2.0 versions of my scripts. These scripts ***will not*** work in ahk v1.1, if you want v1.1 compliant versions of these scripts, check [releases 1.0-1.2](https://github.com/Tomshiii/ahk/releases) in this repo. They are likely severely outdated by the time you're reading this, but those versions will no longer be maintained, you're free to try and backport any further additions if you're willing.

## What to do:
1. Download and install [AHK v2.0 Beta](https://www.autohotkey.com/)
2. Download and install either; (You could technically just edit scripts in notepad if you really wanted to, but I honestly don't recommend it)
   - [Notepad++](https://notepad-plus-plus.org/downloads/)
     - Then download and install the [ahk language for notepad++](https://www.autohotkey.com/boards/viewtopic.php?t=50)
   - [VSCode](https://code.visualstudio.com/)
     - Then install an AHK extension within the program for a more complete package.
3. Save these scripts in "C:\Program Files\ahk\" if you want all the directory information to just line up without any editing. (you may have to give this folder perms so it doesn't harass you about admin privileges all the time)
4. Edit and then run any of the .ahk files to then use to your liking!
   - Scripts that will work with no tinkering include ->
     - Alt Menu acceleration disabler
     - autodismiss error
     - fkey auto launch (recommended you check it out first though as it opens specific programs)
     - MS_Functions (by nature. This script just defines functions FOR other scripts)
     
#### Then be aware:

Any scripts that contain pixel coordinates rely not only on my monitor layout, but also my workspace layout within premiere (or any applicable program) and will not necessarily work out of the box. They will require looking at the individual comments, as well as any accompanying AHK documentation (make sure you look at the ahk v2.0 documentation and **NOT** the v1.1 documentation) to get an idea of what is going on, then adjusting accordingly using Window Spy which gets installed alongside AHK. (an ahk v2.0 version of window spy can be found [here](https://github.com/steelywing/AutoHotkey-Release/blob/master/installer/source/WindowSpy.v2.ahk))


## Explanation:
Item | Use
------------ | -------------
My Scripts.ahk | My main scripts, contains everything I use for stream and editing, as well as a few windows related things I do to speed a few interactions up.
MS_functions.ahk | (My Scripts_functions) A separate ahk file to define functions so they don't have to clog up the main script.
Streaming.ahk | A script I run as Admin while streaming to allow me to interact with obs via ahk (both need to be on the same elevation to interact)
Resolve_Example.ahk | An example script for Davinci Resolve that has ported a few things from my premiere scripts to help you get started. This is very rough and thrown together.
fkey auto launch.ahk | A script from [Taran](https://github.com/TaranVH/) to auto launch OR swap to specific applications if they're already open
Alt_menu_acceleration_DISABLER.ahk | A script from [Taran](https://github.com/TaranVH/) to disable the alt menu acceloration unless you _hold_ down the alt key
autodismiss error.ahk | A script from [Taran](https://github.com/TaranVH/) to remove an annoying dialogue box in premiere that treats you like a child
right click premiere.ahk | A script from [Taran](https://github.com/TaranVH/) to move the playhead in premiere with the right mouse button
scripts f keys taken.xlsx | An Excel doc I use to track all the button combinations used in my scripts so I know what is/isn't available.
