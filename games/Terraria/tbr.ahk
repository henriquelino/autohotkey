#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Persistent
SetTitleMatchMode 2

SetCapsLockState, Off

SetTimer, ToggleCapsLock, 200

ToggleCapsLock: 
{
	if( WinActive( "Terraria Server: TBR" ) && !GetKeyState("CapsLock", "T") )
	{
		SetCapsLockState, On
		gCapsLock := 1
	}
	else
	if( !WinActive( "Terraria Server: TBR" ) && gCapsLock )
	{
		SetCapsLockState, Off
		gCapsLock := 0
	}
return
}


^L::
Send, say SAVING NOW!
Send, {ENTER}
send, save
send {enter}
sleep, 300
send say DONE
send {enter}