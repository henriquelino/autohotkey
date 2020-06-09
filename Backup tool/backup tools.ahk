#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
ZeroArray(){
	loop, 50{
		Gui, Submit, NoHide
	}
}

wsize := 370
hsize := 650
Interation := 0
Array := []

Gui, Font, s10 cBlack 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Gui, Add, GroupBox, xm ym w350 h95, Input

Gui, Add, Radio, h5       x20 yp+20 Group gAuto_sub	vFile	, Single file
Gui, Add, Radio, h5 	  x20 y+0 		gAuto_sub	vFolder	, Folder

Gui, Add, Edit,  h25 w250 x20 yp+20 r1 vBackup_input gAuto_sub , Select INPUT file or folder
Gui, Add, Button,h25 w70  x+m yp gSelect_input, Select

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, Add, GroupBox, xm y+20 w350 h60, Output

Gui, Add, Edit, h25 w250 x20 yp+20 r1 vBackup_output  gAuto_sub , Select OUTPUT file or folder
Gui, Add, Button,h25 w70 x+m yp gSelect_out, Select  	; xm puts it at the bottom left corner.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Gui, Add, GroupBox, xm y+20 w350 h165, Configs

Gui, Add, Text, h25 x20 yp+20, Time between backups: 
Gui, Add, Edit, h25 w50 x20 yp+20 r1 vTimeBetween gAuto_sub
Gui, Add, UpDown, h25 vTimeBetweenUPD Range1-10, 5
Gui, Add, Radio, h25    x+20   yp Group vtime_set_seconds gAuto_sub		, seconds
Gui, Add, Radio, h25    x+20   yp 		vtime_set_minutes gAuto_sub		, minutes

Gui, Add, Text, h25 x20 yp+30, Max number of backups:
Gui, Add, Edit, h25 w50 x20 yp+20  r1 vMax_backups gAuto_sub
Gui, Add, UpDown, h25 vMax_backupsUPD Range1-10, 5
Gui, Add, Button, h25 w100 x20 yp+35 gReload, Reload tool 	; xm puts it at the bottom left corner.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Gui, Add, Button, h60 w145 x20 y+25 gStart_bkup, Start  	; xm puts it at the bottom left corner.
Gui, Add, Button, h60 w145 x+40 yp gStop_bkup, Stop  	; xm puts it at the bottom left corner.

Gui, Font, s12 cBlack 
Gui, Add, Text, h25 x20 y+15, STATUS:
Gui, Add, Text, h25 w150 x+20 yp vStatus, Waiting

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiControl,, File, 0
GuiControl,, Folder, 1

;;;;;;;;handle reloading last session;;;;;;;;;;;;;;
;iniread, <var to store>, <file to read>, <what to read>, <where it goes>, <default name>
IniRead, readoutput, config.ini, last_folders, output_folder, Select OUTPUT file or folder
;guicontrol,, <var to write to>,<var we read before> ;;it takes var read before and put that in the variable we need
GuiControl,, Backup_output, %readoutput%

IniRead, readoutput, config.ini, last_folders, input_folder, Select INPUT file or folder
GuiControl,, Backup_input, %readoutput%

IniRead, readoutput, config.ini, max_backups, configs, 5
GuiControl,, max_backups, %readoutput%

IniRead, readoutput, config.ini, time_between, configs, 5
GuiControl,, time_between, %readoutput%

IniRead, readoutput, config.ini, time_set_minutes, configs, 1
GuiControl,, time_set_minutes, %readoutput%

