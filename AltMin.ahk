#Singleinstance Force
#NoEnv

!-::
	WinMinimize, A
return

![:: ; Alt [ snaps window to left
	if	!sending ; tries to prevent executing function while an instance is running
		BlockInput, On
		sending := 1
		WinGet, hwnd ,, A
		WinMaximize, ahk_id %hwnd%
		while (isMax(%hwnd%) = False)
			sleep 10
		Send #{Left}
		;if (WinActive(%hwnd%) = 0)
		;	WinActivate, ahk_id %hwnd%
		WinWaitNotActive, ahk_id %hwnd%,,0.5
		WinActivate, ahk_id %hwnd%
		sending := 0
		BlockInput, Off
	return

!]:: ; Alt ] snaps window to right
	if	!sending ; tries to prevent executing function while an instance is running
		BlockInput, On
		sending := 1
		WinGet, hwnd ,, A
		WinMaximize, ahk_id %hwnd%
		while (isMax(%hwnd%) = False)
			sleep 10
		Send #{Right}
		;if (WinActive(%hwnd%) = 0)
		;	WinActivate, ahk_id %hwnd%
		WinWaitNotActive, ahk_id %hwnd%,,0.5
		WinActivate, ahk_id %hwnd%
		sending := 0
		BlockInput, Off
	return

!=::
WinGet, hwnd ,, A
If (isMax(%hwnd%) = False) {
		WinMaximize, A
	} Else {
		WinRestore, A
	}
return

isMax(hwnd := 0) {
	Var := GetMonitor(%hwnd%)
	SysGet, Mon2, Monitor, %Var%
	MonWidth := Mon2Right - Mon2Left
	WinGetPos, X, Y, Width, Height, A
	If (Width < MonWidth) {
			return False
		} Else {
			return True
		}
}

; Senses the Monitor of the provided window (by HWND). If no window is provided, this
; function checks the Active Window. This can be useful for determining which monitor
; the user is actively interacting with.

; With minor modification, this function could also account for vertically positioned 
; monitors.

GetMonitor(hwnd := 0) {
; If no hwnd is provided, use the Active Window
	if (hwnd)
		WinGetPos, winX, winY, winW, winH, ahk_id %hwnd%
	else
		WinGetActiveStats, winTitle, winW, winH, winX, winY

	SysGet, numDisplays, MonitorCount
	SysGet, idxPrimary, MonitorPrimary

	Loop %numDisplays%
	{	SysGet, mon, MonitorWorkArea, %a_index%
	; Left may be skewed on Monitors past 1
		if (a_index > 1)
			monLeft -= 10
	; Right overlaps Left on Monitors past 1
		else if (numDisplays > 1)
			monRight -= 10
	; Tracked based on X. Cannot properly sense on Windows "between" monitors
		if (winX >= monLeft && winX < monRight)
			return %a_index%
	}
; Return Primary Monitor if can't sense
	return idxPrimary
}