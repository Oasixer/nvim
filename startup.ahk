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

; more info on options: https://www.autohotkey.com/docs/commands/InputHook.htm
; Use the option "V" for nonblocking!
; Use the option "Tx" where x is the timeout in seconds (decimal)
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
Capslock & `;::Send {end}
Capslock & g::Send {home}

Capslock & d::
    if(GetKeyState("Control", "P"))
    {
        SetCapsLockState, AlwaysOff
        return
    }
    Send {delete}
    return

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


; SURFACE PEN
; Pressing the eraser button of the Surface Pen sends a hotkey combination of Windows Key + F18/19/20 Function Key, 
; see mapping as follows

; #F20 = Single Press, 
; #F19 = Double Press,
; #F18 = Long Press,

; <#F20::Send ^z

f18 := false
f19 := false
f20 := false

<^k::
    if WinActive("ahk_class Framework::CFrame ahk_exe onenote.exe")
    {
        Send ^k
        Send +{Tab}
        Send +{Tab}
        Send +{Tab}
        Send ^v
        Send +{Tab}
    }
return


<#F20::
    f20 := true
    if (f18)
    {
        return
    }
    if WinActive("ahk_class Framework::CFrame ahk_exe onenote.exe")
    {

        MouseGetPos, StartX, StartY
        ; MouseMove, 128, 397 
        Click, 128, 397 ; location for bottom right in desktop mode and top left in tablet mode
        ; Click, 175, 425 ; location for dead center in tablet mode
        MouseMove, StartX, StartY
        ; Send ^z
    }
return

<#F19::
    f19 := true
    if (f18)
    {
        return
    }
    if WinActive("ahk_class Framework::CFrame ahk_exe onenote.exe")
    {

        MouseGetPos, StartX, StartY
        Click, 1500, 200
        MouseMove, StartX, StartY
    }
return

<#F18::
    f18 := true
    f19 := false
    f20 := false
    t = 0
    ; options:
    ; S = suppress
    ; v = visible (opposite of suppress)
    ; L = length
    sleep 700
    if (f20)
    {
        Send ^{Tab}
        ; MsgBox c tab
    }
    else if (f19)
    {
        Send +^{Tab}
        ; MsgBox c tab2
    }
    else
    {
        ; Send ^{Tab}
        ; Send {LWin Up}
        ; Send {LWin}
        ; Send {LWin Up}
        Send ^!p
        ; MsgBox c print
        ; MsgBox not detected
    }
    f18 := false
    f19 := false
    f20 := false
    ; else
    ; {
    ; }
return

; Use mouse4 to hold ctrl for swapping screens
; XButton2::LCtrl

CapsLock & r:: ; Reload script
    ; reload
    Run, "C:\Users\%A_Username%\.config\nvim\startup.ahk"
    ; this lower version doesnt work bc no matter what I try the unicode doesnt work ie AHK launches in ANSI mode
    ; even if I run AutoHotkey_U32.exe...
    ; Run, C:\Program Files\AutoHotkey\AutoHotkey.exe "C:\Users\%A_Username%\.config\nvim\startup.ahk"
    Sleep 300
    while(GetKeyState("r", "P"))
    {
        sleep 50
    }
    Send {Enter}
    return
    

CapsLock & s:: ;symbol insertion!
    name =
    winTitle := "Input Symbol"
    winPrompt := "Input Symbol"
    width =
    height =
    x =
    y =
    locale =
    timeout =
    InputBox, name, %winTitle%, %winPrompt%, , %width%, %height%, %x%, %y%, %locale%, %timeout%
    
    If (name ="ualpha")
        send Α
    else If (name ="lalpha")
        send α
    else If (name ="ubeta")
        send Β
    else If (name ="lbeta")
        send β
    else If (name ="ugamma")
        send Γ
    else If (name ="lgamma")
        send γ
    else If (name ="udelta")
        send Δ
    else If (name ="ldelta")
        send δ
    else If (name ="uepsilon")
        send Ε
    else If (name ="lepsilon")
        send ε
    else If (name ="uzeta")
        send Ζ
    else If (name ="lzeta")
        send ζ
    else If (name ="ueta")
        send Η
    else If (name ="leta")
        send η
    else If (name ="utheta")
        send Θ
    else If (name ="ltheta")
        send θ
    else If (name ="uiota")
        send Ι
    else If (name ="liota")
        send ι
    else If (name ="ukappa")
        send Κ
    else If (name ="lkappa")
        send κ
    else If (name ="ulambda")
        send Λ
    else If (name ="llambda")
        send λ
    else If (name ="umu")
        send Μ
    else If (name ="lmu")
        send μ
    else If (name ="unu")
        send Ν
    else If (name ="lnu")
        send ν
    else If (name ="uxi")
        send Ξ
    else If (name ="lxi")
        send ξ
    else If (name ="uomicron")
        send Ο
    else If (name ="lomicron")
        send ο
    else If (name ="upi")
        send Π
    else If (name ="lpi")
        send π
    else If (name ="urho")
        send Ρ
    else If (name ="lrho")
        send ρ
    else If (name ="usigma")
        send Σ
    else If (name ="lsigma")
        send σ
    else If (name ="utau")
        send Τ
    else If (name ="ltau")
        send τ
    else If (name ="uupsilon")
        send Υ
    else If (name ="lupsilon")
        send υ
    else If (name ="uphi")
        send Φ
    else If (name ="lphi")
        send φ
    else If (name ="uchi")
        send Χ
    else If (name ="lchi")
        send χ
    else If (name ="upsi")
        send Ψ
    else If (name ="lpsi")
        send ψ
    else If (name ="uomega")
        send Ω
    else If (name ="lomega")
        send ω
    else If (name ="backtick")
        send ``
    else If (name = "super0")
        send ⁰
    else If (name = "sub0")
        send ₀
    else If (name = "super1")
        send ¹
    else If (name = "sub1")
        send ₁
    else If (name = "super2")
        send ²
    else If (name = "sub2")
        send ₂
    else If (name = "super3")
        send ³
    else If (name = "sub3")
        send ₃
    else If (name = "super4")
        send ⁴
    else If (name = "sub4")
        send ₄
    else If (name = "super5")
        send ⁵
    else If (name = "sub5")
        send ₅
    else If (name = "super6")
        send ⁶
    else If (name = "sub6")
        send ₆
    else If (name = "super7")
        send ⁷
    else If (name = "sub7")
        send ₇
    else If (name = "super8")
        send ⁸
    else If (name = "sub8")
        send ₈
    else If (name = "super9")
        send ⁹
    else If (name = "sub9")
        send ₉
    else If (name = "suba")
        send ₐ
    else If (name = "subi")
        send ᵢ
    else If (name = "subj")
        send ⱼ
    else If (name = "subk")
        send ₖ
    else If (name = "subl")
        send ₗ
    else If (name = "subm")
        send ₘ
    else If (name = "subn")
        send ₙ
    else If (name = "subo")
        send ₒ
    else If (name = "subp")
        send ₚ
    else If (name = "subs")
        send ₛ
    else If (name = "subt")
        send ₜ
    else If (name = "subu")
        send ᵤ
    else If (name = "subv")
        send ᵥ
    else If (name = "supera")
        send ᵃ
    else If (name = "superb")
        send ᵇ
    else If (name = "superc")
        send ᶜ
    else If (name = "superd")
        send ᵈ
    else If (name = "supere")
        send ᵉ
    else If (name = "superf")
        send ᶠ
    else If (name = "superg")
        send ᵍ
    else If (name = "superh")
        send ʰ
    else If (name = "superi")
        send ⁱ
    else If (name = "superj")
        send ʲ
    else If (name = "superk")
        send ᵏ
    else If (name = "superl")
        send ˡ
    else If (name = "superm")
        send ᵐ
    else If (name = "supern")
        send ⁿ
    else If (name = "supero")
        send ᵒ
    else If (name = "superp")
        send ᵖ
    else If (name = "superr")
        send ʳ
    else If (name = "supers")
        send ˢ
    else If (name = "supert")
        send ᵗ
    else If (name = "superu")
        send ᵘ
    else If (name = "superv")
        send ᵛ
    else If (name = "superw")
        send ʷ
    else If (name = "superx")
        send ˣ
    else If (name = "supery")
        send ʸ
    else If (name = "superz")
        send ᶻ
    else If (name = "integral")
        send ∫
    else If (name = "sqrt")
        send √(){Left}
    else If (name = "sub+")
        send ₊
    else If (name = "sub-")
        send ₋
    else If (name = "cura")
        send 𝓪
    else If(name = "curb")
        send 𝓫
    else If(name = "curc")
        send 𝓬
    else If(name = "curd")
        send 𝓭
    else If(name = "cure")
        send 𝓮
    else If(name = "curf")
        send 𝓯
    else If(name = "curg")
        send 𝓰
    else If(name = "curh")
        send 𝓱
    else If(name = "curi")
        send 𝓲
    else If(name = "curj")
        send 𝓳
    else If(name = "curk")
        send 𝓴
    else If(name = "curl")
        send 𝓵
    else If(name = "curm")
        send 𝓶
    else If(name = "curn")
        send 𝓷
    else If(name = "curo")
        send 𝓸
    else If(name = "curp")
        send 𝓹
    else If(name = "curq")
        send 𝓺
    else If(name = "curr")
        send 𝓻
    else If(name = "curs")
        send 𝓼
    else If(name = "curt")
        send 𝓽
    else If(name = "curu")
        send 𝓾
    else If(name = "curv")
        send 𝓿
    else If(name = "curw")
        send 𝔀
    else If(name = "curx")
        send 𝔁
    else If(name = "cury")
        send 𝔂
    else If(name = "curz")
        send 𝔃
    else If(name = "curA")
        send 𝒜
    else If(name = "curB")
        send 𝐵
    else If(name = "curC")
        send 𝒞
    else If(name = "curD")
        send 𝒟
    else If(name = "curE")
        send 𝐸
    else If(name = "curF")
        send 𝐹
    else If(name = "curG")
        send 𝒢
    else If(name = "curH")
        send 𝐻
    else If(name = "curI")
        send 𝐼
    else If(name = "curJ")
        send 𝒥
    else If(name = "curK")
        send 𝒦
    else If(name = "curL")
        send 𝐿
    else If(name = "curM")
        send 𝑀
    else If(name = "curN")
        send 𝒩
    else If(name = "curO")
        send 𝒪
    else If(name = "curP")
        send 𝒫
    else If(name = "curQ")
        send 𝒬
    else If(name = "curR")
        send 𝑅
    else If(name = "curS")
        send 𝒮
    else If(name = "curT")
        send 𝒯
    else If(name = "curU")
        send 𝒰
    else If(name = "curV")
        send 𝒱
    else If(name = "curW")
        send 𝒲
    else If(name = "curX")
        send 𝒳
    else If(name = "curY")
        send 𝒴
    else If(name = "curZ")
        send 𝒵
    else
        MsgBox, 0, ,Unrecognized symbol name!,0.3
    return
