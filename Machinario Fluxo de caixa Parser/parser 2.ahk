#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;;;;;;;;;;;;;;;;;;
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
;clip_handler1:= null

sleeptime := 50
sleeptime2 := 250
sleeptime3 := 20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, Font, s10 cBlack 


Gui, Add, GroupBox, xm ym w350 h95, configs


Gui, Add, Button, h60 w145 x20 y+25 gsend, SEND  	; xm puts it at the bottom left corner.



Gui, Show, xCenter yCenter h465 w370, Backup Tool
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


send:

WinActivate, ahk_exe firefox.exe

Sleep, %sleeptime%
MouseClick, left, 337,360 , 3 ;n da venda + data
Sleep, %sleeptime%
Send ^c 
Sleep, %sleeptime%

clip_handler1 = %clipboard%
Loop, parse, clip_handler1, |
{
	parsed_%A_Index% := % A_LoopField
}


n_venda := SubStr(parsed_1, 8)
n_venda := RTrim(n_venda, OmitChars := " `t") ;;retira ultimo espaco se tiver

dia_venda := SubStr(parsed_2, 2)
dia_venda := RTrim(dia_venda, OmitChars := " `t")

Sleep, %sleeptime%
MouseClick, left, 1320, 340 , 2 ;recebimento
Sleep, %sleeptime%
Send ^c ;manda control c
Sleep, %sleeptime%

clip_handler1 = %clipboard%
n_recebimento := RTrim(clip_handler1, OmitChars := " `t")

Sleep, %sleeptime%
MouseClick, left, 1660, 550 , 3 ;tarifa
Sleep, %sleeptime%
Send ^c ;manda control c
Sleep, %sleeptime%

clip_handler1 = %clipboard%
tarifa := SubStr(clip_handler1, 4)
tarifa := RTrim(tarifa, OmitChars := " `t")
tarifa := LTrim(tarifa, OmitChars := " `t")


Sleep, %sleeptime%
MouseClick, left, 1680, 420 , 3 ;venda
Sleep, %sleeptime%
Send ^c ;manda control c
Sleep, %sleeptime%

valor_venda = %clipboard%
valor_venda := SubStr(valor_venda, 3)
valor_venda := RTrim(valor_venda, OmitChars := " `t")
valor_venda := LTrim(valor_venda, OmitChars := " `t")


MsgBox, , , %n_venda%`n%n_recebimento%`n%dia_venda%`n%valor_venda%`n%tarifa%, 1



WinActivate, ahk_exe EXCEL.EXE

Sleep, 500
MouseClick, left, 150, 60 , 2 ;n da venda
Sleep, %sleeptime3%
SendInput, {RAW}%n_venda%
Sleep, %sleeptime2%

MouseClick, left, 150, 95 , 2 ;n da venda
Sleep, %sleeptime3%
SendInput, {RAW}%n_recebimento%
Sleep, %sleeptime2%

MouseClick, left, 150, 126 , 2 ;n da venda
Sleep, %sleeptime3%
SendInput, {RAW}%dia_venda%
Sleep, %sleeptime2%

MouseClick, left, 150, 160 , 2 ;n da venda
Sleep, %sleeptime3%
SendInput, {RAW}%valor_venda%
Sleep, %sleeptime2%

MouseClick, left, 150, 195 , 2 ;n da venda
Sleep, %sleeptime3%
SendInput, {RAW}%tarifa%
Sleep, %sleeptime2%


return