IniRead, readoutput, config.ini, time_set_seconds, configs, 0
GuiControl,, time_set_seconds, %readoutput%

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
	try
	{
		if A_IsCompiled
			Run *RunAs "%A_ScriptFullPath%" /restart
		else
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Gui, Show, xCenter yCenter h465 w370, Backup Tool
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Reload:
reload
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Start_bkup:

Gui, Submit, NoHide

;loopcount := Max_backups*2
Loop{
	time_now := % A_YYYY . "_" . A_MM . "_" . A_DD . "-" . A_Hour . "_" . A_min . "_" . A_Sec
	Array[A_Index] := time_now
;MsgBox, % Array[A_Index]
;MsgBox, % A_Index
	if (A_Index > Max_backups*5)
		break  ; Terminate the loop
}

GuiControl,,Status, Running!...
if (time_set_minutes == 1){
	TimeBetween := (TimeBetween*60000) ;transform minutes to milliseconds
}
if (time_set_seconds == 1){
	TimeBetween := (TimeBetween*1000) ;transform minutes to milliseconds
}
SetTimer, Run_backup, %TimeBetween%
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Stop_bkup:

GuiControl,,Status, Stoped!...
SetTimer, Run_backup, Off

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Run_backup:

time_now := % A_YYYY . "_" . A_MM . "_" . A_DD . "-" . A_Hour . "_" . A_min . "_" . A_Sec
Array[Interation] := time_now ;salva o horario atual na posição Interation 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if (Interation < Max_backups){

;;;;;;;;;;;;SE FOR FOLDER;;;;;;;;;;;

	if (Folder == 1){ ;se radio for folder
		;MsgBox,,,copy`n%Backup_output%\%time_now%,
		FileCopyDir, %Backup_input%, %Backup_output%\%time_now%, 0 ;cria o backup
		Value := Array[Interation+Max_backups] ;salva o valor de array na posição Interation pra variavel VALUE
		;MsgBox,,,delete`n%Backup_output%\%Value%,
		FileRemoveDir, %Backup_output%\%Value%, 1
	}

;;;;;;;;; SE FOR FILE;;;;;;;;;;;;;;;;;;;

	if (File == 1){ ;se radio for file
		;MsgBox,,,copy`n%Backup_output%\%time_now%,
		FileCopy, %Backup_input%, %Backup_output%\%time_now%.*
		Value := Array[Interation+Max_backups] ;salva o valor de array na posição Interation pra variavel VALUE
		;MsgBox,,,delete`n%Backup_output%\%Value%,
		FileDelete, %Backup_output%\%Value%.*
	}
	
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;SE FOR FOLDER;;;;;;;;;;;

if (Interation >= Max_backups){
	if (Folder == 1){ ;se radio for folder
		;MsgBox,,,copy`n%Backup_output%\%time_now%,
		FileCopyDir, %Backup_input%, %Backup_output%\%time_now%, 0 ;cria o backup
		Value := Array[Interation-Max_backups] ;salva o valor de array na posição Interation pra variavel VALUE
		;MsgBox,,,delete`n%Backup_output%\%Value%,
		FileRemoveDir, %Backup_output%\%Value%, 1
	}

;;;;;;;;; SE FOR FILE;;;;;;;;;;;;;;;;;;;

	if (File == 1){ ;se radio for file
		;MsgBox,,,copy`n%Backup_output%\%time_now%,
		FileCopy, %Backup_input%, %Backup_output%\%time_now%.*
		Value := Array[Interation-Max_backups] ;salva o valor de array na posição Interation pra variavel VALUE
		;MsgBox,,,delete`n%Backup_output%\%Value%,
		FileDelete, %Backup_output%\%Value%.*
	}
}

Interation += 1 ;incrementa 1 interação

		;MsgBox, , , Interation %Interation% , 1
if (Interation = (Max_backups*2)){
	Interation := 0
}

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

auto_sub:

Gui, Submit, NoHide

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Select_input:
Gui, Submit, NoHide
if (Folder == 1){
	FileSelectFolder, Backup_input , StartingFolder, Options, Prompt
}
if (File == 1){
	FileSelectFile, Backup_input ,,, Select file to backup
}
GuiControl,, Backup_input, % Backup_input

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Select_out:

FileSelectFolder, Backup_output , StartingFolder, Options, Prompt
GuiControl,, Backup_output, % Backup_output

return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GuiClose: ;when gui closes or esc, exit app
GuiEscape: 
Gui, Submit
IniWrite, %Backup_input%, config.ini,last_folders, input_folder
IniWrite, %Backup_output%, config.ini,last_folders, output_folder
IniWrite, %Max_backups%, config.ini,configs, max_backups
IniWrite, %TimeBetween%, config.ini,configs, time_between
Sleep, 1000

ExitApp