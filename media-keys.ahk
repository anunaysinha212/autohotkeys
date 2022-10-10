#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; add media keys
Menu, Tray, NoStandard 
Menu, Tray, Add, Media Keys, toggle
Menu, Tray, Add 
Menu, Tray, Standard

; falls through the label on script launch; script active
; defaults to true since it was false (not set) before.
toggle: 
    ScriptActive := !ScriptActive
    if (ScriptActive) {
    	Menu, Tray, Icon, music-icon-on.png
        Menu, Tray, Check, Media Keys
    } else {
    	Menu, Tray, Icon, music-icon-off2.png
        Menu, Tray, UnCheck, Media Keys
    }
    Return

#If ScriptActive
	;Right Alt is AltGr in my keyboard i.e. LCtrl+RAlt
    <^>!=:: Send {Volume_Up}
    <^>!-:: Send {Volume_Down}
    <^>!0:: Send {Volume_Mute}
    <^>!.:: Send {Media_Next}
    <^>!,:: Send {Media_Prev}
    <^>!/:: Send {Media_Play_Pause}
    ;Also Map Media Controls with Left Alt
    !=:: Send {Volume_Up}
    !-:: Send {Volume_Down}
    !0:: Send {Volume_Mute}
    !.:: Send {Media_Next}
    !,:: Send {Media_Prev}
    !/:: Send {Media_Play_Pause}
    ;Also Map Media Controls with alt x and alt z
    !x:: Send {Volume_Up}
    !z:: Send {Volume_Down}
    ;Tilde key for console etc.
    >^1:: Send {~}
    ;Launch Calculator
    <^>!Backspace::run calc.exe
    !Backspace::run calc.exe
#If