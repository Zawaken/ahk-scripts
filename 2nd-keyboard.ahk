#SingleInstance force

!+Esc::reload
return

#if (getKeyState("F23", "P"))
F23::return

numpad0::
	SendInput, hehe xd im gay lol fuqoff
	Sleep, 15
	Send, {Enter}
return

numpad1::
	SendInput, lmao xd lol rofl ialmaorn roflmao XD lawl Cx
	Sleep, 15
	Send, {Enter}
return

numpad2::
	SendInput, Rawr xd
	Sleep, 15
	Send, {Enter}
return

numpad3::
Run "%UserProfile%\AppData\Local\osu!\osu!.exe"
return

numpad4::
	SendInput, Heck off
	Sleep, 15
	Send, {Enter}
return

numpad5::return
numpad6::return
numpad7::return
numpad8::return
numpad9::return

numlock::return

numpadDiv::return
numpadMult::return

numpadSub::return
numpadAdd::return
numpadEnter::return

numpadDot::return


F3::return
F4::return
F5::return
F6::return
F7::return
F9::return
F8::return
F10::return

;;;;;next row;;;;;

`::return
1::return
2::return
3::return
4::return
5::return
6::return
7::return
8::return
9::return
0::return
-::return
=::return
backspace::return

;;;;;next row;;;;;

tab::return
q::return
w::return
e::return
r::return
u::return
i::return

o::
	Run "%UserProfile%\AppData\Local\osu!\osu!.exe"
return

p::return
[::return
]::return
\::return

;;;;;next row;;;;;

capslock::return
a::return
s::
	Run "C:\Program Files (x86)\Steam\Steam.exe"
return




g::return
h::return
j::return
k::return
l::return
`;::return
'::return
enter::return

;;;;;next row;;;;;

Lshift::return
z::return
x::
	SendInput, lmao xd lol rofl ialmaorn roflmao XD lawl Cx {Enter}
return
c::return
v::return
b::return
n::return
m::return
,::return
.::return
/::return
Rshift::return

;;;;;next row;;;;;

Lctrl::return
Lwin::return
Lalt::return
space::return
Ralt::return
Rwin::return
appskey::return
Rctrl::return

;;;;;next area;;;;;

PrintScreen::return
ScrollLock::return

insert::return
home::return
pgup::return

delete::return
end::return
pgdn::return

up::return
down::return
left::return
right::return
return

f::
IfWinNotExist, ahk_class MozillaWindowClass
    run, firefox.exe
if WinActive("ahk_class MozillaWindowClass")
    send, ^{tab}
else
    WinActivate ahk_class MozillaWindowClass
return

y::
IfWinNotExist, ahk_class YandexBrowser_WidgetWin_1
    run, %UserProfile%\AppData\Local\Yandex\YandexBrowser\Application\browser.exe
if WinActive("ahk_class YandexBrowser_WidgetWin_1")
    send, ^{tab}
else
    WinActivate ahk_class YandexBrowser_WidgetWin_1
return

t::
if toggle := !toggle
   WinHide ahk_class Shell_TrayWnd
else
   WinShow ahk_class Shell_TrayWnd
return

d::
IfWinNotExist, ahk_exe DiscordCanary.exe
	Run "%UserProfile%\AppData\Local\DiscordCanary\app-0.0.164\DiscordCanary.exe"
if WinActive("ahk_exe DiscordCanary.exe")
    send, ^{tab}
else
    WinActivate ahk_exe DiscordCanary.exe
return

f1::TaskbarMove("Top")
f2::TaskbarMove("Bottom")



TaskbarMove(p_pos) {
	label:="TaskbarMove_" p_pos

	WinExist("ahk_class Shell_TrayWnd")
	SysGet, s, Monitor

	if (IsLabel(label)) {
		Goto, %label%
	}
	return

	TaskbarMove_Top:
	TaskbarMove_Bottom:
	WinMove(sLeft, s%p_pos%, sRight, 0)
	return
}

WinMove(p_x, p_y, p_w="", p_h="", p_hwnd="") {
	WM_ENTERSIZEMOVE:=0x0231
	WM_EXITSIZEMOVE :=0x0232

	if (p_hwnd!="") {
		WinExist("ahk_id " p_hwnd)
	}

	SendMessage, WM_ENTERSIZEMOVE
	;//Tooltip WinMove(%p_x%`, %p_y%`, %p_w%`, %p_h%)
	WinMove, , , p_x, p_y, p_w, p_h
	SendMessage, WM_EXITSIZEMOVE
}