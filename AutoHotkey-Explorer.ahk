#SingleInstance, force

SysGet, workArea, MonitorWorkArea
Width := workAreaRight - workAreaLeft
Height := workAreaBottom - workAreaTop
xd := Width - 43
dx := Height - 43

Gui, add, edit, w%xd% r1 vADRESSBAR, https://www.google.com
Gui, add, ActiveX, xm w%xd% h%dx% vXD, Shell.Explorer
ComOBJConnect(XD, SEARCH)
Gui, Show,,AutoHotkey Explorer
Gui, Add, button, x0 y0 Hidden Default, Go
Gui, Font, s10 q5, Source Code Pro
XD.silent := true
XD.navigate(ADRESSBAR)

ButtonGO:
Gui, Submit, Nohide
XD.Navigate(ADRESSBAR)
return

GuiClose:
ExitApp