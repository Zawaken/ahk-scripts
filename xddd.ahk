; -------------------------------------
; Script behaviour
; -------------------------------------
#SingleInstance force																					; Skip replace dialog.
#Persistent																							; Keeps a script running permanently.
SetCapsLockState, AlwaysOff																				; Set CapsLock to always be toggled off.
SetNumLockState, AlwaysOn																				; Set NumLock to always be toggled on.
SetWorkingDir %A_ScriptDir%																				; Set persistent Script Directory.
DetectHiddenWindows, On																					; Make it so that the script detects hidden windows.

I_Icon = %A_ScriptDir%\icons\terminal.ico																	; Defines I_Icon.
IfExist, %I_Icon%																						; Tests if I_Icon exists.
menu, tray, Icon, %I_Icon%																				; Sets the tray icon to the value of I_Icon.

+Esc::reload																							; Reload script with hotkey.

; -------------------------------------
; Super hotkeys(win+r etc.)
; -------------------------------------
~LWin Up::return																						; Disables super in a way that it still works but doesn't open the startmenu but still works for hotkeys.
#l::Shutdown, 0																						; Shortcut for locking the Computer.
#r::Run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk										; Shortcut to open the run dialog.
#q::!F4																								; Super+Q to ALT+F4 (xKill if SuperF4 is running).
#z::WinMinimize, A																						; Minimize Active window with Super+z.
return

; -------------------------------------
; Always on Top
; -------------------------------------
#Space::																								; Super+Space to make window stay on top.
Winset, AlwaysOnTop, Toggle, A																			; Toggles the attribute AlwaysOnTop.
Toggle := !toggle																						; Variable for tooltip.
ToolTip, %Toggle%																						; Shows a ToolTip that displays 1 or 0 depending on what state AlwaysOnTop is in.
Sleep, 1500																							; Sleeps for 1.5 Seconds.
ToolTip																								; Removes the ToolTip.
Return

; -------------------------------------
; Home area remap
; -------------------------------------
PgDn::return																							; Currently disables PageDown.
PgUp::return																							; Currently disables PageUp.
End::return																							; Currently disables End.
Home::return																							; Currently disables Home.
Ins::return																							; Currently disables Insert.

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
; Numpad Media Controls
; -------------------------------------
NumpadDot::return
NumpadDot & NumpadSub::																					; Next Media.
send {Media_Next}
return
NumpadDot & NumpadDiv::																					; Previous Media.
send {Media_Prev}
return
NumpadDot & NumpadMult::																					; Play/Pause Media.
send {Media_Play_Pause}
return
NumpadDot & NumpadAdd::																					; Stop Media.
send {Media_Stop}
return

; -------------------------------------
; Random hotkeys and text replacements
; -------------------------------------
^+m::																								; Code markdown.
Send, ``````{Space}
return

^!e::Edit, %A_ScriptName%																				; Edit my shitty script lol.

::;psize::																							; Void Setup in processing.
send, void setup() 
send, {Space}
sendRaw, {
    send, {Enter}
    send, {Tab}
    send,   size(500, 500);
    send, {Enter}
    send,   surface.setResizable(true);
    send, {Enter}
    send, {Backspace}
    send, {Backspace}
sendRaw, }
return

; -------------------------------------
; CapsLock Modifier
; -------------------------------------
!CapsLock::																							; Alt+ CapsLock Toggles CapsLock even though CapsLockState is set to always be off.
GetKeyState, capsstate, CapsLock, T 
if capsstate = U
	SetCapsLockState, AlwaysOn
else
	SetCapsLockState, AlwaysOff
return

CapsLock & f::SendInput, Fuck {Enter}

CapsLock & t::Run cmder.exe

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