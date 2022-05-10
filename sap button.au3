;-Begin-----------------------------------------------------------------

  ;-Directives----------------------------------------------------------
    AutoItSetOption("MustDeclareVars")

  ;-Include files-------------------------------------------------------
    #Include "Constants.au3"
    #Include "WinAPI.au3"
    #Include "WindowsConstants.au3"

  ;-Constants-----------------------------------------------------------
    Const $WinTitle = "[CLASS:SAP_FRONTEND_SESSION]"

  ;-Variables-----------------------------------------------------------
    Global $ToolBar1 = "Afx:"
    Global $ToolBar2 = ":0:00010007:00000010:000000001"
    Global $ToolBar
    Global $hBtnProc

  ;-Function btnSCAP_CallBack-------------------------------------------
    Func btnCallBack($hWind, $uMsg, $wParam, $lParam)
      Switch $uMsg
        ;-ToolTip-------------------------------------------------------
          Case $WM_MOUSEMOVE
            ToolTip("My Button")
          Case $WM_MOUSELEAVE
            ToolTip("")
        ;-ButtonClick---------------------------------------------------   
          Case $WM_LBUTTONUP
            ;-Only asynchronous processes here--------------------------
              Run("notepad.exe")
      EndSwitch
      Return _WinAPI_CallWindowProc($hBtnProc, $hWind, $uMsg, _
        $wParam, $lParam)
    EndFunc

  ;-Procedure AddButton-------------------------------------------------
    Func AddButton()

      ;-Variables-------------------------------------------------------
        Local $hWin, $hToolBar, $Quit, $hBtn, $ptrCallBack

      $hWin = WinGetHandle($WinTitle)
      ;$ToolBar = $ToolBar1 & _
        ;Hex(_WinAPI_GetWindowLong($hWin, $GWL_HINSTANCE)) & $ToolBar2
		$string = Hex(_WinAPI_GetWindowLong($hWin, $GWL_HINSTANCE))
		$new = StringReplace($string, StringRegExpReplace($string, "[^0].*", ""), "")
		$ToolBar = $ToolBar1 & $new & $ToolBar2
      $hToolBar = ControlGetHandle($hWin, "", $ToolBar)
      ;-My button-------------------------------------------------------
        Dim $hBtn = _WinAPI_CreateWindowEx(0, "BUTTON", "MyButton", _
          $WS_VISIBLE + $WS_CHILD, 600, 6, 75, 20, $hToolBar)
        $hbtnProc = _WinAPI_GetWindowLong($hBtn, $GWL_WNDPROC)
        Dim $ptrCallBack = DLLCallBackRegister("btnCallBack", "ptr", _
          "hwnd;uint;long;ptr")
        _WinAPI_SetWindowLong($hBtn, $GWL_WNDPROC, _
          DLLCallBackGetPtr($ptrCallBack))
      ;-Set tray--------------------------------------------------------
        Opt("TrayMenuMode",1)
        $Quit = TrayCreateItem("Exit")
        TraySetState()
      ;-MainLoop--------------------------------------------------------
        While 1
          Sleep(64)
          Switch TrayGetMsg()
            Case $Quit
              ExitLoop
          EndSwitch
        Wend
      _WinAPI_SetWindowLong($hToolBar, $GWL_WNDPROC, $hBtnProc)
      DLLCallBackFree($ptrCallBack)
    EndFunc
   
  ;-Main----------------------------------------------------------------
    AddButton()   

;-End-------------------------------------------------------------------