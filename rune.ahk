#SingleInstance force
#NoEnv
SetWorkingDir %A_ScriptDir%
SendMode Input

gui_options := "-MinimizeBox -MaximizeBox"
Gui %gui_options%
Gui, Add, Text, w250 vEnabledScr, None
Gui, Add, Button, gGetMousePos , Get relative mouse position.`nNum1 start, Num2 end
Gui, show,,Scripts

return ; end of auto execute section

GetMousePos(disable:=0)
{
    this = GetMousePos             ;name this script
    GuiControlGet, EnabledScr      ;get active

    ;if told to disable or the active is this one, disable
    if(disable = 1 or EnabledScr = this){
        GuiControl,,EnabledScr, None
        Hotkey Numpad1, getStartMousePos, Off
        Hotkey Numpad2, getEndMousePos, Off
        Hotkey, Numpad3, mouseRel, Off
        return
    }
    ;disable running scr if not this scr
    if (EnabledScr != None){
        %EnabledScr%(1)
    }
    GuiControl,,EnabledScr, GetMousePos
    
    ;do this function
    
    Hotkey, Numpad1, getStartMousePos, On
    Hotkey, Numpad2, getEndMousePos, On
    Hotkey, Numpad3, mouseRel, On
    return

    getStartMousePos:
        MouseGetPos, x1, y1
        SoundBeep, 250, 250
    return
    getEndMousePos: 
        MouseGetPos, x2, y2
        x := x2-x1
        y := y2-y1
        SoundBeep, 250, 250
        msgbox x diff: %x%, y diff: %y%
    return
    mouseRel:
        BlockInput, On
        MouseMove x, y, 1, R
        BlockInput, Off
    return

}

randomCoord(min, max) {
    Random, randomValue, % min, % max ; Use AHK's built in Random function
    Return randomValue
}

GuiClose:
ExitApp

