#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
SetNumLockState, AlwaysOff

; Remap win+l to alt tab


#+s:: Send {LWin down}{Shift Down}s{Shift up}{LWin up}
#r:: Send {LWin down}r{LWin up}

Capslock & lwin::rwin
Capslock & 1::F1
Capslock & 2::F2
Capslock & 3::F3
Capslock & 4::F4
Capslock & 5::F5
Capslock & 6::F6
Capslock & 7::F7
Capslock & 8::F8
Capslock & 9::F9
Capslock & 0::F10
Capslock & -::F11
Capslock & =::F12
Capslock & Backspace::Delete
+Backspace::Send {Delete}
+Esc::Send ~
Capslock & Esc::SendRaw ``

Capslock & j::Send {Down}
Capslock & h::Send {Left}
Capslock & k::Send {Up}
Capslock & l::Send {Right}

lwin::
    h := false
    l := false
    hasPressed := false
    all := ""
    temp := 0
    While(1=1)
    {
        If(GetKeyState("h", "P")){
            If !h
            {
                If(!GetKeyState("Alt", "P"))
                {
                    Send {Alt Down}
                }
                Send {Shift Down}{Tab}{Shift Up}
                hasPressed := true
                h := true
            }
        }
        else
        {
            h := false
        }
        If(GetKeyState("l", "P"))
        {
            If(!l)
            {
                If(!GetKeyState("Alt", "P"))
                {
                    Send {Alt Down}
                }
                Send {Tab}
                hasPressed := true
                l := true
            }
        }
        else
        {
            l := false
        }

        If(!GetKeyState("LWin", "P"))
        {
            if !hasPressed
            {
                Send {LWin}
                break
            }
            break
        }

        Sleep 10 ;to make this loop less cpu intensive
    }
    Send {Alt up}
    Send {LWin up}
return

