#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force

; marcoslino@prograru.com.br

dia := 0 ;valor 0 para dd
mes := 0 ;valor 0 para mm

loop, 12 {
	mes++
	FileCreateDir, database\mes - %mes%
	loop, 31 {
		dia++
		FileCreateDir, database\mes - %mes%\dia - %dia%	
	}
if (dia == 31) {
	dia := 0
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Menu, FileMenu, Add, Script Icon, MenuHandler
;Menu, FileMenu, Add, Suspend Icon, MenuHandler
;Menu, FileMenu, Add, Pause Icon, MenuHandler

;Menu, FileMenu, Icon, Script Icon, %A_AhkPath%, 2 ; Use the 2nd icon group from the file
;Menu, FileMenu, Icon, Suspend Icon, %A_AhkPath%, -206 ; Use icon with resource identifier 206
;Menu, FileMenu, Icon, Pause Icon, %A_AhkPath%, -207 ; Use icon with resource identifier 207

;Menu, MyMenuBar, Add, &Filesss, :FileMenu

;Gui, Menu, MyMenuBar


;;;;;;;;;;;
Gui, Font, s12
Gui, Add, Text, xm ym	, 	Proguaru - Controle de dia - v0.1
;Gui, Add, Picture, x0 y0 , watermark.png

Gui, Font, s10
Gui, Add, MonthCal, Section xm y40 4 8 gAuto_Submit vCalendario

Gui, Add, Radio, y50 x+m vDia_selecionado, DIA
Gui, Add, Radio, vSemana_selecionado, SEMANAL
Gui, Add, Radio, vMes_selecionado, MES


Gui, Font, s12
Gui, Add, Text, xm ys+170	, 	LISTA DE ARQUIVOS DO DIA
Gui, Font, s09
; Create the ListView with two columns, Name and Size:
Gui, Add, ListView, xm y+m r5 w350 gMyListView vMyLV, Nome


Gui, Add, Text, xm y+m , Arquivo: 
Gui, Add, Text, x+m yp	vSelecionado, Selecione um arquivo

Gui, Add, Text, x+m yp , Linha:
Gui, Add, Text, x+m yp	vSelecionado_linha

;;;;;;;;;;;;;;;;;;;;;;;;

Gui, Add, Edit, xm y+m r1 w245 vdropfile_path , caminho para arquivo

Gui, Add, Button, x+m yp gselect_file, Selecionar
Gui, Add, Button, x+m yp gsave_to_database, Salvar

Gui, Add, Button,  xm gRenomear, Renomear
Gui, Add, Button, x+m gRun_file, Abrir arquivo
Gui, Add, Button, x+m gdelete_file_from_database, Deletar
Gui, Add, Button, x+m gtestar, testar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ImageListID := IL_Create()  ; Create an ImageList to hold 10 small icons.
LV_SetImageList(ImageListID)  ; Assign the above ImageList to the current ListView.

Gosub, Auto_Submit
Gui, Show , w400  ;w-largura h-altura
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Auto_Submit:
Gui, Submit, NoHide  ; Save each control's contents to its associated variable.

LV_Delete()  ; Clear the ListView, but keep icon cache intact for simplicity.

ano_selecionado := % SubStr(Calendario, 1, 4) 
mes_selecionado := % SubStr(Calendario, 5, 2)
dia_selecionado := % SubStr(Calendario, 7, 2)

if (dia_selecionado < 10){
	dia_selecionado := % SubStr(dia_selecionado, 2, 1)
}

if (mes_selecionado < 10){
	mes_selecionado := % SubStr(mes_selecionado, 2, 1)
}

Loop, Files, database\mes - %mes_selecionado%\dia - %dia_selecionado%\*.*, R ; Gather a list of file names from a folder and put them into the ListView:
LV_Add("", A_LoopFileName, A_LoopFileSizeKB)
    IL_Add(ImageListID, A_LoopFileName, A_Index) 

LV_ModifyCol(1, 346)




; Loop 10  ; Load the ImageList with a series of icons from the DLL.
;     IL_Add(ImageListID, "shell32.dll", A_Index) 
; Loop 10  ; Add rows to the ListView (for demonstration purposes, one for each icon).
;     LV_Add("Icon" . A_Index, A_Index, "n/a")
; LV_ModifyCol("Hdr")  ; Auto-adjust the column widths.
; Gui Show
; return




return

;;;;;;;;;;;;;;;;;;;;;;;;

MyListView:

if (A_GuiEvent = "DoubleClick")
{
	LV_GetText(RowText, A_EventInfo)  ; Get the text from the row's first field.
	linha_selecionada := A_EventInfo
}

GuiControl  ,, Selecionado, %RowText%
GuiControl  ,, Selecionado_linha, %linha_selecionada%

return

;;;;;;;;;;;;;;;;;;;;;

Exit:
GuiClose:  ; Indicate that the script should exit automatically when the window is closed.
ExitApp

;;;;;;;;;;;;;;;;;

Testar:
msgbox database\mes - %mes_selecionado%\dia - %dia_selecionado%\%RowText%
return

;;;;;;;;;;;;;;;

GuiDropFiles:
parameter := A_GuiEvent
gosub parse_cmd
return

;;;;;;;

parse_cmd:
Loop , parse, parameter, `r`n
{
	dropfile_path = %A_LoopField%
	SplitPath , dropfile_path, ,,,dropfile_name
	Break
}
GuiControl  ,, dropfile_path, %dropfile_path%

return



;;;;;;;;;;;;;;;;;

select_file:

FileSelectFile, dropfile_path ,,, Select file to backup
GuiControl,, dropfile_path, % dropfile_path

return
;;;;;;;;;;;;;;;

save_to_database:
FileCopy, %dropfile_path%, database\mes - %mes_selecionado%\dia - %dia_selecionado%\
Gosub, Auto_Submit
return
;;;;;;;;;;;;;;;;;

delete_file_from_database:

MsgBox, 4,, Deseja DELETAR o arquivo >>%RowText%<<?
IfMsgBox Yes
	FileDelete, database\mes - %mes_selecionado%\dia - %dia_selecionado%\%RowText%
Gosub, Auto_Submit
return

;;;;;;;;;;;;;

Run_file:
MsgBox, 4,, Deseja abrir o arquivo >>%RowText%<<?
IfMsgBox Yes
run "database\mes - %mes_selecionado%\dia - %dia_selecionado%\%RowText%"
else{}
Gosub, Auto_Submit
return

;;;;;;;;;;;;;;;;;;;;

Renomear:
msgbox_output := 0
MsgBox, 4,, Deseja RENOMEAR o arquivo >>%RowText%<< ?
IfMsgBox Yes
msgbox_output := 1
IfMsgBox No
msgbox_output := 0
;;;;;;;
if (msgbox_output == 1){
InputBox, NovoNome , Novo nome, Digite o novo nome

if (ErrorLevel == 1) {
	} else {
FileMove, database\mes - %mes_selecionado%\dia - %dia_selecionado%\%RowText%, database\mes - %mes_selecionado%\dia - %dia_selecionado%\%NovoNome%.*
Gosub, Auto_Submit	
} }
return

;;;;;;;;;;;;;;;;

