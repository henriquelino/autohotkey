#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Gui, Add, GroupBox, xm ym w350 h95, INICIA OU NAO BROU

Gui, Add, Button, default xm+20 ym+20 w70 h30, savetest  	; xm puts it at the bottom left corner.
Gui, Show, xCenter yCenter h465 w370, Backup Tool






return

Buttonsavetest:

MouseGetPos, xpos, ypos 


WinActivate, ahk_exe zoc.exe
WinMaximize, ahk_exe zoc.exe
Sleep 100
BlockInput, On

ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *10 baseicms.PNG

if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.
else
    FoundX+=150
    FoundY+=10
    MouseMove, 	%FoundX%, %FoundY%


BlockInput, Off




return

GuiClose: ;when gui closes or esc, exit app
GuiEscape:
ExitApp