#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;;;;;;;;;;;;;;;;;;
clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
;clip_handler1:= null
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, Font, s10 cBlack 


Gui, Add, GroupBox, xm ym w350 h95, configs


Gui, Add, Button, h60 w145 x20 y+25 gsend, SEND  	; xm puts it at the bottom left corner.



Gui, Show, xCenter yCenter h465 w370, Backup Tool
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


send:

WinActivate, ahk_exe firefox.exe
sleep 300
MouseClick, left, 337,360 , 3 ;n da venda + data

sleep 300
Send ^c ;manda control c

sleep 300

clip_handler1 = %clipboard%

Loop, parse, clip_handler1, |
{
	parsed_%A_Index% := % A_LoopField
}

parsed_1 := SubStr(parsed_1, 8)
parsed_1 := RTrim(parsed_1, OmitChars := " `t") ;;retira ultimo espaco se tiver
parsed_2 := SubStr(parsed_2, 2)
parsed_2 := RTrim(parsed_2, OmitChars := " `t")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; paste n da venda
WinActivate, ahk_exe EXCEL.EXE
sleep, 500
MouseClick, left, 430,60 , 2 ;n da venda
sleep 300
Send, {RAW}%parsed_1% ;n da venda
sleep 300

;;;;;;;;;;;;;;;;;;;;;; paste dia da venda

MouseClick, left, 465,125 , 2 ;n da venda
sleep 300
Send, {RAW}%parsed_2% ;dia da venda
sleep 300

;;;;;;;;;;;;;;;;;;;;;copy and paste recebimento


WinActivate, ahk_exe firefox.exe
sleep 300
MouseClick, left, 1320, 340 , 2 ;recebimento
Send ^c ;manda control c
sleep 300

clip_handler1 = %clipboard%
clip_handler1 := RTrim(clip_handler1, OmitChars := " `t")
sleep 300
WinActivate, ahk_exe EXCEL.EXE
sleep, 500

MouseClick, left, 460, 95 , 2 ;recebimento
Send, {RAW}%clip_handler1% ;dia da venda
sleep 300

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; copy and paste tarifa

WinActivate, ahk_exe firefox.exe
sleep 300
MouseClick, left, 1660, 550 , 3 ;tarifa
sleep 300
Send ^c ;manda control c

sleep 300
clip_handler1 = %clipboard%

clip_handler1 := SubStr(clip_handler1, 4)

WinActivate, ahk_exe EXCEL.EXE
sleep, 500

clip_handler1 := RTrim(clip_handler1, OmitChars := " `t")
clip_handler1 := LTrim(clip_handler1, OmitChars := " `t")

MouseClick, left, 473, 197 , 2 ;tarifa
sleep 300
Send, {RAW}%clip_handler1% ;dia da venda
sleep 300

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; copy and paste venda

WinActivate, ahk_exe firefox.exe
sleep 300
MouseClick, left, 1680, 420 , 3 ;venda
sleep 300
Send ^c ;manda control c
sleep 300
clip_handler1 = %clipboard%
clip_handler1 := SubStr(clip_handler1, 3)
clip_handler1 := RTrim(clip_handler1, OmitChars := " `t")
clip_handler1 := LTrim(clip_handler1, OmitChars := " `t")

WinActivate, ahk_exe EXCEL.EXE
sleep, 500

MouseClick, left, 427, 159 , 2 ;tarifa
sleep 300
Send, {RAW}%clip_handler1% ;dia da venda
sleep 300


return
