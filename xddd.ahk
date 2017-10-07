;Reload

+Esc::reload
return

; Notepad++
^+n::
Run "C:\Program Files\Notepad++\notepad++.exe"
return

;Launch Firefox

^+f::
Run Firefox.exe
return

;launch cmder

^!t::
Run cmder.exe
return

;launch discord

^+d::
Run C:\Users\Zawaken\AppData\Local\Discord\app-0.0.298\Discord.exe
return

;close programs with win + q

$#q::!F4
return

;disable super key

~LWin Up:: 
return

;Open run dialog

#r::
Run %appdata%\Microsoft\Windows\Start Menu\Programs\System Tools\Run.lnk
return

;Win+L (logoff)

#l::
Shutdown, 0
return

; Page Down remap

PgDn::return

; Page Up remap

PgUp::return

; End remap

End::return

;Home remap

Home::return

;Insert remap

Ins::return

; protonmail

::;proton::zawaken@protonmail.com

;Cancer

::;xd::
	Send, lmao xd lol rofl ialmaorn roflmao XD lawl Cx
	Sleep, 15
	Send, {Enter}
return

;England is my city.

::;nick::
	Send, England is my city.
	Sleep, 15
	Send, {Enter}
return

;markdown

^+m::
Send, ``````{Space}
return

;markdown (rufus)

::;md::
send, ``````{Space}
InputBox, varMark, Enter text
Send, %varMark%
send, ``````{Space}
Send, {Enter}
return

; processing size 

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

; Lenny
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
return

; Gary
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

;Window-dragging with the Superkey

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