#SingleInstance force


Numpad1:: MouseGetPos, x1, y1
Numpad2:: 
    MouseGetPos, x2, y2
    x := x2-x1
    y := y2-y1
    msgbox x diff: %x%, y diff: %y%
return
Numpad3:: MouseMove x, y, 1, R
