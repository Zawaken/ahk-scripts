#SingleInstance force

+Esc::reload
return

SetCapsLockState, AlwaysOff
!CapsLock::
    GetKeyState, capsstate, CapsLock, T 
    if capsstate = U
        SetCapsLockState, AlwaysOn
    else
        SetCapsLockState, AlwaysOff
    return

CapsLock & f:: 
    Send, Fuck
    Sleep, 15
    Send, {Enter}
return

^+n::
Run "C:\Program Files\Notepad++\notepad++.exe"
return

^+f::
Run Firefox.exe
return

^!t::
Run cmder.exe
return

^+d::
Run C:\Users\Zawaken\AppData\Local\Discord\app-0.0.298\Discord.exe
return

$#q::!F4
return

~LWin Up:: 
return

#r::
Run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk
return

#l::
Shutdown, 0
return

PgDn::return
PgUp::return
End::return
Home::return
Ins::return

::;proton::zawaken@protonmail.com

::;xd::
	Send, lmao xd lol rofl ialmaorn roflmao XD lawl Cx
	Sleep, 15
	Send, {Enter}
return

::;nick::
	Send, England is my city.
	Sleep, 15
	Send, {Enter}
return

^+m::
Send, ``````{Space}
return

::;md::
send, ``````{Space}
InputBox, varMark, Enter text
Send, %varMark%
send, ``````{Space}
Send, {Enter}
return

::;psize::
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
return

^+!r::
    Process, Close, voicemeeterpro.exe
    Sleep, 500
    run, C:\Program Files (x86)\VB\Voicemeeter\voicemeeterpro.exe
return

NumpadDot & NumpadSub::
send {Media_Next}
return
NumpadDot & NumpadDiv::
send {Media_Prev}
return
NumpadDot & NumpadMult::
send {Media_Play_Pause}
return
NumpadDot & NumpadAdd::
send {Media_Stop}
return
NumpadDot::
return

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