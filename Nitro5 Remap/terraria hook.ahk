#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

PrintScreen::
    Keywait, PrintScreen
    Send {Alt down}
    Send {RWin down}
    Send {PrintScreen}

    Send {Alt up}
    Send {RWin up}
    Return
return