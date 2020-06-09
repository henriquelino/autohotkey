#SingleInstance force
#NoEnv


SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% 
full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)")){
	try
	{
		if A_IsCompiled
			Run *RunAs "%A_ScriptFullPath%" /restart
		else
			Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
	}
	ExitApp
}

waitloadend(){
loop{
if (%A_index%>20){ ;if loop runs for more than 10 times then something isnt right, maybe disconnect error
MsgBox something isn't right
			Break
		}
		
		Sleep 500
		PixelGetColor, color,584, 1060 ;get pixel color to see if battlemode is active or NoT
		if (color=0xF7F7F7){ ;se a cor for branca no loading...
			break
		}
	}
} ;end of waitloadend

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

deactivebm(){
	PixelGetColor, color,584, 1060 ;get pixel color to see if battlemode is active or NoT
	if (color!=0xF7F7F7){ ;battlemode is active, we need to desactive
		SendInput, {enter}
	}
}

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

sub_and_go_to_rag(){ ;submit buttons and go to ragnarok
	Gui, Submit, NoHide  ; Save each control's contents to its associated variable.
	WinActivate, ahk_exe dreamerro.exe
	Sleep 1000
	
}


;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

next_enabled(){
	
	loop{
		PixelGetColor, color, 343, 275 ;get pixel color to see if battlemode is active or NoT
		if (color=0xFFFFFF){ ;battlemode is active, we need to desactive
			SendInput, {enter}
;MouseClick, left, 454,278 , 4, 2
			break
		}
		sleep 200
		if (A_Index > 10){
			MsgBox, thanatos seal is not active
			Reload,
			break  ; Terminate the loop
		}
		
	}
}

;<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

ok_enabled(){
	loop {
		PixelGetColor, color, 1000, 460 ;get pixel color to see if battlemode is active or NoT
		if (color=0xFFFFFF){
			SendInput, {enter}
;MouseClick, left, 1155,471 , 2, 2
			break
		}
		sleep 200
		if (A_Index > 10){
			MsgBox, thanatos seal is not active
			Reload,
			break  ; Terminate the loop
		}
		
	}
}

;<<<<<<<<BEGIN OF AUTOLOOT TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


Gui, Add, Tab3,xm ym w400 h280 vMyTab, Autoloot|Macro|MVP Hunter|Config|debug  ; Tab2 vs. Tab requires [v1.0.47.05+].

Gui, Add, Checkbox, xp+15  yp+40 	vAutoloot_item1, Dead Branch
Gui, Add, Checkbox, xp+120 yp 		vAutoloot_item2, Yggdrasil Berry
Gui, Add, Checkbox, xp+120 yp 		vAutoloot_item3, Thanatos Fragments
Gui, Add, Checkbox, xp-240 yp+25 	vAutoloot_item4, Resistant Potions
Gui, Add, Checkbox, xp+120 			vAutoloot_item5, Old Card Album
Gui, Add, Checkbox, xp+120 			vAutoloot_item6, Oridecon
Gui, Add, Checkbox, xp-240 yp+25 	vAutoloot_item7, Elunium
Gui, Add, Checkbox, xp+120			vAutoloot_item8, Panacea
Gui, Add, Checkbox, xp+120			vAutoloot_item9, Mastela
Gui, Add, Checkbox, xp-240 yp+25	vAutoloot_item10, Cursed Water
Gui, Add, Checkbox, xp+120			vAutoloot_item11, Rate 15
Gui, Add, Checkbox, xp+120			vAutoloot_item12, Gift Box
Gui, Add, Checkbox, xp-240 yp+25	vAutoloot_item13, Custom 1
Gui, Add, Checkbox, xp+120			vAutoloot_item14, Custom 2
Gui, Add, Checkbox, xp+120			vAutoloot_item15, Custom 3
Gui, Add, Checkbox, xp-240 yp+25	vAutoloot_item16, Custom 4
Gui, Add, Checkbox, xp+120			vAutoloot_item17, Converters
Gui, Add, Checkbox, xp+120			vAutoloot_item18, Boxes
Gui, Add, Checkbox, xp-240 yp+25	vAutoloot_item19, Poison items
Gui, Add, Checkbox, xp+120			vAutoloot_item20, Dyestuff
Gui, Add, Checkbox, xp+120			vAutoloot_item21, clear on start

Gui, Add, Button, default xp-120 yp+35 w70 h30, Run  	; xm puts it at the bottom left corner.

;<<<<<<<<<<END OF AUTOLOOT TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Gui, Tab, 2 ;macro tab
;Gui, Add, GroupBox,y+m x+m w375 h300, Keys to press repeatedly

;-------------- Fs LINE ------------
Gui, Font, s9
Gui, Add, Text,xm+20 ym+25	, 	F1
Gui, Add, Text,xp+25 yp 	, 	F2
Gui, Add, Text,xp+25 yp		, 	F3
Gui, Add, Text,xp+25 yp 	, 	F4
Gui, Add, Text,xp+25 yp		, 	F5
Gui, Add, Text,xp+25 yp 	, 	F6
Gui, Add, Text,xp+25 yp		, 	F7
Gui, Add, Text,xp+25 yp 	, 	F8
Gui, Add, Text,xp+25 yp 	, 	F9

;------------  RADIOS ----------
Gui, Add, Radio, h15 w15 xm+20 yp+15 Group 		gMacroUpdate vMacro1, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro2,
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro3,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro4, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro5, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro6,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro7, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro8, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro9,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro10, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro11, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro12,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro13, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro14, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro15,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro16, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro17, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro18,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro19, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro20, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro21,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro22, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro23, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro24, 
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro25, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro26,  
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro27, 

;--------------- TOOLTIP ---------
Gui, Font, s8
Gui, Add, Text,xp+25 yp 	, 	Off
Gui, Add, Text,xp yp-16 	, 	Just quick fire
Gui, Add, Text,xp yp-16		, 	Click before SendInput,

;-------------- 12345 LINE ------------
Gui, Font, s9
Gui, Add, Text,xm+20 yp+48	, 	1
Gui, Add, Text,xp+25 yp 	, 	2
Gui, Add, Text,xp+25 yp		, 	3
Gui, Add, Text,xp+25 yp 	, 	4
Gui, Add, Text,xp+25 yp		, 	5
Gui, Add, Text,xp+25 yp 	, 	6
Gui, Add, Text,xp+25 yp		, 	7
Gui, Add, Text,xp+25 yp 	, 	8
Gui, Add, Text,xp+25 yp 	, 	9

;------------  RADIOS ----------
Gui, Add, Radio, h15 w15 xm+20 yp+15 Group 		gMacroUpdate vMacro28, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro29,
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro30,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro31, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro32, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro33,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro34, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro35, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro36,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro37, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro38, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro39,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro40, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro41, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro42,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro43, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro44, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro45,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro46, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro47, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro48,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro49, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro50, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro51, 
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro52, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro53,  
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro54, 

;--------------- TOOLTIP ---------
Gui, Font, s8  ; Set 10-point Verdana.
Gui, Add, Text,xp+25 yp 	, 	Off
Gui, Add, Text,xp yp-16 	, 	Just quick fire
Gui, Add, Text,xp yp-16		, 	Click before SendInput,

