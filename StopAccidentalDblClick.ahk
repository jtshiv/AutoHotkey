﻿#SingleInstance force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LButton::	
	If (A_TimeSincePriorHotkey < 80) ;hyperclick
		Return
	Click Down
	KeyWait, LButton
	Click Up
Return