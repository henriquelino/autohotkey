#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;;;;;;;;;;;;;;;;;;

*^c::

if WinActive("ahk_class GLFW30"){
	Send, {F3 Down}
Send, {I down}
Send, {F3 up}
Send, {I Up}
sleep, 300
clip_handler1 = %clipboard%
Loop, parse, clip_handler1, %A_Space% 
{
	parsed_%A_Index% := % A_LoopField


;/setblock -320 76 320 minecraft:dirt
}

	;MsgBox, x: %parsed_2%` y: %parsed_3%` z: %parsed_4%`
Var1 := parsed_2 . " " . parsed_3 . " " .  parsed_4

	;msgbox, % Var1
	clipboard := % Var1

} else {
	Send {Ctrl Down}c{Ctrl Up}
}

return




