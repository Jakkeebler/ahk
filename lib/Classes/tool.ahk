/************************************************************************
 * @description A class to contain often used tooltip functions for easier coding.
 * @author tomshi
 * @date 2023/01/13
 * @version 1.1.0
 ***********************************************************************/

; { \\ #Includes
#Include <Functions\errorLog>
#Include <Functions\detect>
; }

class tool {
    /**
     * A function simply to store the previous A_ListLines value
     * @returns {Boolean} returns the original state of `A_ListLines`
     */
    __storeLines() => A_ListLines

    /**
     * A function simply to restore the previously saved A_ListLines value
     */
    __returnLines(priorLines) => ListLines(priorLines)

    /**
     * This function saves the previous coordmode states that `tool.Cust()` will change
     * @returns {Object}
     * ```
     * prev := tool().__storeCoords()
     * prev.Tooltip     ;// gives the previous Boolean value of A_CoordModeToolTip
     * prev.Mouse       ;// gives the previous Boolean value of A_CoordModeMouse
     *
     */
    __storeCoords() => {Tooltip: A_CoordModeToolTip, Mouse: A_CoordModeMouse}

    /**
     * This function ensures any custom coordinates passed by the user don't default to window mode and ensures the initial tooltip generates in the correct position if cursor isn't on the main display
     */
    __setCoords() => (CoordMode("ToolTip", "Screen"), CoordMode("Mouse", "Screen"))

    /**
     * This function will return the coordmodes to their previous state
     * @param c_toolTip the previously stored CoordMode for the `ToolTip`
     * @param c_mouse the previously stored CoordMode for the `Mouse`
     * @param lines the previously stored boolean for `ListLines`
     */
    __returnCoords(c_toolTip, c_mouse, lines) => (A_CoordModeToolTip := c_toolTip, A_CoordModeMouse := c_mouse, tool().__returnLines(lines))

    /**
     * This function does some type testing on the input variables to ensure they're correct
     */
    __inputs(args) {
        if (
           Type(args.message) != "string" ||
          (Type(args.timeout) != "integer" && Type(args.timeout) != "float") ||
          (Type(args.find) != "integer") || (Type(args.find) = "integer" && (args.find != 1 && args.find != 0)) ||
          (args.HasOwnProp("x") && Type(args.x) != "integer") || (args.HasOwnProp("y") && Type(args.y) != "integer") || (args.HasOwnProp("ttip") && Type(args.ttip) != "integer")
        )
            {
                ;// throw
                errorLog(TypeError("Incorrect Parameter passed to Function", -1),,, 1)
            }
    }

