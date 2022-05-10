
GUIRegisterMsg(RegisterWindowMessage("SHELLHOOK"), "HShellWndProc")

Func HShellWndProc($hWnd, $Msg, $wParam, $lParam)
    Switch $wParam
        Case $HSHELL_WINDOWCREATED
            MsgPrint("Window created: " & $lParam & " (" & WinGetTitle($lParam) & ")")
	EndSwitch
EndFunc