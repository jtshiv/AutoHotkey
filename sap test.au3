;-Begin-----------------------------------------------------------------

  ;-Directives----------------------------------------------------------
    AutoItSetOption("MustDeclareVars", 1)

  ;-Includes------------------------------------------------------------
    #Include "MsgBoxConstants.au3"

  ;-Function GetAutoItArchitecture--------------------------------------
    Func GetAutoItArchitecture()
      If @AutoItX64 Then
        Return "x64"
      Else
        Return "x86"
      EndIf
    EndFunc

  ;-Sub Main------------------------------------------------------------
    Func Main()

      ;-Variables-------------------------------------------------------
        Local $oSapGuiAuto, $Application, $Connection, $Session
        Local $Info

      $oSapGuiAuto = ObjGet("SAPGUI")
      If Not IsObj($oSapGuiAuto) Or @Error Then
        Return
      EndIf

      $Application = $oSapGuiAuto.GetScriptingEngine()
      If Not IsObj($Application) Then
        Return
      EndIf

      $Connection = $Application.Children(0)
      If Not IsObj($Connection) Then
        Return
      EndIf

      $Session = $Connection.Children(0)
      If Not IsObj($Session) Then
        Return
      EndIf

      $Info = $Session.Info()

      MsgBox($MB_SYSTEMMODAL, GetAutoItArchitecture(), _
        "Transaction: " & $Info.Transaction() & @CRLF & _
        "Program: " & $Info.Program() & @CRLF & _
        "ScreenNumber: " & $Info.ScreenNumber() & @CRLF & _
        "CodePage: " & $Info.CodePage() & @CRLF & _
        "GuiCodePage: " & $Info.GuiCodePage() & @CRLF & _
        "I18NMode: " & $Info.I18NMode() & @CRLF & _
        "Language: " & $Info.Language() & @CRLF & _
        "IsLowSpeedConnection: " & $Info.IsLowSpeedConnection())

    EndFunc

  ;-Main----------------------------------------------------------------
    Main()

;-End-------------------------------------------------------------------