    /**
     * Create a tooltip with any message. This tooltip will then follow the cursor and only redraw itself if the user has moved the cursor.
     *
     * If you wish for the tooltip to plant next to the mouse and not follow the cursor, similar to a normal tooltip, that can be achieved with something along the lines of;
     *
     * `tool.Cust("message",,, MouseGetPos(&x, &y) x + 15, y)`
     *
     * If you pass EITHER the x OR y value (but not both) this function will take that value and continuously `offset` it from the current cursor position. If you wish to plant the cursor in an exact position BOTH x & y values must be passed
     * @param {String} message is what you want the tooltip to say
     * @param {Integer/Float} timeout is how many ms you want the tooltip to last. This value can be omitted and it will default to 1000. If you wish to type in seconds, use a floating point number, ie; `1.0`, `2.5`, etc
     * @param {Boolean} find is whether you want this function to state "Couldn't find " at the beginning of it's tooltip. Simply add 1 (or true) for this variable if you do, or omit it if you don't
     * @param {Integer} xy the x & y coordinates you want the tooltip to appear. These values are unset by default and can be omitted
     * @param {Integer} WhichToolTip omit this parameter if you don't need multiple tooltips to appear simultaneously. Otherwise, this is a number between 1 and 20 to indicate which tooltip window to operate upon. If unspecified or set larger than 20, that number is 1 (the first).
     */
    static Cust(message, timeout := 1000, find := false, x?, y?, WhichToolTip?)
    {
        tool().__inputs({message: message, timeout: timeout, find: find, x: x?, y: y?, ttip: WhichToolTip?})
        ;// saving the previous ListLines value
        priorLines := tool().__storeLines()
        ListLines(0) ;disables line logging - this prevents the line log from getting flooded
        ;// store initial coord mode
        priorCoords := tool().__storeCoords()
        ;// set coord mode
        tool().__setCoords()

        ;// setting default values
        one  := false, both := false, none := false, xDef := 20, yDef := 1
        ;// defining where to place the cursor
        if (IsSet(x) || IsSet(y)) ;checking if x or y has been assigned by the user
            {
                if (IsSet(x) && IsSet(y)) ;checking if both x & y have been set
                    both := true
                else ;otherwise only one has been set
                    {
                        one := true
                        x := !IsSet(x) ? xDef : x
                        y := !IsSet(y) ? yDef : y
                    }
            }
        else ;otherwise none have been assigned
            {
                none := true
                x := xDef
                y := yDef
            }
        ;// checking if user passed an integer or float
        if !IsInteger(timeout) && IsFloat(timeout) ;this allows the user to use something like 2.5 to mean 2.5 seconds instead of needing 2500
            timeout := timeout * 1000
        ;// ensuring `WhichToolTip` never goes above 20 or below 1
        if IsSet(WhichToolTip) ;doing some checks for the whichtooltip variable
            {
                if WhichToolTip > 20 || WhichToolTip < 1
                    WhichToolTip := 1
            }

        ;// starting the tooltip logic
        MouseGetPos(&xpos, &ypos) ;log our starting mouse coords
        time := A_TickCount ;log our starting time
        messageFind := find = 1 ? "Couldn't find " : "" ;this is essentially saying: if find = 1 then messageFind := "Couldn't find " else messageFind := ""

        ;//! creating the tooltip
        ;// what happens when neither x or y has been assigned a value
        if both = false || none = true
            {
                ToolTip(messageFind message, xpos + x, ypos + y, WhichToolTip?) ;produce the initial tooltip
                SetTimer(moveWithMouse.Bind(x, y), 15)
            }
        else ;// what happens otherwise
            {
                ToolTip(messageFind message, x, y, WhichToolTip?) ;produce the initial tooltip
                SetTimer(() => ToolTip("",,, WhichToolTip?), - timeout) ;otherwise we create a timer to remove the cursor after the timout period
            }

        ;//! finally return coordmode & listlines to their previous settings before returning
        tool().__returnCoords(priorCoords.Tooltip, priorCoords.Mouse, priorLines)
        return

        /**
         * This function is called by `SetTimer` and is what allows the tooltip to follow the cursor
         */
        moveWithMouse(x, y)
        {
            ListLines(0) ;as this is a nested function, we have to disable line logging again - this prevents the line log from getting flooded
            tool().__setCoords()
            if (A_TickCount - time) >= timeout ;here we compare the current time, minus the original time and see if it's been longer than the timeout time
                {
                    SetTimer(, 0) ;if it has we kill the timer
                    ToolTip("",,, WhichToolTip?) ;and kill the tooltip
                    tool().__returnCoords(priorCoords.Tooltip, priorCoords.Mouse, priorLines)
                    return ;then kill the function
                }
            MouseGetPos(&newX, &newY) ;here we're grabbing new mouse coords
            if newX != xpos || newY != ypos ;so we can compare them to the old coords
                {
                    MouseGetPos(&xpos, &ypos) ;if they're different we'll replace the original coords
                    ToolTip(messageFind message, newX + x, newY + y, WhichToolTip?) ;and produce a new tooltip
                }
        }
    }

    /**
     * This function is a part of the class `tool`
     *
     * This function will check to see if any tooltips are active before continuing
     * @param {Integer} timeout allows you to pass in a time value (in seconds) that you want WinWaitClose to wait before timing out. This value can be omitted and does not need to be set
     */
    static Wait(timeout?)
    {
        priorLines := tool().__storeLines()
        ListLines(0) ;disables line logging
        dct := detect(0) ;we need to ensure detecthiddenwindows is disabled before proceeding or this function may never stop waiting
        if WinExist("ahk_class tooltips_class32")
            WinWaitClose("ahk_class tooltips_class32",, timeout?)
        DetectHiddenWindows(dct.Windows)
        tool().__returnLines(priorLines)
    }
}