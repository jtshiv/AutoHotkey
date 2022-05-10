#include <WindowsConstants.au3>

GUIRegisterMsg($WM_SIZE, 'onresize')


Dim $hGUI = GUICreate('Test', 100, 100, Default, Default, BitOR($WS_POPUP, $WS_THICKFRAME))
Dim $iCount = 0

GUISetState()



Do
Until GUIGetMsg() = -3

Func onresize($hwnd, $iMsg, $iwParam, $ilParam)
    ConsoleWrite('Data ' & $iCount & ' ' & $hwnd & ' ' & $iMsg & @LF)
    $iCount += 1

    Return 'GUI_RUNDEFMSG'
EndFunc