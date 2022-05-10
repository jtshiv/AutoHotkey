#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; Clear the flag
Global $fResized = False
Global $width
Global $height

While 1
Local $hWnd = WinWaitActive("[CLASS:SnagIt9Editor]")

; Retrieve the client area of the Notepad window using the handle returned by WinWait.
Local $aClientSize = WinGetClientSize($hWnd)

If $aClientSize[0] <> $width And $aClientSize[1] <> $height Then
   Send("!v")
   Send("f")
   $width = $aClientSize[0]
   $height = $aClientSize[1]
EndIf

WEnd