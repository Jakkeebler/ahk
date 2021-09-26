# ahk
This repo is a combination of all the scripts I use almost daily to help with either making content (videos or streaming related), or just speeding up mundane and random interactions with a computer.

Included is also the Excel document I use to keep track of any hotkeys I set, just as an easier and more visual way of understanding what is/isn't available.

- Video going over how AHK can help speed up [editing workflows](https://youtu.be/Iv-oR7An_iI)
- Video walking through an early version of the [Release 2.1 update](https://youtu.be/JF_WISVJsPU)
  - Video walking through _all (at the time)_ of my [ahk v2.0 scripts](https://youtu.be/3rFDEonACxo)
      - Video walking through even older [ahk v1.1 scripts](https://youtu.be/QOztbpTe_Es)

A lot of the code in the earliest versions my scripts were either inspired by, or taken from Taran from LTT (https://github.com/TaranVH/). His videos on ahk got me into fiddling around with it myself so many thanks. These scripts were then further elaborated on, then transformed into a ahk v2.0 compliant script and now mostly contains my own tinkerings. Any scripts directly from Taran are labeled as such down below in the Explanation section (do note though that I personally have gone through them and made them function in ahk v2.0).

You can watch me use some of these scripts in action while I edit away on twitch when I stream on my bot account: https://www.twitch.tv/botshiii

### QMK Keyboard:
My scripts now have support for a secondary keyboard with [[QMK Keyboard.ahk]](https://github.com/Tomshiii/ahk/blob/main/QMK%20Keyboard.ahk) which along with the [Hasu USB-USB converter](https://geekhack.org/index.php?topic=109514.0) allows you to use a second keyboard to launch completely different scripts than your main keyboard following [this tutorial by Taran from LTT](https://www.youtube.com/watch?v=GZEoss4XIgc). Any macros that have been moved to this script can be pulled out and placed in your own scripts without any issues

### AHK Version Information:
This repo is to maintain work on the ahk v2.0 versions of my scripts. These scripts ***will not*** work in ahk v1.1, if you want v1.1 compliant versions of these scripts, check [releases 1.0-1.2](https://github.com/Tomshiii/ahk/releases) in this repo. They are likely severely outdated by the time you're reading this, but those versions will no longer be maintained, you're free to try and backport any later additions if you're willing.

## What to do:
1. Download and install [AHK v1.1](https://www.autohotkey.com/) then download [AHK v2.0 Beta](https://www.autohotkey.com/v2/).
2. Extract AHK v2.0 beta and rename either the 32bit or 64bit exe to just "AutoHotkey.exe". Then replace the default AutoHotkey.exe (usually found in C:\Program Files\AutoHotkey) with your new file from the 2.0 beta
   - Replace Window Spy.ahk with a v2.0 version found [here](https://github.com/steelywing/AutoHotkey-Release/blob/master/installer/source/WindowSpy.v2.ahk)
3. Download and install either; (You could technically just edit scripts in notepad if you really wanted to, but I honestly don't recommend it)
   - [Notepad++](https://notepad-plus-plus.org/downloads/)
     - Then download and install the [ahk language for notepad++](https://www.autohotkey.com/boards/viewtopic.php?t=50)
   - [VSCode](https://code.visualstudio.com/)
     - Then install an AHK extension within the program for a more complete package.
4. Save these scripts in "C:\Program Files\ahk\ahk\" if you want all the directory information to just line up without any editing. (you may have to give this folder perms so it doesn't harass you about admin privileges all the time)
5. Edit, then run any of the .ahk files to then use to your liking!
   - Scripts that will work with no tinkering include ->
     - Alt Menu acceleration disabler
     - autodismiss error
     
#### Then be aware:

Any scripts that contain pixel coordinates (in either, Click, MouseMove, ImageSearch, PixelSearch, etc) rely not only on my monitor layout or the coordinate mode set but also my workspace layout within premiere (or any applicable program) and will not necessarily work out of the box. They will require looking at the individual comments, as well as any accompanying AHK documentation (make sure you look at the ahk [v2.0](https://lexikos.github.io/v2/docs/AutoHotkey.htm) documentation and **NOT** the [v1.1](https://www.autohotkey.com/docs/AutoHotkey.htm) documentation) to get an idea of what is going on, then adjusting accordingly using Window Spy which gets installed alongside AHK. (an ahk v2.0 version of window spy can be found [here](https://github.com/steelywing/AutoHotkey-Release/blob/master/installer/source/WindowSpy.v2.ahk))


## Explanation:
Item | Use
:---: | :---
My Scripts.ahk | My main scripts, contains everything I use for editing, as well as a few windows related things I do to speed a few interactions up.
MS_functions.ahk | (My Scripts_functions) A separate ahk file to define functions so they don't have to clog up the main script. You don't need to manually run this file, it gets [#included](https://lexikos.github.io/v2/docs/commands/_Include.htm) separately within scripts that need it. A function is defined similar to; <br />![Untitled-1](https://user-images.githubusercontent.com/53557479/131491115-15476b22-935c-4344-a54d-0e1c25910cd5.png)<br />We then [#include](https://lexikos.github.io/v2/docs/commands/_Include.htm) MS_Functions in other scripts so we can simply add <br />```func("variableX", "variableY")``` to scripts.
QMK Keyboard.ahk | A script to allow separate function for my secondary keyboard (I use a little numpad). A script originally created by [Taran](https://github.com/TaranVH/) that I've modified to work in ahk v2.0 (and cut down to only applicable buttons).
Streaming.ahk | A script I run as Admin while streaming to allow me to interact with obs via ahk (both need to be on the same elevation to interact).
PC Startup.ahk | A script that does some things when my PC starts up to ensure proper function of my scripts as well as opening programs I'd otherwise have to open manually.
Resolve_Example.ahk | An example script for Davinci Resolve that has ported a few things from my premiere scripts to help you get started. This is very rough and thrown together.
scripts f keys taken.xlsx / QMK.psd | An Excel doc/psd file I use to track all the button combinations used in my scripts so I know what is/isn't available.
Alt_menu_acceleration_DISABLER.ahk | A script from [Taran](https://github.com/TaranVH/) to disable the alt menu acceloration unless you _hold_ down the alt key.
autodismiss error.ahk | A script from [Taran](https://github.com/TaranVH/) to remove an annoying dialogue box in premiere that treats you like a child.
right click premiere.ahk | A script from [Taran](https://github.com/TaranVH/) to move the playhead in premiere with the right mouse button.