;-------------- QWERTY LINE ------------
Gui, Font, s9  ; Set 10-point Verdana.
Gui, Add, Text,xm+20 yp+48	, 	Q
Gui, Add, Text,xp+25 yp 	, 	W
Gui, Add, Text,xp+25 yp		, 	E
Gui, Add, Text,xp+25 yp 	, 	R
Gui, Add, Text,xp+25 yp		, 	T
Gui, Add, Text,xp+25 yp 	, 	Y
Gui, Add, Text,xp+25 yp		, 	U
Gui, Add, Text,xp+25 yp 	, 	I
Gui, Add, Text,xp+25 yp 	, 	O
;------------  RADIOS ----------
Gui, Add, Radio, h15 w15 xm+20 yp+15 Group 		gMacroUpdate vMacro55, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro56,
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro57,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro58, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro59, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro60,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro61, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro62, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro63,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro64, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro65, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro66,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro67, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro68, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro69,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro70, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro71, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro72,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro73, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro74, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro75,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro76, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro77, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro78, 
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro79, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro80,  
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro81, 
;--------------- TOOLTIP ---------
Gui, Font, s8
Gui, Add, Text,xp+25 yp 	, 	Off
Gui, Add, Text,xp yp-16 	, 	Just quick fire
Gui, Add, Text,xp yp-16		, 	Click before SendInput,

;-------------- ASDF LINE ------------
Gui, Font, s9
Gui, Add, Text,xm+20 yp+48	, 	A
Gui, Add, Text,xp+25 yp 	, 	S
Gui, Add, Text,xp+25 yp		, 	D
Gui, Add, Text,xp+25 yp 	, 	F
Gui, Add, Text,xp+25 yp		, 	G
Gui, Add, Text,xp+25 yp 	, 	H
Gui, Add, Text,xp+25 yp		, 	J
Gui, Add, Text,xp+25 yp 	, 	K
Gui, Add, Text,xp+25 yp 	, 	L

;------------  RADIOS ----------
Gui, Add, Radio, h15 w15 xm+20 yp+15 Group 		gMacroUpdate vMacro82, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro83,
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro84,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro85, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro86, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro87,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro88, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro89, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro90,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro91, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro92, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro93,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro94, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro95, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro96,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro97, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro98, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro99,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro100, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro101, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro102,
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro103, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro104, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro105, 
Gui, Add, Radio, h15 w15 xp+25 yp-32 Group 		gMacroUpdate vMacro106, 
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro107,  
Gui, Add, Radio, h15 w15 xp yp+16 				gMacroUpdate vMacro108, 
;--------------- TOOLTIP ---------
Gui, Font, s8  ; Set 10-point Verdana.
Gui, Add, Text,xp+25 yp 	, 	Off
Gui, Add, Text,xp yp-16 	, 	Just quick fire
Gui, Add, Text,xp yp-16		, 	Click before SendInput,


;<<<<<<<<<<END OF MACRO TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<BEGIN OF MVP HUNTER TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Gui, Tab, 3
boss_list:="Thanatos|Thanatos Full|Amon Ra|Tao Gunka|Stormy Knight|GTB|Gloom Under Night|Kiel|Evil Snake Lord|Orc Hero|RSX-0806|Tendrillion|Atroce (ra_fild03)|Atroce (ra_fild04)|Atroce (ve_fild01)|Atroce (ve_fild02)|Boitata|Fallen Bishop Hibram|Garm|Gopinich|Maya|Wounded Morroc|Angeling+Deviling+Ghostring (pay_fild04)|Angeling (xmas_dun01)|Angeling+Deviling (yuno_fild03)|Archangeling|Incantation Samurai|Lady Tanee|Valkyrie Randgris|Gold Queen Scaraba|Queen Scaraba|Turtle General|Vesper|Kraken|Ifrit|Beelzebub|"

Gui, Font, s11  ; Set 10-point Verdana.

;----------------------mvp selector section------------

Gui, Add, GroupBox,y+m x+m w350 h50, MVP Hunter

Gui, Add, DDL, xp+5 yp+20 w280 h30 Sort gMVP_info vMVP_hunter r20, % boss_list
Gui, Add, Button, default x+m yp-1 w40 h25 , GO!


;----------------------mvp info section------------
Gui, Add, GroupBox,xp-295 yp+35 w350 h180, MVP Info

Gui, Add, Text, xp+110 yp+15, Elemental damage

Gui, Add, Text, xp-75 yp+20, 	Neutral:
Gui, Add, Text, xp+85 yp w55	vMVP_neutral, N/A

Gui, Add, Text, xp-85 yp+20, 	Fire:
Gui, Add, Text, xp+85 yp w55	vMVP_fire, N/A

Gui, Add, Text, xp-85 yp+20,	Earth:
Gui, Add, Text, xp+85 yp w55	vMVP_earth, N/A

Gui, Add, Text, xp-85 yp+20,	Wind:
Gui, Add, Text, xp+85 yp w55	vMVP_wind, N/A

Gui, Add, Text, xp-85 yp+20,	Water:
Gui, Add, Text,	xp+85 yp w55	vMVP_water, N/A
;-------------------------------------------------
Gui, Add, Text,	xp+80 yp-80,	Poison:
Gui, Add, Text,	xp+80 yp w55	vMVP_poison, N/A

Gui, Add, Text, xp-80 yp+20,	Holy:
Gui, Add, Text,	xp+80 yp w55	vMVP_holy, N/A

Gui, Add, Text, xp-80 yp+20,	Shadow:
Gui, Add, Text,	xp+80 yp w55	vMVP_shadow, N/A

Gui, Add, Text, xp-80 yp+20,	Ghost:
Gui, Add, Text,	xp+80 yp w55	vMVP_ghost, N/A

Gui, Add, Text, xp-80 yp+20,	Undead:
Gui, Add, Text,	xp+80 yp w55	vMVP_undead, N/A

;<<<<<<<<<<END OF MVP HUNTER TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

;<<<<<<<<BEGIN OF CONFIG TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


Gui, Tab, 4
Gui, Add, Text, xm+10 y+m,	Quickfire delay:
Gui, Add, Edit , gMacroUpdate
Gui, Add, UpDown, gMacroUpdate vMacro_Delay Range25-3000, 500


Gui, Add, Text, xm+10 y+m,	Click before send delay:
Gui, Add, Edit , gMacroUpdate
Gui, Add, UpDown, gMacroUpdate vMacro_Delay_click Range25-3000, 500

;<<<<<<<<<<END OF MISC TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


;<<<<<<<<BEGIN OF DEBUG TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
Gui, Tab, 5
Gui, Add, Button,, Testenabled
Gui, Add, Button,x+m, Teste_ok
Gui, Add, Button,x+m, Teste_radio

Gui, Add, Button,x20 y+5 , custom
Gui, Add, Button,x+20  , savetest
Gui, Add, Button,x+20 , loadtest
Gui, Add, Edit, x20 y+ 16 w300 R10 vMyEdit

;<<<<<<<<<<END OF DEBUG TAB<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Gui, Tab  ; i.e. subsequently-added controls will not belong to the tab control.

;Gui, Add, Button, default xm, OK  		; xm puts it at the bottom left corner.
Gui, Font  ; Set 10-point Verdana.

;<<<<<<<<BEGIN OF BOTTOM CONTRLS<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

Gui, Add, Button, x20 y295 h20 w50, Save  	; xm puts it at the bottom left corner.
Gui, Add, Button, default x+m h20 w50, Load  	; xm puts it at the bottom left corner.
Gui, Add, DDL, x+m w80 Sort vprofile, Profile 1||Profile 2|Profile 3|Profile 4|Profile 5|
Gui, add, Button, x+140 ypw50 h20, Reload

