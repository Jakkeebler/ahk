/************************************************************************
 * @description A class to create & interact with `settings.ini`
 * @author tomshi
 * @date 2023/02/05
 * @version 1.0.4
 ***********************************************************************/

class UserPref {
    __New() {
        if !FileExist(this.SettingsFile)
            {
                SplitPath(A_WorkingDir, &name)
                if name = "classes"
                    {
                        SetWorkingDir("..\..\")
                        this.workingDir := A_WorkingDir
                    }
                this.__createIni(this.defaults[1], this.defaults[2], this.defaults[3], this.defaults[4], this.defaults[5], this.defaults[6], this.defaults[7], this.defaults[8], this.defaults[9], this.defaults[10], this.defaults[11], this.defaults[12], this.defaults[13], this.defaults[14], this.defaults[15], this.defaults[16], this.defaults[17], this.defaults[18], this.defaults[19], this.defaults[20], this.defaults[21], this.defaults[22], this.workingDir, this.defaults[24], this.defaults[25], this.defaults[26], this.defaults[27])
                Run(A_ScriptFullPath)
            }
        ;// initialise settings variables
        this.__setSett()
        this.__setAdjust()
        this.__setTrack()
    }

    ;// defaults
    workingDir := A_WorkingDir
    defaults := ["true", "false", "", "false", "true", "true", "true", "false", 45, 5, 5, 2.5, 5, "2022", "2022", "v22.3.1", "v22.6", "v24.0.1", "v18.0.4", "F:\Adobe Cache\Prem", "F:\Adobe Cache\AE", 0, this.workingDir, "false", "false", 0, "v2.0"]
    ;// define settings location
    SettingsDir  => A_MyDocuments "\tomshi"
    SettingsFile => this.SettingsDir "\settings.ini"

    /**
     * A function to provide the default for each .ini value
     * @param {String} key the key name
     */
    __getDefault(key) {
        if InStr(key, A_Space)
            key := StrReplace(key, A_Space, "_")
        switch key {
            case "adobe_GB":                          return 45
            case "adobe_FS":                          return 2
            case "autosave_MIN":                      return 5
            case "game_SEC":                          return 2
            case "multi_SEC":                         return 5
            case "prem_year", "ae_year":              return 2022
            case "version":                           return "v2.0"
            case "monitor_alert":                     return "0"
            case "premVer":                           return "v22.3.1"
            case "aeVer":                             return "v22.6"
            case "psVer":                             return "v24.0.1"
            case "resolveVer":                        return "v18.0.4"
            case "update_check":                      return "true"
            case "dark_mode":                         return ""
            case "autosave_check_checklist",
                 "tooltip", "checklist_tooltip":
                                                      return "true"
            case "beta_update_check",
                 "run_at_startup", "checklist_wait",
                 "first_check", "block_aware":
                                                      return "false"
            default:                                  return "false"
        }
    }

    /**
     * Convert boolean strings to proper boolean values
     * @param {String} key "true" or "false"
     * @param {String} section the section name of the ini file currently being read from
     */
    __convertToBool(key, section) {
        default := this.__getDefault(key)
        getVal := IniRead(this.SettingsFile, section, key, default)
        switch getVal {
            case "true":              return true
            case "false":             return false
            case "disabled", "stop":  return getVal
            default:                  return default
        }
    }

    /**
     * Convert boolean values to boolean strings
     * @param {Boolean} bool 1 or 0 (true/false)
     */
    __convertToStr(bool) {
        switch bool {
            case 1:  return "true"
            case 0:  return "false"
        }
    }

    /**
     * Remove underscores from variable names to find its respective ini value
     * @param {String} var the variable name
     */
    __convertToKey(var) => StrReplace(var, "_", A_Space)

    /**
     * This function is what the class will do on exit
     * It will check the current settings stored in the object and will write that setting to file if it differs from the initial value
     * @param {Array} arr the array you wish to enum through
     * @param {String} section the corresponding section name in the settings ini file
     */
    __del(arr, section) {
        for v in arr {
            try {
                writeVal := (this.%v% = 1 || this.%v% = 0) ? RTrim(this.__convertToStr(this.%v%), " ") : this.%v%
                ;// Don't want a default value here, if something errors out during the deletion of the class, we don't want it
                ;// returning back to the default value instead of leaving it how it currently is
                prior_value := IniRead(this.SettingsFile, section, this.__convertToKey(v))
                if this.%v% != prior_value
                    IniWrite(writeVal, this.SettingsFile, section, this.__convertToKey(v))
            }
        }
    }

    /**
     * This function reads an entire .ini section and pushes every key to the designated array
     * Any whitespace is converted to "_"
     * @param {String} section is the section you wish to be read from
     * @param {Array} arr is the desired array you wish to push to
     */
    __fillArr(section, arr) {
        allSettings   := IniRead(this.SettingsFile, section)
        splitSettings := StrSplit(allSettings, ["=", "`n", "`r"])
        for k, v in splitSettings {
            if Mod(k, 2) = 0
                continue
            arr.Push(StrReplace(v, A_Space, "_"))
        }
    }

    ;// [Settings]
    Settings_ := []
    __setSett() {
        this.__fillArr("Settings", this.Settings_)
        ;// create variables
        for v in this.Settings_ {
            this.%v% := this.__convertToBool(this.__convertToKey(v), "Settings")
        }
    }
    ;// [Adjust]
    Adjust_ := []
    __setAdjust() {
        this.__fillArr("Adjust", this.Adjust_)
        ;// create variables
        for v in this.Adjust_ {
            default := this.__getDefault(v)
            this.%v% := IniRead(this.SettingsFile, "Adjust", this.__convertToKey(v), default)
        }
    }
    ;// [Track]
    Track_ := []
    __setTrack() {
        this.__fillArr("Track", this.Track_)
        ;// create variables
        for v in this.Track_ {
            switch v {
                case "first_check", "block_aware":
                    this.%v% := this.__convertToBool(this.__convertToKey(v), "Track")
                default:
                    default := this.__getDefault(v)
                    this.%v% := IniRead(this.SettingsFile, "Track", this.__convertToKey(v), default)
            }
        }
    }

    __Delete() {
        this.__del(this.Settings_, "Settings")
        this.__del(this.Adjust_, "Adjust")
        this.__del(this.Track_, "Track")
    }

    /**
     * This function generates a baseline settings.ini file
     * @param {params1-27} settingsIni these are the settings.ini entries in order
     */
    __createIni(params*) {
        if params.Length > this.defaults.Length
            throw (ValueError("Incorrect number of Parameters passed to function.", -1)) ;// don't add errorlog to this function, keep it no dependencies
        if !DirExist(this.SettingsDir)
            DirCreate(this.SettingsDir)
        if FileExist(this.SettingsFile)
            FileDelete(this.SettingsFile)
        FileAppend("
                (
                    [Settings]
                    update check={}
                    beta update check={}
                    dark mode={}
                    run at startup={}
                    autosave check checklist={}
                    tooltip={}
                    checklist tooltip={}
                    checklist wait={}

                    [Adjust]
                    adobe GB={}
                    adobe FS={}
                    autosave MIN={}
                    game SEC={}
                    multi SEC={}
                    prem year={}
                    ae year={}
                    premVer={}
                    aeVer={}
                    psVer={}
                    resolveVer={}
                    premCache={}
                    aeCache={}

                    [Track]
                    adobe temp={}
                    working dir={}
                    first check={}
                    block aware={}
                    monitor alert={}
                    version={}
                )", this.SettingsFile)
                ;// replace {}
                workingFile := FileRead(this.SettingsFile)
                loop this.defaults.Length {
                    workingFile := StrReplace(workingFile, "{}", params[A_Index],,, 1)
                    if A_Index = this.defaults.Length
                        {
                            FileDelete(this.SettingsFile)
                            FileAppend(workingFile, this.SettingsFile)
                        }
                }
    }
}

UserSettings := UserPref()