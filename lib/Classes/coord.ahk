/**
 * A class to contain often used coordmode settings for easier coding.
 */
class coord {
    /**
     * This function is a part of the class `coord`
     *
     * Sets coordmode to "screen"
     */
    static s() => (coordmode("pixel", "screen"), coordmode("mouse", "screen"))

    /**
     * This function is a part of the class `coord`
     *
     * Sets coordmode to "window"
     */
     static w() => (coordmode("pixel", "window"), coordmode("mouse", "window"))

    /**
     * This function is a part of the class `coord`
     *
     * sets coordmode to "caret"
     */
     static c() => coordmode("caret", "window")
}
;coord := coordinates()