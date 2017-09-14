;Reload

+Esc::reload
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

PgDn::
return

; Page Up remap

PgUp::
return

; End remap

End::
return

;Home remap

Home::
return

;Insert remap

Ins::
return

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