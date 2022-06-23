#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

; add wasd alt arrows 
Menu, Tray, NoStandard 
Menu, Tray, Add, WASD Alt Arrows, toggle
Menu, Tray, Add 
Menu, Tray, Standard

; falls through the label on script launch; script active
; defaults to true since it was false (not set) before.
toggle: 
    ScriptActive := !ScriptActive
    if (ScriptActive) {
        Menu, Tray, Icon, wasd-icon-on.png
        Menu, Tray, Check, WASD Alt Arrows
    } else {
        Menu, Tray, Icon, wasd-icon-off.png
        Menu, Tray, UnCheck, WASD Alt Arrows
    }
    Return

#If ScriptActive
    !w:: Send {Up}
    !a:: Send {Left}
    !s:: Send {Down}
    !d:: Send {Right}

    !+w:: Send +{Up}
    !+a:: Send +{Left}
    !+s:: Send +{Down}
    !+d:: Send +{Right}

    !^w:: Send ^{Up}
    !^a:: Send ^{Left}
    !^s:: Send ^{Down}
    !^d:: Send ^{Right}

    !^+w:: Send ^+{Up}
    !^+a:: Send ^+{Left}
    !^+s:: Send ^+{Down}
    !^+d:: Send ^+{Right}
#If