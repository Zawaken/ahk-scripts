#SingleInstance Force

; Enable hot reloading of changes to this file
Run, komorebic watch-configuration enable, , Hide

; Configure the invisible border dimensions
Run, komorebic invisible-borders 7 0 14 7, , Hide

; Enable focus follows mouse
Run, komorebic focus-follows-mouse enable --implementation komorebi, , Hide

; Ensure there are 3 workspaces created on monitor 0
Run, komorebic ensure-workspaces 0 5, , Hide

; Give the workspaces some optional names
Run, komorebic workspace-name 0 0 bsp, , Hide
Run, komorebic workspace-name 0 1 columns, , Hide
Run, komorebic workspace-name 0 2 thicc, , Hide
Run, komorebic workspace-name 0 3 matrix, , Hide
Run, komorebic workspace-name 0 4 floaty, , Hide

; Set the padding of the different workspaces
Run, komorebic workspace-padding 0 1 30, , Hide
Run, komorebic container-padding 0 1 30, , Hide
Run, komorebic workspace-padding 0 2 200, , Hide
Run, komorebic workspace-padding 0 3 0, , Hide
Run, komorebic container-padding 0 3 0, , Hide

; Set the layouts of different workspaces
Run, komorebic workspace-layout 0 1 columns, , Hide

; Set the floaty layout to not tile any windows
Run, komorebic workspace-tiling 0 4 disable, , Hide

; Always show chat apps on the second workspace
Run, komorebic workspace-rule exe slack.exe 0 1, , Hide
Run, komorebic workspace-rule exe Discord.exe 0 1, , Hide

; Always float IntelliJ popups, matching on class
Run, komorebic float-rule class SunAwtDialog, , Hide
; Always float Control Panel, matching on title
Run, komorebic float-rule title "Control Panel", , Hide
; Always float Task Manager, matching on class
Run, komorebic float-rule class TaskManagerWindow, , Hide
; Always float Wally, matching on executable name
Run, komorebic float-rule exe Wally.exe, , Hide
Run, komorebic float-rule exe wincompose.exe, , Hide
; Always float Calculator app, matching on window title
Run, komorebic float-rule title Calculator, , Hide
Run, komorebic float-rule exe 1Password.exe, , Hide

; Always manage forcibly these applications that don't automatically get picked up by komorebi
Run, komorebic manage-rule exe TIM.exe, , Hide
Run, komorebic manage-rule exe Spotify.exe, , Hide

; Identify applications that close to the tray
Run, komorebic identify-tray-application exe Discord.exe, , Hide

; Identify applications that have overflowing borders
Run, komorebic identify-border-overflow exe Discord.exe, , Hide

Run, komorebic complete-configuration, , Hide


Tooltip, komorebi.ahk launched
SetTimer, RemoveToolTip, 5000
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
Tooltip
return

~LWin Up::return
~RWin Up::return

#Return::
Run, wt.exe
return

; Change the focused window, Alt + Vim direction keys
; !h::
#Left::
Run, komorebic focus left, , Hide
return

; !j::
#Down::
Run, komorebic focus down, , Hide
return

; !k::
#Up::
Run, komorebic focus up, , Hide
return

; !l::
#Right::
Run, komorebic focus right, , Hide
return

; Move the focused window in a given direction, Alt + Shift + Vim direction keys
; !+h::
#+Left::
Run, komorebic move left, , Hide
return

; !+j::
#+Down::
Run, komorebic move down, , Hide
return

; !+k::
#+Up::
Run, komorebic move up, , Hide
return

; !+l::
#+Right::
Run, komorebic move right, , Hide
return

; Stack the focused window in a given direction, Alt + Shift + direction keys
!+Left::
Run, komorebic stack left, , Hide
return

!+Down::
Run, komorebic stack down, , Hide
return

!+Up::
Run, komorebic stack up, , Hide
return

!+Right::
Run, komorebic stack right, , Hide
return

!]::
Run, komorebic cycle-stack next, , Hide
return

![::
Run, komorebic cycle-stack previous, , Hide
return

; Unstack the focused window, Alt + Shift + D
!+d::
Run, komorebic unstack, , Hide
return

; Promote the focused window to the top of the tree, Alt + Shift + Enter
!+Enter::
Run, komorebic promote, , Hide
return

; Switch to an equal-width, max-height column layout on the main workspace, Alt + Shift + C
!+c::
Run, komorebic workspace-layout 0 0 columns, , Hide
return

; Switch to the default bsp tiling layout on the main workspace, Alt + Shift + T
!+t::
Run, komorebic workspace-layout 0 0 bsp, , Hide
return

; Toggle the Monocle layout for the focused window, Alt + Shift + F
; !+f::
#r::
Run, komorebic toggle-monocle, , Hide
return

; Toggle native maximize for the focused window, Alt + Shift + =
!+=::
Run, komorebic toggle-maximize, , Hide
return

; Flip horizontally, Alt + X
!x::
Run, komorebic flip-layout horizontal, , Hide
return

; Flip vertically, Alt + Y
!y::
Run, komorebic flip-layout vertical, , Hide
return

; Force a retile if things get janky, Alt + Shift + R
!+r::
Run, komorebic retile, , Hide
return

; Float the focused window, Alt + T
; !t::
#s::
Run, komorebic toggle-float, , Hide
return

; Reload ~/komorebi.ahk, Alt + O
; !o::
#+r::
Run, komorebic reload-configuration, , Hide
return

; Toggle Focus Follows mouse
#f::
Run, komorebic toggle-focus-follows-mouse --implementation windows
return

; Pause responding to any window events or komorebic commands, Alt + P
!p::
Run, komorebic toggle-pause, , Hide
return

; Switch to workspace
; !1::
#1::
Send !
Run, komorebic focus-workspace 0, , Hide
return

; !2::
#2::
Send !
Run, komorebic focus-workspace 1, , Hide
return

; !3::
#3::
Send !
Run, komorebic focus-workspace 2, , Hide
return

; !4::
#4::
Send !
Run, komorebic focus-workspace 3, , Hide
return

; !5::
#5::
Send !
Run, komorebic focus-workspace 4, , Hide
return

; Move window to workspace
; !+1::
#+1::
Run, komorebic send-to-workspace 0, , Hide
return

; !+2::
#+2::
Run, komorebic send-to-workspace 1, , Hide
return

; !+3::
#+3::
Run, komorebic send-to-workspace 2, , Hide
return

; !+4::
#+4::
Run, komorebic send-to-workspace 3, , Hide
return

; !+5::
#+5::
Run, komorebic send-to-workspace 4, , Hide
return
