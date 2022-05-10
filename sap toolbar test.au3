;-Begin-----------------------------------------------------------------

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

  ;-Sub Main------------------------------------------------------------
    Func Main()
	
	
      ;-Variables-------------------------------------------------------
        Local $hWin, $hToolBar

      $hWin = WinGetHandle($WinTitle)
      ;$ToolBar = $ToolBar1 & _
        ;Hex(_WinAPI_GetWindowLong($hWin, $GWL_HINSTANCE)) & $ToolBar2
		$string = Hex(_WinAPI_GetWindowLong($hWin, $GWL_HINSTANCE))
		$new = StringReplace($string, StringRegExpReplace($string, "[^0].*", ""), "")
		$ToolBar = $ToolBar1 & $new & $ToolBar2
      $hToolBar = ControlGetHandle($hWin, "", $ToolBar)
      MsgBox(0, "Handle of the ToolBar", Hex($hToolBar))

    EndFunc
   
  ;-Main----------------------------------------------------------------
    Main()

;-End-------------------------------------------------------------------