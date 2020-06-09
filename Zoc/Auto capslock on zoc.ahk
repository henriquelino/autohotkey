#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#InstallKeybdHook
#Persistent
SetTitleMatchMode 2

SetCapsLockState, Off

SetTimer, ToggleCapsLock, 200

ToggleCapsLock:
{
	if( WinActive( "ahk_exe zoc.exe" ) && !GetKeyState("CapsLock", "T") )
	{
		SetCapsLockState, On
		gCapsLock := 1
	}
	else
	if( !WinActive( "ahk_exe zoc.exe" ) && gCapsLock )
	{
		SetCapsLockState, Off
		gCapsLock := 0
	}
}
return


AppsKey::CTRL

NumpadDot::.