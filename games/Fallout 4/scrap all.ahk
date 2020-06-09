#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Event  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Delay_time := 30
Delay_time2 := 30
~$Numpad1::
While GetKeyState("Numpad1", "P"){

	Send, {e Down}
	Sleep, Delay_time2
	Send, {e Up}

	Sleep, Delay_time

	Send, {r Down}
	Sleep, Delay_time2
	Send, {r Up}

	Sleep, Delay_time

	Send, {Down Down}
	Sleep, Delay_time2
	Send, {Down Up}
	Sleep, Delay_time2
	Send, {Down Down}
	Sleep, Delay_time2
	Send, {Down Up}

}
return