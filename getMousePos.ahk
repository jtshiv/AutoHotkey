#SingleInstance force

gui_options := "-MinimizeBox -MaximizeBox"
Gui %gui_options%
Gui, Add, Text,vEnabledScr, None
Gui, Add, Button, gGetMousePos , Get relative mouse position.`nNum1 start, Num2 end
Gui, show,,Runescape Scripts

return ; end of auto execute section

GetMousePos:
    GuiControlGet, EnabledScr
    msgbox %EnabledScr%
return


GuiClose:
ExitApp

