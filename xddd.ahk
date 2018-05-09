; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance force																					; Skip replace dialog.
#Persistent																							; Keeps a script running permanently.
SetTitleMatchMode 2																						; Allows WinActive to work with for example "- YouTube".
SetCapsLockState, AlwaysOff																				; Set CapsLock to always be toggled off.
SetNumLockState, AlwaysOn																				; Set NumLock to always be toggled on.
SetWorkingDir %A_ScriptDir%																				; Set persistent Script Directory.
DetectHiddenWindows, On																					; Make it so that the script detects hidden windows.
#EscapeChar ¤																							; Sets the escape char to '¤'.
I_Icon = %A_ScriptDir%\icons\terminal.ico																	; Defines I_Icon.
IfExist, %I_Icon%																						; Tests if I_Icon exists.
menu, tray, Icon, %I_Icon%																				; Sets the tray icon to the value of I_Icon.

Tooltip, xdd.ahk launched
SetTimer, RemoveToolTip, 5000
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
Tooltip
return

+Esc::reload																							; Reload script with hotkey.

^!e::Edit, %A_ScriptName%																				; Edit my shitty script lol.
^+!e::Run, explorer.exe %A_ScriptDir%

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Super hotkeys(win+r etc.)
; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
~LWin Up::return																						; Disables super in a way that it still works but doesn't open the startmenu but still works for hotkeys.
~RWin Up::return																						; Disables right super key (for dumb keyboards like the K70)
#l::DllCall("LockWorkStation")																			; Shortcut for locking the Computer.
#r::Run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk										; Shortcut to open the run dialog.
#q::!F4																								; Super+Q to ALT+F4 (xKill if SuperF4 is running).
#z::WinMinimize, A																						; Minimize Active window with Super+z.
#Enter::Run, cmder.exe																					; Runs Cmder with Super+Return.
#+e::Run explorer.exe		 																			; Runs the file explorer when Shift+Super+e is pressed.
return

; -------------------------------------
; Always on Top
; -------------------------------------
#Space::																								; Super+Space to make window stay on top.
Winset, AlwaysOnTop, Toggle, A																			; Toggles the attribute AlwaysOnTop.
mousegetpos, x, y, fuck
WinGet, ExStyle, ExStyle, ahk_id %fuck%
If (ExStyle & 0x8)																						; 0x8 Checks if the window is AlwaysOnTop or not
	ExStyle = On Top
Else
	ExStyle = Not On Top
ToolTip, %exstyle%																						; Shows a ToolTip that displays AlwaysOnTop or Not AlwaysOnTop depending on what state AlwaysOnTop is in.
Sleep, 1500																							; Sleeps for 1.5 Seconds.
ToolTip																								; Removes the ToolTip.
Return

; -------------------------------------
; Resize with Super+RButton
; -------------------------------------
#RButton::																							; Hotkey to resize windows.
WinGetPos, , , W, H, A																					; Gets width and height from active window and stores them into the variables W and H.
H -= 5																								; Sets the variable H to H-5.
W -= 5																								; Sets the variable W to W-5.
MouseMove, W, H																						; Moves mouse to coordinates of W and H.
MouseClick,Left,,,,,D																					; Clicks left mouse button and holds it down.
Loop {																								; Starts a loop.
	if (!GetKeyState("RButton","P")) {																		; Checks if RButton is pressed or not.
		MouseClick,Left,,,,,U																			; Releases left mouse button when RButton is released.
		Break																						; Stops the loop.
	}
}
WinGetPos, , ,W,H,A																						; Gets width and height from active window after window is resized.
MouseMove, W/2, H/2																						; Moves mouse to the middle of the window.
return

; -------------------------------------
; Super key to move windows
; -------------------------------------
#LButton::
CoordMode, Mouse, Relative
MouseGetPos, cur_win_x, cur_win_y, window_id
WinGet, window_minmax, MinMax, ahk_id %window_id%
if window_minmax <> 0
{
	return
}
CoordMode, Mouse, Screen
SetWinDelay, 0
loop
{
	if !GetKeyState("LButton", "P")
	{
		break
	}
	MouseGetPos, cur_x, cur_y
	WinMove, ahk_id %window_id%,, (cur_x - cur_win_x), (cur_y - cur_win_y)
}
return

