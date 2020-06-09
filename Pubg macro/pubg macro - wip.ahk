#SingleInstance force
#NoEnv
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

mouseXY(x,y) ; Moves the mouse down to compensate recoil (value in compVal var).
{
  DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}


compVal := 20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


Gui, Font, s10 cBlack 
Gui, Add, GroupBox, xm ym w150 h95, Config


Gui, Add, Text, h25 x20 yp+20, Actual compensation: 
Gui, Add, Edit, h25 w50 x20 yp+20 r1 vcompVal, 20

Gui, Add, Button,h25 w30  x+m yp gcomp_add, +
Gui, Add, Button,h25 w30  x+m yp gcomp_dec, -



Gui, Add, GroupBox, xm y+40 w150 h95, Status



Gui, Font, s13 cBlack 

Gui, Add, Button,h30 w80  x40  yp+20 gToggle_run vRunStop, Run

Gui, Add, Text, h25 x20 y+10, status: 

Gui, Add, Text, h25 w75 x+m yp vStatus, Waiting




Gui, Font, s10 cBlack 

Gui, Add, Button,h25 w100  x25 y+15 gHow_To, HOW TO

Gui, Show, xCenter yCenter h250 w175, Backup Tool








~+WheelUP:: ;Shift+wheelUP add compensation
Gosub, comp_add
Return

~+WheelDOWN:: ;Shift+Wheeldown subtract compensation
Gosub, comp_dec
Return

~$NumpadMult:: ; AutoFire
Gosub, Toggle_run
return


~$home::

if (flag_fire = 1){

    While GetKeyState("home", "P"){
        MouseClick, Left , , , , , D,
        mouseXY(0, compVal)
    }
        MouseClick, Left , , , , , u,
}
return



comp_add:
compVal := compVal + 2
GuiControl,, compVal, %compVal%
return

comp_dec:
if compVal > 0
{
	compVal := compVal - 2
	GuiControl,, compVal, %compVal%
}
return

toggle_run:
flag_fire := !flag_fire

if (flag_fire=1){
	GuiControl,, RunStop, Stop
	GuiControl,, Status, Running

	Gui, Font, s11 cGreen
	GuiControl,Font,Status

}

if (flag_fire=0){
	GuiControl,, RunStop, Run
	GuiControl,, Status, Waiting

	Gui, Font, s11 cRed
	GuiControl,Font,Status
}
return


how_to:
MsgBox, To increment compesation: `nShift + Mouse Wheel Up`n----------------`nTo subtract compensation:`nShift + Mouse Wheel Down`n----------------`nTo start and stop use numpad *`n----------------`nTo fire use HOME, map home`nto a mouse button, but I do not`nrecommend using as main click
return

GuiClose: ;when gui closes or esc, exit app
GuiEscape: 

ExitApp