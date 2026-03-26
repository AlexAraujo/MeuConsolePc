#Persistent
#NoEnv
#SingleInstance Force

; Inicia DESATIVADO para não atrapalhar o Angular/SQL
ModoMouse := 0
CliqueApertado := 0

SetTimer, WatchJoystick, 10
return

WatchJoystick:
; --- NOVO ATALHO: L3 (Joy9) + R3 (Joy10) ---
; Apertar os dois analógicos para ligar/desligar
if (GetKeyState("Joy9") && GetKeyState("Joy10"))
{
    ModoMouse := !ModoMouse
    if (ModoMouse)
    {
        Progress, b w200 h40 zy10 Standard, MOUSE: ATIVADO, , StatusControle, Arial
        Sleep, 1000
        Progress, Off
    }
    else
    {
        Click, Up
        CliqueApertado := 0
        Progress, b w200 h40 zy10 Standard CTRed, MOUSE: DESATIVADO, , StatusControle, Arial
        Sleep, 1000
        Progress, Off
    }
    Sleep, 1000 ; Pausa para não alternar rápido demais
}

; --- SÓ EXECUTA O MOUSE SE O MODO ESTIVER ATIVO ---
if (ModoMouse)
{
    GetKeyState, JoyR, JoyR
    GetKeyState, JoyU, JoyU
    MouseDeadzone := 25
    MouseSpeed := 0.75

    if (JoyU > 50 + MouseDeadzone or JoyU < 50 - MouseDeadzone or JoyR > 50 + MouseDeadzone or JoyR < 50 - MouseDeadzone)
    {
        ; Sua calibração de eixos funcional
        DeltaX := (JoyU - 50) / MouseSpeed
        DeltaY := (JoyR - 50) / MouseSpeed
        MouseMove, %DeltaX%, %DeltaY%, 0, R
    }

    ; Lógica de Clique (Gatilho Joy6)
    if GetKeyState("Joy6") 
    {
        if (CliqueApertado = 0) 
        {
            Click, Down
            CliqueApertado := 1
        }
    }
    else 
    {
        if (CliqueApertado = 1) 
        {
            Click, Up
            CliqueApertado := 0
        }
    }
}

; --- ATALHOS PADRÃO (Sempre ativos) ---
; Start (Joy8) + Select (Joy7) -> Playnite
if (GetKeyState("Joy8") && GetKeyState("Joy7"))
{
    IfWinExist, ahk_exe Playnite.FullscreenApp.exe
        WinActivate
    else
        Run, "C:\Users\alexa\AppData\Local\Playnite\Playnite.DesktopApp.exe" --startfullscreen
    Sleep, 2000
}
return