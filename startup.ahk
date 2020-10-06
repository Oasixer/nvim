#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Useful shortcuts: http://aalapshah.in/qipress
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
SetNumLockState, AlwaysOff


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
Rshift & Backspace::Send {Delete}
+Esc::Send ~
Capslock & Esc::SendRaw ``

Capslock & h::
    shift := false
    alt := false
    ctrl := false
    if((GetKeyState("Shift", "P")) && (!shift))
    {
        Send {RShift Down}
        shift := true
    }
    if((GetKeyState("Alt", "P")) && !alt)
    {
        Send {RAlt Down}
        alt := true
    }
    if(GetKeyState("Control", "P") && !ctrl)
    {
        Send {RControl Down}
        ctrl := true
    }

    Send {Left}

    if (shift)
        Send {RShift Up}
    if (alt)
        Send {RAlt Up}
    if (ctrl)
        Send {RControl Up}
return

Capslock & j::
    shift := false
    alt := false
    ctrl := false
    if((GetKeyState("Shift", "P")) && (!shift))
    {
        Send {RShift Down}
        shift := true
    }
    if((GetKeyState("Alt", "P")) && !alt)
    {
        Send {RAlt Down}
        alt := true
    }
    if(GetKeyState("Control", "P") && !ctrl)
    {
        Send {RControl Down}
        ctrl := true
    }

    Send {Down}

    if (shift)
        Send {RShift Up}
    if (alt)
        Send {RAlt Up}
    if (ctrl)
        Send {RControl Up}
return

Capslock & k::
    shift := false
    alt := false
    ctrl := false
    if((GetKeyState("Shift", "P")) && (!shift))
    {
        Send {RShift Down}
        shift := true
    }
    if((GetKeyState("Alt", "P")) && !alt)
    {
        Send {RAlt Down}
        alt := true
    }
    if(GetKeyState("Control", "P") && !ctrl)
    {
        Send {RControl Down}
        ctrl := true
    }

    Send {Up}

    if (shift)
        Send {RShift Up}
    if (alt)
        Send {RAlt Up}
    if (ctrl)
        Send {RControl Up}
return

Capslock & l::
    shift := false
    alt := false
    ctrl := false
    if((GetKeyState("Shift", "P")) && (!shift))
    {
        Send {RShift Down}
        shift := true
    }
    if((GetKeyState("Alt", "P")) && !alt)
    {
        Send {RAlt Down}
        alt := true
    }
    if(GetKeyState("Control", "P") && !ctrl)
    {
        Send {RControl Down}
        ctrl := true
    }

    Send {Right}

    if (shift)
        Send {RShift Up}
    if (alt)
        Send {RAlt Up}
    if (ctrl)
        Send {RControl Up}
return


lwin::
    h := false
    l := false
    r := false
    shift_s := false
    hasPressed := false
    all := ""
    temp := 0
    time = 0
    ; Send {LWin Down}
    While(1=1)
    {
        If(GetKeyState("LShift", "P") and GetKeyState("s", "P"))
        {
            Send #+s
            return
        }
        
        If(GetKeyState("LShift", "P") and GetKeyState("1", "P"))
        {
            Send #+{Left}
            Sleep 15
        }

        If(GetKeyState("LShift", "P") and GetKeyState("2", "P"))
        {
            Send #+{Right}
            Sleep 15
        }
        
        if(GetKeyState("r", "P"))
        {
            Send #r
            return
        }
        
        If(GetKeyState("d", "P"))
        {
            Send #d
            return
        }
        If(GetKeyState("x", "P"))
        {
            Send #x
            return
        }
        If(GetKeyState("h", "P"))
        {
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
        Else
        {
            h := false
        }

        If(GetKeyState("l", "P"))
        {
            If(!l)
            {
                Send {Alt Down}
                Send {Tab}
                Send {Alt Up}
                hasPressed := true
                l := true
            }
        }
        else
        {
            l := false
        }

        if(!GetKeyState("LWin", "P"))
        {
            if(!hasPressed)
            {
                if(time < 300)
                {
                    Send {LWin}
                }
            }
            break
        }

        Sleep 5 ;to make this loop less cpu intensive
        time := time + 5
    }
    ; Send {Alt up}
    ; Send {LWin up}
return

#+1::Send #+{Left}
#+2::Send #+{Right}

