#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CapsLock::LCtrl

Capslock Up:: 
    SendInput, {LControl Up}  ;--For stability
    ;If A_TimeSincePriorHotkey < 150
    ;{
          ;SendInput, {Escape}   
      ;}
      ;Else
      ;    return
    return
