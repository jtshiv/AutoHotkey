#Singleinstance Force
; target by exe since vscode shares the same
; ahk_class as chrome
#IfWinActive ahk_exe Code.exe
capslock::
Send {Esc}
; should send esc after pressing capslock
return
#IfWinActive ahk_exe mintty.exe
capslock::
Send {Esc}
; should send esc after pressing capslock
return
#IfWinActive