; -------------------------------------
; Restore/Maximize with hotkey
; -------------------------------------
#x::																									; Maximize/Restore active window with Super+X.
WinGet, active_id, ID, A
WinGet, checkmax, MinMax, A
If(checkmax == 1) {
	WinGet, active_id, ID, A
	WinRestore, ahk_id %active_id%
} else {
	WinGetClass, class, ahk_id %active_id%
	If class not in ahk_class WorkerW,Shell_TrayWnd, Button, SysListView32,Progman,#32768 
		WinMaximize, ahk_id %active_id%
}
return

; -------------------------------------
; Home area remap
; -------------------------------------
PgDn::return																							; Currently disables PageDown.
PgUp::return																							; Currently disables PageUp.
End::return																							; Currently disables End.
Home::return																							; Currently disables Home.
Ins::return																							; Currently disables Insert.
!Home::Home																							; Enables Home with Alt+Home

; -------------------------------------
; Text replacement, and other binds
; -------------------------------------
::;lenny::( ͡° ͜ʖ ͡°)
::;sadlenny::( ͡° ʖ̯ ͡°)
::;runny::ᕕ( ͡° ͜ʖ ͡° )ᕗ
::;menny::( ͠° ͟ʖ ͡°)
::;wenny::( ͡~ ͜ʖ ͡°)
::;plenny::͡° ͜ʖ ͡°
::;stony::( ͡ຈ ͜ʖ ͡ຈ)
::;ilny::( ͡° _ʖ ͡°)
::;wutty::( ͝סּ ͜ʖ͡סּ)
::;silenny::( ͡^ ͜ʖ ͡^ )
::;stary::( ͡o ͜ʖ ͡o)
::;gary::ᕕ( ᐛ )ᕗ
::;regary::ᕕ( ᐕ )ᕗ
::;speedygary::三三ᕕ( ᐛ )ᕗ
::;spidgary::/╲/\(╭ ᐛ ╮)/\╱\
:*:;proton::zawaken@protonmail.com
:*:;gmail::rsk1997@gmail.com
:*:;reload::>>reload cogs.
return

; -------------------------------------
; Restart Voicemeeter Banana
; -------------------------------------
^+!r::
Process, Close, voicemeeterpro.exe																			; Ends the process Voicemeeterpro.exe.
Sleep, 500																							; Wait for 500ms.
run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe													; Launch VoiceMeeter Banana.
return

; -------------------------------------
; Media Controls
; -------------------------------------
NumpadDot::return
#^l::																								; Next Media.
send {Media_Next}
return
#^j::																								; Previous Media.
send {Media_Prev}
return
#^k::																								; Play/Pause Media.
send {Media_Play_Pause}
return
NumpadDot & Numpad9::																					; Spotify Volume Up
DetectHiddenWindows, On
ControlSend, ahk_parent, ^{Up}, ahk_class SpotifyMainWindow
DetectHiddenWindows, Off
return
NumpadDot & Numpad8::																					; Spotify Volume Down
DetectHiddenWindows, On
ControlSend, ahk_parent, ^{Down}, ahk_class SpotifyMainWindow
DetectHiddenWindows, Off
return

; -------------------------------------
; CapsLock Modifier and a Toggle for NumLock
; -------------------------------------
!NumLock::
GetKeyState, numstate, NumLock, T
if numstate = U
	SetNumLockState, AlwaysOn
else
	SetNumLockState, AlwaysOff
return

!CapsLock::																							; Alt+ CapsLock Toggles CapsLock even though CapsLockState is set to always be off.
GetKeyState, capsstate, CapsLock, T 
if capsstate = U
	SetCapsLockState, AlwaysOn
else
	SetCapsLockState, AlwaysOff
return

CapsLock & f::SendInput, Fuck {Enter}

CapsLock & t::Run cmder.exe

CapsLock & v::
lang = autohotkey
Gosub, clip2
return

; I stole this from runar, fuqme

clip1:
sendInput, ¤`¤`¤`{space}%lang%
sleep, 16
SendInput, {Enter}
sleep, 16
sendInput, {Control Down} v {Control Up}
sleep, 16
sendInput, ¤`¤`¤`{Enter}
sleep, 16
sendInput, {Enter}
Clipboard := oclip
return

clip2:
String=%clipboard%
oclip=%clipboard%
Clipboard := String
StringReplace, Clipboard, Clipboard, ¤`, ¤¤`, All
Sleep, 100
Gosub, clip1
return

; -------------------------------------
; IfWinActive shit
; -------------------------------------
#IfWinActive, ahk_exe osu!.exe
	AppsKey::
SendInput, {!}r
sleep, 100
SendInput, {Enter Down}
Sleep, 25
SendInput, {Enter Up}
Sleep, 5000
return
#IfWinActive