;<<<<<<<<END OF BOTTOM CONTRLS<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<




set_timer_func()
set_timer_func(){
	if (set_timer==1){
		
	}
}


set_radio_to_off()
set_radio_to_off(){
	loop, 108 {
		GuiControl,, macro%A_Index%, 1
	}
}
set_dist_mode()
set_dist_mode(){
	dist_mode = 1  ;0 for free, 1 for pro, 2 for dev
	
	if (dist_mode = 0) {
		
		Random, rand_reload , 30000, 45000
		SetFormat, float, 0.2
		timeout := rand_reload/1000
		
		MsgBox, 48 , ,You are running the test version!`nTimeout in around %timeout% seconds
		SetTimer, reload_inst, %rand_reload%
		
		;-----------------------disable interface items----------
		GuiControl, Disable, Load
		GuiControl, Disable, Save
		GuiControl, Disable, Profile 1
		GuiControl,, MyTab, |Autoloot|Macro|MVP Hunter
		
		;-----------------------disable MVPs----------
		boss_list:="|Thanatos|Stormy Knight|Gloom Under Night|Evil Snake Lord|RSX-0806|Atroce (ra_fild03)|Boitata|Fallen Bishop Hibram|Maya|Wounded Morroc|Angeling (xmas_dun01)|Archangeling|Incantation Samurai|Lady Tanee|Turtle General|Vesper|Beelzebub"
		GuiControl,, MVP_hunter, % boss_list
		

		Gui, Show,, FREE VERSION
		} ;END OF DIST MODE 0
		if(dist_mode = 1){
			GuiControl,, MyTab, |Autoloot|Macro|MVP Hunter|Config
			Gui, Show,, PRO VERSION
		}
	}

return
;----------------end of autoexecute----------------<<<<<<<<<<<<<


;<<<<<<<<BUTTONS<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
MacroUpdate:
Gui, Submit, NoHide  ;submit changes to the vars
return

~$F1::
if (Macro1=1){ ;click before SendInput,
	While GetKeyState("F1","p"){
		SendEvent, {Click}
		SendInput, {F1}
		Sleep, %macro_delay_click%
}}
if (Macro2=1){ ;just quick fire
	While GetKeyState("F1","p"){
		SendInput, {F1}
		Sleep %macro_delay%
}}
return
;---------------
~$F2::
if (Macro4=1){ ;click before SendInput,
	While GetKeyState("F2","p"){
;MouseMove, A_ScreenWidth/2, A_ScreenHeight/2
		SendEvent, {Click}
		SendInput, {F2}
		Sleep, %macro_delay_click%
}}
if (Macro5=1){ ;just quick fire
	While GetKeyState("F2","p"){
		SendInput, {F2}
		Sleep %macro_delay%
}}
return
;---------------

~$F3::
if (Macro7=1){ ;click before SendInput,
	While GetKeyState("F3","p"){
		SendEvent, {Click}
		SendInput, {F3}
		Sleep, %macro_delay_click%
}}
if (Macro8=1){ ;just quick fire
	While GetKeyState("F3","p"){
		SendInput, {F3}
		Sleep %macro_delay%
}}
return
;---------------

~$F4::
if (Macro10=1){ ;click before SendInput,
	While GetKeyState("F4","p"){
		SendEvent, {Click}
		SendInput, {F4}
		Sleep, %macro_delay_click%
}}
if (Macro11=1){ ;just quick fire
	While GetKeyState("F4","p"){
		SendInput, {F4}
		Sleep %macro_delay%
}}
return
;---------------

~$F5::
if (Macro13=1){ ;click before SendInput,
	While GetKeyState("F5","p"){
		SendEvent, {Click}
		SendInput, {F5}
		Sleep, %macro_delay_click%
}}
if (Macro14=1){ ;just quick fire
	While GetKeyState("F5","p"){
		SendInput, {F5}
		Sleep %macro_delay%
}}
return
;---------------

~$F6::
if (Macro16=1){ ;click before SendInput,
	While GetKeyState("F6","p"){
		SendEvent, {Click}
		SendInput, {F6}
		Sleep, %macro_delay_click%
}}
if (Macro17=1){ ;just quick fire
	While GetKeyState("F6","p"){
		SendInput, {F6}
		Sleep %macro_delay%
}}
return
;---------------

~$F7::
if (Macro19=1){ ;click before SendInput,
	While GetKeyState("F7","p"){
		SendEvent, {Click}
		SendInput, {F7}
		Sleep, %macro_delay_click%
}}
if (Macro20=1){ ;just quick fire
	While GetKeyState("F7","p"){
		SendInput, {F7}
		Sleep %macro_delay%
}}
return
;---------------

~$F8::
if (Macro22=1){ ;click before SendInput,
	While GetKeyState("F8","p"){
		SendEvent, {Click}
		SendInput, {F8}
		Sleep, %macro_delay_click%
}}
if (Macro23=1){ ;just quick fire
	While GetKeyState("F8","p"){
		SendInput, {F8}
		Sleep %macro_delay%
}}
return
;---------------

~$F9::
if (Macro25=1){ ;click before SendInput,
	While GetKeyState("F9","p"){
		SendEvent, {Click}
		SendInput, {F9}
		Sleep, %macro_delay_click%
}}
if (Macro26=1){ ;just quick fire
	While GetKeyState("F9","p"){
		SendInput, {F9}
		Sleep %macro_delay%
}}
return
;-------------------

~$1::
if (Macro28=1){ ;click before SendInput,
	While GetKeyState("1","p"){
		SendEvent, {Click}
		SendInput, {1}
		Sleep, %macro_delay_click%
}}
if (Macro29=1){ ;just quick fire
	While GetKeyState("1","p"){
		SendInput, {1}
		Sleep %macro_delay%
}}
return
;---------------

~$2::
if (Macro31=1){ ;click before SendInput,
	While GetKeyState("2","p"){
		SendEvent, {Click}
		SendInput, {2}
		Sleep, %macro_delay_click%
}}
if (Macro32=1){ ;just quick fire
	While GetKeyState("2","p"){
		SendInput, {2}
		Sleep %macro_delay%
}}
return
;---------------

~$3::
if (Macro34=1){ ;click before SendInput,
	While GetKeyState("3","p"){
		SendEvent, {Click}
		SendInput, {3}
		Sleep, %macro_delay_click%
}}
if (Macro35=1){ ;just quick fire
	While GetKeyState("3","p"){
		SendInput, {3}
		Sleep %macro_delay%
}}
return
;---------------

~$4::
if (Macro37=1){ ;click before SendInput,
	While GetKeyState("4","p"){
		SendEvent, {Click}
		SendInput, {4}
		Sleep, %macro_delay_click%
}}
if (Macro38=1){ ;just quick fire
	While GetKeyState("4","p"){
		SendInput, {4}
		Sleep %macro_delay%
}}
return
;---------------

~$5::
if (Macro40=1){ ;click before SendInput,
	While GetKeyState("5","p"){
		SendEvent, {Click}
		SendInput, {5}
		Sleep, %macro_delay_click%
}}
if (Macro41=1){ ;just quick fire
	While GetKeyState("5","p"){
		SendInput, {5}
		Sleep %macro_delay%
}}
return
;---------------

~$6::
if (Macro43=1){ ;click before SendInput,
	While GetKeyState("6","p"){
		SendEvent, {Click}
		SendInput, {6}
		Sleep, %macro_delay_click%
}}
if (Macro44=1){ ;just quick fire
	While GetKeyState("6","p"){
		SendInput, {6}
		Sleep %macro_delay%
}}
return
;---------------

~$7::
if (Macro46=1){ ;click before SendInput,
	While GetKeyState("7","p"){
		SendEvent, {Click}
		SendInput, {7}
		Sleep, %macro_delay_click%
}}
if (Macro47=1){ ;just quick fire
	While GetKeyState("7","p"){
		SendInput, {7}
		Sleep %macro_delay%
}}
return
;---------------

~$8::
if (Macro49=1){ ;click before SendInput,
	While GetKeyState("8","p"){
		SendEvent, {Click}
		SendInput, {8}
		Sleep, %macro_delay_click%
}}
if (Macro50=1){ ;just quick fire
	While GetKeyState("8","p"){
		SendInput, {8}
		Sleep %macro_delay%
}}
return
;---------------

~$9::
if (Macro52=1){ ;click before SendInput,
	While GetKeyState("9","p"){
		SendEvent, {Click}
		SendInput, {9}
		Sleep, %macro_delay_click%
}}
if (Macro53=1){ ;just quick fire
	While GetKeyState("9","p"){
		SendInput, {9}
		Sleep %macro_delay%
}}
return
;---------------

~$q::
if (Macro55=1){ ;click before SendInput,
	While GetKeyState("q","p"){
		SendEvent, {Click}
		SendInput, {q}
		Sleep, %macro_delay_click%
}}
if (Macro56=1){ ;just quick fire
	While GetKeyState("q","p"){
		SendInput, {q}
		Sleep %macro_delay%
}}
return
;---------------

~$w::
if (Macro58=1){ ;click before SendInput,
	While GetKeyState("w","p"){
		SendEvent, {Click}
		SendInput, {w}
		Sleep, %macro_delay_click%
}}
if (Macro59=1){ ;just quick fire
	While GetKeyState("w","p"){
		SendInput, {w}
		Sleep %macro_delay%
}}
return
;---------------

~$e::
if (Macro61=1){ ;click before SendInput,
	While GetKeyState("e","p"){
		SendEvent, {Click}
		SendInput, {e}
		Sleep, %macro_delay_click%
}}
if (Macro62=1){ ;just quick fire
	While GetKeyState("e","p"){
		SendInput, {e}
		Sleep %macro_delay%
}}
return
;---------------

~$r::
if (Macro64=1){ ;click before SendInput,
	While GetKeyState("r","p"){
		SendEvent, {Click}
		SendInput, {r}
		Sleep, %macro_delay_click%
}}
if (Macro65=1){ ;just quick fire
	While GetKeyState("r","p"){
		SendInput, {r}
		Sleep %macro_delay%
}}
return
;---------------

~$t::
if (Macro67=1){ ;click before SendInput,
	While GetKeyState("t","p"){
		SendEvent, {Click}
		SendInput, t
		Sleep, %macro_delay_click%
}}
if (Macro68=1){ ;just quick fire
	While GetKeyState("t","p"){
		SendInput, t
		Sleep %macro_delay%
}}
return
;---------------

~$y::
if (Macro70=1){ ;click before SendInput,
	While GetKeyState("y","p"){
		SendEvent, {Click}
		SendInput, {y}
		Sleep, %macro_delay_click%
}}
if (Macro71=1){ ;just quick fire
	While GetKeyState("y","p"){
		SendInput, {y}
		Sleep %macro_delay%
}}
return
;---------------

~$u::
if (Macro73=1){ ;click before SendInput,
	While GetKeyState("u","p"){
		SendEvent, {Click}
		SendInput, {u}
		Sleep, %macro_delay_click%
}}
if (Macro74=1){ ;just quick fire
	While GetKeyState("u","p"){
		SendInput, {u}
		Sleep %macro_delay%
}}
return
;---------------

~$i::
if (Macro76=1){ ;click before SendInput,
	While GetKeyState("i","p"){
		SendEvent, {Click}
		SendInput, {i}
		Sleep, %macro_delay_click%
}}
if (Macro77=1){ ;just quick fire
	While GetKeyState("i","p"){
		SendInput, {i}
		Sleep %macro_delay%
}}
return
;---------------

~$o::
if (Macro79=1){ ;click before SendInput,
	While GetKeyState("o","p"){
		SendEvent, {Click}
		SendInput, {o}
		Sleep, %macro_delay_click%
}}
if (Macro80=1){ ;just quick fire
	While GetKeyState("o","p"){
		SendInput, {o}
		Sleep %macro_delay%
}}
return
;----------------------

~$a::
if (Macro82=1){ ;click before SendInput,
	While GetKeyState("a","p"){
		SendEvent, {Click}
		SendInput, {a}
		Sleep, %macro_delay_click%
}}
if (Macro83=1){ ;just quick fire
	While GetKeyState("a","p"){
		SendInput, {a}
		Sleep %macro_delay%
}}
return
;---------------

~$s::
if (Macro85=1){ ;click before SendInput,
	While GetKeyState("s","p"){
		SendEvent, {Click}
		SendInput, {s}
		Sleep, %macro_delay_click%
}}
if (Macro86=1){ ;just quick fire
	While GetKeyState("s","p"){
		SendInput, {s}
		Sleep %macro_delay%
}}
return
;---------------

~$d::
if (Macro88=1){ ;click before SendInput,
	While GetKeyState("d","p"){
		SendEvent, {Click}
		SendInput, {d}
		Sleep, %macro_delay_click%
}}
if (Macro89=1){ ;just quick fire
	While GetKeyState("d","p"){
		SendInput, {d}
		Sleep %macro_delay%
}}
return
;---------------

~$f::
if (Macro91=1){ ;click before SendInput,
	While GetKeyState("f","p"){
		SendEvent, {Click}
		SendInput, {f}
		Sleep, %macro_delay_click%
}}
if (Macro92=1){ ;just quick fire
	While GetKeyState("f","p"){
		SendInput, {f}
		Sleep %macro_delay%
}}
return
;---------------

~$g::
if (Macro94=1){ ;click before SendInput,
	While GetKeyState("g","p"){
		SendEvent, {Click}
		SendInput, {g}
		Sleep, %macro_delay_click%
}}
if (Macro95=1){ ;just quick fire
	While GetKeyState("g","p"){
		SendInput, {g}
		Sleep %macro_delay%
}}
return
;---------------

~$h::
if (Macro97=1){ ;click before SendInput,
	While GetKeyState("h","p"){
		SendEvent, {Click}
		SendInput, {h}
		Sleep, %macro_delay_click%
}}
if (Macro98=1){ ;just quick fire
	While GetKeyState("h","p"){
		SendInput, {h}
		Sleep %macro_delay%
}}
return
;---------------

~$j::
if (Macro100=1){ ;click before SendInput,
	While GetKeyState("j","p"){
		SendEvent, {Click}
		SendInput, {j}
		Sleep, %macro_delay_click%
}}
if (Macro101=1){ ;just quick fire
	While GetKeyState("j","p"){
		SendInput, {j}
		Sleep %macro_delay%
}}
return
;---------------

~$k::
if (Macro103=1){ ;click before SendInput,
	While GetKeyState("k","p"){
		SendEvent, {Click}
		SendInput, {k}
		Sleep, %macro_delay_click%
}}
if (Macro104=1){ ;just quick fire
	While GetKeyState("k","p"){
		SendInput, {k}
		Sleep %macro_delay%
}}
return
;---------------

~$l::
if (Macro106=1){ ;click before SendInput,
	While GetKeyState("l","p"){
		SendEvent, {Click}
		SendInput, {l}
		Sleep, %macro_delay_click%
}}
if (Macro107=1){ ;just quick fire
	While GetKeyState("l","p"){
		SendInput, {l}
		Sleep %macro_delay%
}}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ButtonCustom: ;run code from testenabled button


return
;-----------------

Buttonsavetest: ;run code from testenabled button

Gui, Submit, NoHide  ; Save each control's contents to its associated variable.
;myedit := RTrim(myedit, OmitChars := " `t")

Loop, parse, myedit, `n, `r  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.
{
 IniWrite, %A_LoopField%, config.ini, custom, myedit_%A_Index%

}
return
;-----------------

Buttonloadtest: ;run code from testenabled button



loop, 20











IniRead, readoutput, config.ini, custom

readoutput := SubStr(readoutput, 8)

Loop, parse, readoutput, `n, `r  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.
{
    MsgBox, 4, , Line number %A_Index% is %A_LoopField%.`n`nContinue?
    IfMsgBox, No, break
}

GuiControl,, MyEdit, %readoutput%
return
;-----------------
ButtonTestenabled: ;run code from testenabled button
sub_and_go_to_rag()
next_enabled()
return
;-----------------
ButtonTeste_radio: ;run code from testenabled button
Sleep, 2000
SendInput, running{enter}
SendInput, running{enter}
SendInput, running{enter}
SendInput, running{enter}
SendInput, running{enter}
SendInput, running{enter}
While (GetKeyState("PGdn","p")!=1){
}

SendInput, running{enter}
SendInput, running{enter}
SendInput, running{enter}
SendInput, running DOWN A DREAM{enter}
return
;-----------------
ButtonTeste_ok: ;runs the code from teste_ok button
sub_and_go_to_rag()
ok_enabled()
return
;-----------------
Reload_inst:
MsgBox, 48 , , Reloading.....`npurchase full version to stop random restarts, 3
Reload
Return

ButtonReload: ;reload instance, just like closing and oppening again
Reload
MsgBox, , , Reloading, 10
return
;-----------------
ButtonRun: ;runs the autoloot section
sub_and_go_to_rag() ;changes to ragnarok
deactivebm() ;check and deactive BattleMode(BM)

SendInput, /check STARTING_AUTOLOOT_SEND{enter}
Sleep 300

if (autoloot_item21=1){ ;clear on start
	SendInput, @autoloot clear{enter}
	Sleep 300
}

if (autoloot_item1=1){ ;dead branch
	SendInput, @autoloot item 604 {enter}
	Sleep 300
}

if (autoloot_item2=1){ ;yggdrasil berry
	SendInput, @autoloot item 607{enter}
	Sleep 300
} 

if (autoloot_item3=1){ ;thanatos frags
	SendInput, @autoloot item 7436{enter}
	Sleep 300
	SendInput, @autoloot item 7437{enter}
	Sleep 300
	SendInput, @autoloot item 7438{enter}
	Sleep 300
	SendInput, @autoloot item 7439{enter}
	Sleep 300
}

if (autoloot_item4=1){ ;resist pots
	SendInput, @autoloot item 12118{enter}
	Sleep 300
	SendInput, @autoloot item 12119{enter}
	Sleep 300
	SendInput, @autoloot item 12120{enter}
	Sleep 300
	SendInput, @autoloot item 12121{enter}
	Sleep 300
}

if (autoloot_item5=1){ ;old card album
	SendInput, @autoloot item 616{enter}
	Sleep 300
}

if (autoloot_item6=1){ ;oridecon
	SendInput, @autoloot item oridecon{enter}
	Sleep 300
}

if (autoloot_item7=1){ ;elunium
	SendInput, @autoloot item elunium{enter}
	Sleep 300
}

if (autoloot_item8=1){ ;panacea
	SendInput, @autoloot item 525{enter}
	Sleep 300
}

if (autoloot_item9=1){ ;mastela
	SendInput, @autoloot item 522{enter}
	Sleep 300
}

if (autoloot_item10=1){ ;cursed water
	SendInput, @autoloot item 12020{enter}
	Sleep 300
}

if (autoloot_item11=1){ ;rate 15
	SendInput, @autoloot rate 15{enter}
	Sleep 300
}

if (autoloot_item12=1){ ;gift box
	SendInput, @autoloot item 644{enter}
	Sleep 300
}

if (autoloot_item13=1){ ;..
	SendInput, @autoloot item{enter}
	Sleep 300
}

if (autoloot_item14=1){ ;..
	SendInput, @autoloot item{enter}
	Sleep 300
}

if (autoloot_item15=1){ ;..
	SendInput, @autoloot item{enter}
	Sleep 300
}

if (autoloot_item16=1){ ;
	; SendInput, @autoloot item 7420{enter} ;100 skull
	; Sleep 300
	; SendInput, @autoloot item 7439{enter} ;10 frag of despair
	; Sleep 300
	; SendInput, @autoloot item 7438{enter} ;10 frag of hatred
	; Sleep 300
	; SendInput, @autoloot item 7437{enter} ;10 frag of misery
	; Sleep 300
	; SendInput, @autoloot item 7436{enter} ;10 frag of agony
	; Sleep 300
	; SendInput, @autoloot item 7448{enter} ;10 yellow bijou
	; Sleep 300
	; SendInput, @autoloot item 7447{enter} ;10 red bijou
	; Sleep 300
	; SendInput, @autoloot item 7446{enter} ;10 blue bijou
	; Sleep 300
	; SendInput, @autoloot item 7445{enter} ;10 green bijou
	; Sleep 300
	; SendInput, @autoloot item 983{enter} ;5 black dye
	; Sleep 300
	; SendInput, @autoloot item 982{enter} ;5 white dye
	; Sleep 300
	; SendInput, @autoloot item 978{enter} ;5 cobalt blue dye
	; Sleep 300
	; SendInput, @autoloot item 979{enter} ;5 scarlet dye
	; Sleep 300
	; SendInput, @autoloot item 1019{enter} ;150x trunk
	; Sleep 300
	; SendInput, @autoloot item 7069{enter} ;250x destroyed armor
	; Sleep 300
	; SendInput, @autoloot item 1059{enter} ;750x fabric
	; Sleep 300
	; SendInput, @autoloot item 1000{enter} ;5x star crumb
	; Sleep 300
	; SendInput, @autoloot item 949{enter} ;500x feather
	; Sleep 300
	; SendInput, @autoloot item 7023{enter} ;50x blade lost in darkness
	; Sleep 300
	; SendInput, @autoloot item 7017{enter} ;50x exectioners mitten
	; Sleep 300
	; SendInput, @autoloot item 969{enter} ;25x gold
	; Sleep 300
	; SendInput, @autoloot item 1008{enter} ;30x necklace of oblivion
	; Sleep 300
	; SendInput, @autoloot item 1007{enter} ;30x necklace of wisdom
	; Sleep 300
	; SendInput, @autoloot item 989{enter} ;1 emperium anvil
	; Sleep 300
	; SendInput, @autoloot item 968{enter} ;5heroic emblem
	; Sleep 300
	; SendInput, @autoloot item 985{enter} ;5 elunium
	; Sleep 300
	; SendInput, @autoloot item 984{enter} ;5 oridecon
	; Sleep 300
	; SendInput, @autoloot item 710{enter} ;50 illusion flower
	; Sleep 300
	; SendInput, @autoloot item 7297{enter} ;10 biotite
	; Sleep 300
	; SendInput, @autoloot item 1053{enter} ;10 ancient tooth
	; Sleep 300
	; SendInput, @autoloot item 7018{enter} ;5 young twig
	; Sleep 300
	; SendInput, @autoloot item 714{enter} ;5 emperium
	; Sleep 300
}

if (autoloot_item17=1){ ;converters
	SendInput, @autoloot item 12114{enter}
	Sleep 300
	SendInput, @autoloot item 12115{enter}
	Sleep 300
	SendInput, @autoloot item 12116{enter}
	Sleep 300
	SendInput, @autoloot item 12117{enter}
	Sleep 300
}

if (autoloot_item18=1){ ;boxes
	SendInput, @autoloot item 12033{enter}
	Sleep 300
	SendInput, @autoloot item 12028{enter}
	Sleep 300
	SendInput, @autoloot item 12032{enter}
	Sleep 300
}

if (autoloot_item19=1){ ; EDP items
	SendInput, @autoloot item 713{enter}
	Sleep 300
	SendInput, @autoloot item 7033{enter}
	Sleep 300
	SendInput, @autoloot item 937{enter}
	Sleep 300
	SendInput, @autoloot item 939{enter}
	Sleep 300
	SendInput, @autoloot item 952{enter}
	Sleep 300
	SendInput, @autoloot item 972{enter}
	Sleep 300
}

if (autoloot_item20=1){ ;dyestuff
	SendInput, @autoloot item 604{enter}
	Sleep 300
}

Sleep 600
SendInput, /check -DONE_AUTOLOOT_SEND-{enter}


return
;>>>>>>>>>>>> END OF AUTOLOOT SECTION <<<<<<<<<<<,

MVP_info: ;when user update drop down list of MVP, this section runs
Gui, Submit, NoHide  ;submit changes to the vars

;need to set every text to black
Gui, Font, s11 cBlack 
GuiControl,Font,MVP_neutral
GuiControl,Font,MVP_fire
GuiControl,Font,MVP_earth
GuiControl,Font,MVP_wind
GuiControl,Font,MVP_water
GuiControl,Font,MVP_poison
GuiControl,Font,MVP_holy
GuiControl,Font,MVP_shadow
GuiControl,Font,MVP_ghost
GuiControl,Font,MVP_undead

;then need to set every status text to unknow ???
GuiControl,,MVP_neutral, 	`???`%
GuiControl,,MVP_fire, 		`???`%
GuiControl,,MVP_earth, 		`???`%
GuiControl,,MVP_wind, 		`???`%
GuiControl,,MVP_water, 		`???`%
GuiControl,,MVP_poison, 	`???`%
GuiControl,,MVP_holy, 		`???`%
GuiControl,,MVP_shadow, 	`???`%
GuiControl,,MVP_ghost, 		`???`%
GuiControl,,MVP_undead, 	`???`%

;-------------- start of mvp infos ------------
if (MVP_hunter="Amon Ra"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`200`%
	GuiControl,,MVP_earth, 		`-25`%
	GuiControl,,MVP_wind, 		`70`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`50`%
	GuiControl,,MVP_undead, 	`50`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Atroce (ra_fild03)")||(MVP_hunter="Atroce (ra_fild04)")||(MVP_hunter="Atroce (ve_fild01)")||(MVP_hunter="Atroce (ve_fild02)"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`50`%
	GuiControl,,MVP_earth, 		`50`%
	GuiControl,,MVP_wind, 		`50`%
	GuiControl,,MVP_water, 		`50`%
	GuiControl,,MVP_poison, 	`0`%
	GuiControl,,MVP_holy, 		`175`%
	GuiControl,,MVP_shadow, 	`-50`%
	GuiControl,,MVP_ghost, 		`25`%
	GuiControl,,MVP_undead, 	`0`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Boitata"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`-25`%
	GuiControl,,MVP_earth, 		`70`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`200`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`-50`%
	GuiControl,,MVP_undead, 	`-50`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Evil Snake Lord"){ 
	GuiControl,,MVP_neutral, 	`0`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`100`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`50`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`175`%
	GuiControl,,MVP_undead, 	`100`%
	
	Gui, Font, s11 cRed
	GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Garm"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`60`%
	GuiControl,,MVP_earth, 		`100`%
	GuiControl,,MVP_wind, 		`200`%
	GuiControl,,MVP_water, 		`-50`%
	GuiControl,,MVP_poison, 	`25`%
	GuiControl,,MVP_holy, 		`75`%
	GuiControl,,MVP_shadow, 	`75`%
	GuiControl,,MVP_ghost, 		`25`%
	GuiControl,,MVP_undead, 	`25`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Gloom Under Night"){
	GuiControl,,MVP_neutral, 	`0`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`100`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`175`%
	GuiControl,,MVP_undead, 	`100`%
	
	Gui, Font, s11 cRed
	GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Gopinich"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`200`%
	GuiControl,,MVP_earth, 		`-25`%
	GuiControl,,MVP_wind, 		`170`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`50`%
	GuiControl,,MVP_undead, 	`50`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="GTB"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`0`%
	GuiControl,,MVP_earth, 		`80`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`175`%
	GuiControl,,MVP_poison, 	`125`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`75`%
	GuiControl,,MVP_undead, 	`75`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Incantation Samurai"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`50`%
	GuiControl,,MVP_earth, 		`50`%
	GuiControl,,MVP_wind, 		`50`%
	GuiControl,,MVP_water, 		`50`%
	GuiControl,,MVP_poison, 	`50`%
	GuiControl,,MVP_holy, 		`175`%
	GuiControl,,MVP_shadow, 	`-50`%
	GuiControl,,MVP_ghost, 		`25`%
	GuiControl,,MVP_undead, 	`0`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Kiel"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`75`%
	GuiControl,,MVP_earth, 		`75`%
	GuiControl,,MVP_wind, 		`75`%
	GuiControl,,MVP_water, 		`75`%
	GuiControl,,MVP_poison, 	`25`%
	GuiControl,,MVP_holy, 		`150`%
	GuiControl,,MVP_shadow, 	`-25`%
	GuiControl,,MVP_ghost, 		`50`%
	GuiControl,,MVP_undead, 	`0`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Lady Tanee"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`200`%
	GuiControl,,MVP_wind, 		`-25`%
	GuiControl,,MVP_water, 		`70`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`50`%
	GuiControl,,MVP_undead, 	`50`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Maya"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`200`%
	GuiControl,,MVP_earth, 		`-50`%
	GuiControl,,MVP_wind, 		`60`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`75`%
	GuiControl,,MVP_holy, 		`75`%
	GuiControl,,MVP_shadow, 	`75`%
	GuiControl,,MVP_ghost, 		`25`%
	GuiControl,,MVP_undead, 	`25`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}



if (MVP_hunter="Orc Hero"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`175`%
	GuiControl,,MVP_earth, 		`0`%
	GuiControl,,MVP_wind, 		`80`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`125`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`75`%
	GuiControl,,MVP_undead, 	`75`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="RSX-0806"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`100`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`0`%
	GuiControl,,MVP_undead, 	`100`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Stormy Knight"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`200`%
	GuiControl,,MVP_wind, 		`-50`%
	GuiControl,,MVP_water, 		`60`%
	GuiControl,,MVP_poison, 	`75`%
	GuiControl,,MVP_holy, 		`75`%
	GuiControl,,MVP_shadow, 	`75`%
	GuiControl,,MVP_ghost, 		`25`%
	GuiControl,,MVP_undead, 	`25`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Tao Gunka"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`100`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`100`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`0`%
	GuiControl,,MVP_undead, 	`100`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Thanatos") ||(MVP_hunter="Thanatos Full"){
	GuiControl,,MVP_neutral, 	`0`%
	GuiControl,,MVP_fire, 		`100`%
	GuiControl,,MVP_earth, 		`100`%
	GuiControl,,MVP_wind, 		`100`%
	GuiControl,,MVP_water, 		`100`%
	GuiControl,,MVP_poison, 	`25`%
	GuiControl,,MVP_holy, 		`100`%
	GuiControl,,MVP_shadow, 	`100`%
	GuiControl,,MVP_ghost, 		`200`%
	GuiControl,,MVP_undead, 	`100`%
	
	Gui, Font, s11 cRed
	GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

if (MVP_hunter="Valkyrie Randgris"){
	
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`0`%
	GuiControl,,MVP_earth, 		`0`%
	GuiControl,,MVP_wind, 		`0`%
	GuiControl,,MVP_water, 		`0`%
	GuiControl,,MVP_poison, 	`0`%
	GuiControl,,MVP_holy, 		`-100`%
	GuiControl,,MVP_shadow, 	`200`%
	GuiControl,,MVP_ghost, 		`0`%
	GuiControl,,MVP_undead, 	`175`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
}

if (MVP_hunter="Wounded Morroc"){
	GuiControl,,MVP_neutral, 	`100`%
	GuiControl,,MVP_fire, 		`25`%
	GuiControl,,MVP_earth, 		`25`%
	GuiControl,,MVP_wind, 		`25`%
	GuiControl,,MVP_water, 		`25`%
	GuiControl,,MVP_poison, 	`-25`%
	GuiControl,,MVP_holy, 		`200`%
	GuiControl,,MVP_shadow, 	`-100`%
	GuiControl,,MVP_ghost, 		`0`%
	GuiControl,,MVP_undead, 	`0`%
	
	Gui, Font, s11 cRed
;GuiControl,Font,MVP_neutral
	GuiControl,Font,MVP_fire
	GuiControl,Font,MVP_earth
	GuiControl,Font,MVP_wind
	GuiControl,Font,MVP_water
	GuiControl,Font,MVP_poison
;GuiControl,Font,MVP_holy
	GuiControl,Font,MVP_shadow
	GuiControl,Font,MVP_ghost
	GuiControl,Font,MVP_undead
	
	Gui, Font, s11 cGreen
;GuiControl,Font,MVP_neutral
;GuiControl,Font,MVP_fire
;GuiControl,Font,MVP_earth
;GuiControl,Font,MVP_wind
;GuiControl,Font,MVP_water
;GuiControl,Font,MVP_poison
	GuiControl,Font,MVP_holy
;GuiControl,Font,MVP_shadow
;GuiControl,Font,MVP_ghost
;GuiControl,Font,MVP_undead
}

return
;>>>>>>>>>>>>>>..END OF MVP INFOS..<<<<<<<<<<

ButtonGO!: ;runs section when user choose mvp and click go button
sub_and_go_to_rag() ;call function that handles submitting and changing to ragnarok
deactivebm() ;call function to deactivate battlemode
Sleep 300

if (MVP_hunter="Thanatos"){
	SendInput, @warp thana_boss 210 167{enter}
	
}

;-------------------------------------------------------------


if (MVP_hunter="Thanatos Full"){
	
;------------RESET CHAT-------------------------------------------------
	SendInput, {enter}
	sleep 700
	deactivebm() ;call function to deactivate battlemode
	Sleep 300
;-------------------------------------------------------------
	SendInput, @warp thana_boss 217 167{enter}
	Sleep, 700
	next_enabled()
	Sleep, 700
	SendInput, Fragment of Misery
	Sleep, 700
	ok_enabled()
	Sleep, 700
	next_enabled()
	
	SendInput, /check PRESS_PAGE-DOWN_TO_CONTINUE_TO_NEXT_SEAL{enter}
	While (GetKeyState("PGdn","p")!=1){ ;wait pagdown to b pressed to continue
	}
	
;------------RESET CHAT TO SendInput, AGAIN-------------------------------------------------
	SendInput, {enter}
	sleep 700
	deactivebm() ;call function to deactivate battlemode
	Sleep 300
;-------------------------------------------------------------
	SendInput, @warp thana_boss 202 75{enter}
	Sleep, 700
	next_enabled()
	Sleep, 700
	SendInput, Fragment of Agony
	Sleep, 700
	ok_enabled()
	Sleep, 700
	next_enabled()
;------------RESET CHAT TO SendInput, AGAIN-------------------------------------------------
	SendInput, {enter}
	sleep 700
	deactivebm() ;call function to deactivate battlemode
	Sleep 300
;-------------------------------------------------------------
	SendInput, /check PRESS_PAGE-DOWN_TO_CONTINUE_TO_NEXT_SEAL{enter}
	While (GetKeyState("PGdn","p")!=1){ ;wait pagdown to b pressed to continue
	}
	SendInput, @warp thana_boss 80 76{enter}
	Sleep, 700
	next_enabled()
	Sleep, 700
	SendInput, Fragment of Hatred
	Sleep, 700
	ok_enabled()
	Sleep, 700
	next_enabled()
	SendInput, /check PRESS_PAGE-DOWN_TO_CONTINUE_TO_NEXT_SEAL{enter}
	While (GetKeyState("PGdn","p")!=1){ ;wait pagdown to b pressed to continue
	}
;------------RESET CHAT TO SendInput, AGAIN-------------------------------------------------
	SendInput, {enter}
	sleep 700
	deactivebm() ;call function to deactivate battlemode
	Sleep 300
;-------------------------------------------------------------
	SendInput, @warp thana_boss 62 171{enter}
	Sleep, 700
	next_enabled()
	Sleep, 700
	SendInput, Fragment of Despair
	Sleep, 700
	ok_enabled()
	Sleep, 700
	next_enabled()
	sleep, 700
;------------RESET CHAT TO SendInput, AGAIN-------------------------------------------------
	SendInput, {enter}
	sleep 700
	deactivebm() ;call function to deactivate battlemode
}

if (MVP_hunter="Amon Ra"){
	SendInput, @warp moc_pryd06 101 77{enter}
} 

if (MVP_hunter="Tao Gunka"){
	SendInput, @warp beach_dun{enter}
	waitloadend()
	SendInput, @mobsearch Tao Gunka{enter}
}

if (MVP_hunter="Stormy Knight"){
	SendInput, @warp xmas_dun02{enter}
	waitloadend()
	SendInput, @mobsearch Stormy Knight{enter}
} 

if (MVP_hunter="GTB"){
	SendInput, @warp prt_sewb4{enter}
	waitloadend()
	SendInput, @mobsearch Golden Thief Bug{enter}
} 

if (MVP_hunter="Gloom Under Night"){
	SendInput, @warp ra_san05{enter}
	waitloadend()
	SendInput, @mobsearch Gloom Under Night{enter}
} 

if (MVP_hunter="Kiel"){
	SendInput, @warp kh_dun02{enter}
	waitloadend()
	SendInput, @mobsearch Kiel D-01{enter}
} 

if (MVP_hunter="Evil Snake Lord"){
	SendInput, @warp gon_dun03{enter}
	waitloadend()
	SendInput, @mobsearch Evil Snake Lord{enter}
} 

if (MVP_hunter="Orc Hero"){
	SendInput, @warp gef_fild03{enter}
	waitloadend()
	SendInput, @mobsearch Orc Hero{enter}
} 

if (MVP_hunter="RSX-0806"){
	SendInput, @warp ein_dun02{enter}
	waitloadend()
	SendInput, @mobsearch RSX-0806{enter}
}  

if (MVP_hunter="Tendrillion"){
	SendInput, @warp spl_fild03{enter}
	waitloadend()
	SendInput, @mobsearch Tendrillion{enter}
} 

if (MVP_hunter="Atroce (ra_fild03)"){
	SendInput, @warp ra_fild03{enter}
	waitloadend()
	SendInput, @mobsearch Atroce{enter}
} 

if (MVP_hunter="Atroce (ra_fild04)"){
	SendInput, @warp ra_fild04{enter}
	waitloadend()
	SendInput, @mobsearch Atroce{enter}
} 

if (MVP_hunter="Atroce (ve_fild01)"){
	SendInput, @warp ve_fild01{enter}
	waitloadend()
	SendInput, @mobsearch Atroce{enter}
} 

if (MVP_hunter="Atroce (ve_fild02)"){
	SendInput, @warp ve_fild02{enter}
	waitloadend()
	SendInput, @mobsearch Atroce{enter}
} 

if (MVP_hunter="Boitata"){
	SendInput, @warp bra_dun02{enter}
	waitloadend()
	SendInput, @mobsearch Boitata{enter}
} 

if (MVP_hunter="Garm"){
	SendInput, @warp xmas_fild01{enter}
	waitloadend()
	SendInput, @mobsearch Garm{enter}
} 

if (MVP_hunter="Fallen Bishop Hibram"){
	SendInput, @warp abbey02{enter}
	waitloadend()
	SendInput, @mobsearch Fallen Bishop{enter}
} 

if (MVP_hunter="Gopinich"){
	SendInput, @warp mosk_dun03 210 210{enter}
	waitloadend()
	SendInput, @mobsearch Gopinich{enter}
} 

if (MVP_hunter="Maya"){
	SendInput, @warp anthell02{enter}
	waitloadend()
	SendInput, @mobsearch Maya{enter}
} 

if (MVP_hunter="Wounded Morroc"){
	SendInput, @warp moc_fild22{enter}
	waitloadend()
	SendInput, @mobsearch Wounded Morroc{enter}
} 

if (MVP_hunter="Angeling+Deviling+Ghostring (pay_fild04)"){
	SendInput, @warp pay_fild04{enter}
	waitloadend()
	SendInput, @mobsearch Angeling{enter}
	Sleep 300
	SendInput, @mobsearch Deviling{enter}
	Sleep 300
	SendInput, @mobsearch Ghostring{enter}
} 

if (MVP_hunter="Angeling (xmas_dun01)"){
	SendInput, @warp xmas_dun01{enter}
	waitloadend()
	SendInput, @mobsearch Angeling{enter}
} 

if (MVP_hunter="Angeling+Deviling (yuno_fild03)"){
	SendInput, @warp yuno_fild03{enter}
	waitloadend()
	SendInput, @mobsearch Angeling{enter}
	Sleep 300
	SendInput, @mobsearch Deviling{enter}
} 

if (MVP_hunter="Archangeling"){
	SendInput, @warp yuno_fild04{enter}
	waitloadend()
	SendInput, @mobsearch Archangeling{enter}
} 

if (MVP_hunter="Incantation Samurai"){
	SendInput, @warp ama_dun03{enter}
	waitloadend()
	SendInput, @mobsearch Incantation Samurai{enter}
} 

if (MVP_hunter="Lady Tanee"){
	SendInput, @warp ayo_dun02{enter}
	waitloadend()
	SendInput, @mobsearch Lady Tanee{enter}
} 

if (MVP_hunter="Valkyrie Randgris"){
	SendInput, @warp odin_tem03{enter}
	waitloadend()
	SendInput, @mobsearch Valkyrie Randgris{enter}
	Sleep 300
	SendInput, @mobsearch Valkyrie{enter}
}

if (MVP_hunter="Queen Scaraba"){
	SendInput, @warp dic_dun02{enter}
	waitloadend()
	SendInput, @mobsearch Queen Scaraba{enter}
	Sleep 300
}

if (MVP_hunter="Gold Queen Scaraba"){
	SendInput, @warp dic_dun03{enter}
	waitloadend()
	SendInput, @mobsearch Gold Queen Scaraba{enter}
	Sleep 300
}

if (MVP_hunter="Turtle General"){
	SendInput, @warp tur_dun04{enter}
	waitloadend()
	SendInput, @mobsearch Turtle General{enter}
	Sleep 300
}

if (MVP_hunter="Vesper"){
	SendInput, @warp jupe_core{enter}
	waitloadend()
	SendInput, @mobsearch Vesper{enter}
	Sleep 300
}

if (MVP_hunter="Kraken"){
	SendInput, @warp iz_dun05{enter}
	waitloadend()
	SendInput, @mobsearch Kraken{enter}
	Sleep 300
}

if (MVP_hunter="Ifrit"){
	SendInput, @warp thor_v03{enter}
	waitloadend()
	SendInput, @mobsearch Ifrit{enter}
	Sleep 300
}

if (MVP_hunter="Beelzebub"){
	SendInput, @warp abbey03{enter}
	waitloadend()
	SendInput, @mobsearch Beelzebub{enter}
	Sleep 300
}

SendInput, /check Done!{enter}

return


;END OF BUTTON GO<<<<<<<<<<<<<<<<

ButtonLoad:
Gui, Submit, NoHide  ; Save each control's contents to its associated variable.
Progress, b ,,  Loading configs....

Loop, 21{
	IniRead, readoutput, config.ini, %profile%_autoloot_list, autoloot%A_Index%, 0
	GuiControl,, Autoloot_item%A_Index%, %readoutput%
}

Progress, 50

Loop, 108{
	IniRead, readoutput, config.ini, %profile%_macro_list, macro%A_Index%, 3
	GuiControl,, macro%A_Index%, %readoutput%
}
IniRead, readoutput, config.ini, %profile%_macro_config, qf_delay, 500
GuiControl,, Macro_Delay, %readoutput%
IniRead, readoutput, config.ini, %profile%_macro_config, qfc_delay, 500
GuiControl,, Macro_Delay_click, %readoutput%

Progress, 100

Progress, b fs18 zh0, Done!., , , Arial
sleep 500
Progress, Off
return
;END OF BUTTON LOAD<<<<<<<<<<<<<<<<<<<<<

ButtonSave:
Gui, Submit, NoHide  ; Save each control's contents to its associated variable.

Progress, b ,,  Saving configs

Loop, 21{
	IniWrite, % Autoloot_item%A_Index%, config.ini, %profile%_autoloot_list, autoloot%A_Index%
}

Progress, 50

Loop, 108{
	IniWrite, % macro%A_Index%, config.ini, %profile%_macro_list, macro%A_Index%
}
IniWrite, %macro_delay%, config.ini, %profile%_macro_config, qf_delay
IniWrite, %Macro_Delay_click% , config.ini, %profile%_macro_config, qfc_delay

Progress, 100

Progress, b fs18 zh0, Done!., , , Arial
sleep 500
Progress, Off

return
;END OF BUTTON SAVE<<<<<<<<<<<<<<<<<<<,,


GuiClose: ;when gui closes or esc, exit app
GuiEscape: 
Gui, Submit  ; Save each control's contents to its associated variable.
ExitApp