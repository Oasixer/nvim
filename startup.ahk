#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; disabling bullshit via regedit

; snipping tool -------------------
; regedit
; Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft
; create key TabletPC
; new DWORD 32bit called DisableSnippingTool w/ 0x00000001

; lock screen ----------------
; regedit
; Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\windows
; create key Personalization
; new DWORD 32bit called NoLockScreen w/ 0x00000001

; improve screen polling rate on surface ------------------
; regedit
; Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\TouchPrediction
; reduce Latency and SampleTime, eg. to 2ms


; Syntax that i forget often
; MsgBox hi
; ~^1:: ; the ~ symbol causes this hotkey to not block the native function of ~^1 which is blocked by default


; Useful shortcuts: http://aalapshah.in/qipress
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
SetNumLockState, AlwaysOff

KeyWaitAny(Options:="")
{
    ih := InputHook(Options)
    ih.KeyOpt("{All}", "ES")  ; End and Suppress
    ih.Start()
    ErrorLevel := ih.Wait()  ; Store EndReason in ErrorLevel
    return ih.EndKey  ; Return the key name
}

KeyWaitCombo(Options:="")
{
    ih := InputHook(Options)
    ih.KeyOpt("{All}", "ES")  ; End and Suppress
    ; Exclude the modifiers
    ih.KeyOpt("{LCtrl}{RCtrl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}", "-ES")
    ih.Start()
    ErrorLevel := ih.Wait()  ; Store EndReason in ErrorLevel
    return ih.EndMods . ih.EndKey  ; Return a string like <^<+Esc
}

; #+s::#+s
#+1::Send #+{Left}
#+2::Send #+{Right}

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
; screenshot
; Capslock & s::^!p
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


; lwin::
    ; h := false
    ; l := false
    ; r := false
    ; shift_s := false
    ; hasPressed := false
    ; all := ""
    ; temp := 0
    ; time = 0


    ; ; Send {LWin Down}
    ; While(1=1)
    ; {
        ; ; test := KeyWaitCombo()
        ; ; MsgBox %test%
        ; If(GetKeyState("LShift", "P") and GetKeyState("s", "P"))
        ; {
            ; ; MsgBox hi
            ; return
        ; }
        
        ; If(GetKeyState("LShift", "P") and GetKeyState("1", "P"))
        ; {
            ; Send #+{Left}
            ; Sleep 15
            ; return
        ; }

        ; If(GetKeyState("LShift", "P") and GetKeyState("2", "P"))
        ; {
            ; Send #+{Right}
            ; Sleep 15
            ; return
        ; }
        
        ; if(GetKeyState("r", "P"))
        ; {
            ; Send #r
            ; return
        ; }
        
        ; If(GetKeyState("d", "P"))
        ; {
            ; Send #d
            ; return
        ; }
        ; If(GetKeyState("x", "P"))
        ; {
            ; Send #x
            ; return
        ; }
        ; If(GetKeyState("h", "P"))
        ; {
            ; If !h
            ; {
                ; If(!GetKeyState("Alt", "P"))
                ; {
                    ; Send {Alt Down}
                ; }
                ; Send {Shift Down}{Tab}{Shift Up}
                ; hasPressed := true
                ; h := true
            ; }
        ; }
        ; Else
        ; {
            ; h := false
        ; }

        ; If(GetKeyState("l", "P"))
        ; {
            ; If(!l)
            ; {
                ; Send {Alt Down}
                ; Send {Tab}
                ; Send {Alt Up}
                ; hasPressed := true
                ; l := true
            ; }
        ; }
        ; else
        ; {
            ; l := false
        ; }

        ; if(!GetKeyState("LWin", "P"))
        ; {
            ; if(!hasPressed)
            ; {
                ; if(time < 300)
                ; {
                    ; Send {LWin}
                ; }
            ; }
            ; break
        ; }

        ; Sleep 5 ;to make this loop less cpu intensive
        ; time := time + 5
    ; }
    ; ; Send {Alt up}
    ; ; Send {LWin up}
; return

; SURFACE PEN
; Pressing the eraser button of the Surface Pen sends a hotkey combination of Windows Key + F18/19/20 Function Key, 
; see mapping as follows

; #F20 = Single Press, 
; #F19 = Double Press,
; #F18 = Long Press,

; <#F20::Send ^z

~<#F20::Send ^z
~<#F18::
{
	SetTitleMatchMode, % (Setting_A_TitleMatchMode := A_TitleMatchMode) ? "RegEx" :
	if WinExist("ahk_class Microsoft-Windows-.*SnipperToolbar")
	{
		WinGet, State, MinMax
		if (State = -1)
		{	
			WinRestore
			Send, ^n
		}
		else if WinActive()
			WinMinimize
		else
		{
			WinActivate
			Send, ^n
		}
	}
	else if WinExist("ahk_class Microsoft-Windows-.*SnipperEditor")
	{
		WinGet, State, MinMax
		if (State = -1)
			WinRestore
		else if WinActive()
			WinMinimize
		else
			WinActivate
                Send, ^n
	}
	else
	{
		Run, snippingtool.exe
		if (SubStr(A_OSVersion,1,2)=10)
		{
			WinWait, ahk_class Microsoft-Windows-.*SnipperToolbar,,3
			Send, ^n
		}
	}
	SetTitleMatchMode, %Setting_A_TitleMatchMode%
	return
}

; #IfWinExist, ahk_class Shell_TrayWnd
; {
; #F20::
    ; SetKeyDelay, 50 ; this is to prevent pressing (mapped) LWin before the physical keystroke of         the pen has been processed
    ; {send, {LWin}
    ; return
    ; }
; }
; #IfWinActive, ahk_class Windows.UI.Core.CoreWindow
; {
; #F20::
    ; SetKeyDelay, 50
    ; {send {Esc}
    ; return
    ; }
; }


; Use mouse4 to hold ctrl for swapping screens
XButton2::LCtrl
