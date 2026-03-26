# 1. Força a detecção de hardware (Isso "acorda" monitores em standby)
MultiMonitorTool.exe /Refresh

# 2. Ativa o monitor Dell especificamente pelo ID de hardware
MultiMonitorTool.exe /enable "MONITOR\DELA0D8\{4d36e96e-e325-11ce-bfc1-08002be10318}\0006"

# 3. Ativa o Display 2 e o coloca como Principal
MultiMonitorTool.exe /enable "\\.\DISPLAY2"
MultiMonitorTool.exe /setprimary "\\.\DISPLAY2"

# 4. Pausa de 2 segundos para o Windows processar os dois monitores do PC
Start-Sleep -s 2

# 5. Agora que o PC é o foco, DESLIGA a TV pelo ID
MultiMonitorTool.exe /disable "MONITOR\XXX2851\{4d36e96e-e325-11ce-bfc1-08002be10318}\0004"

# 6. Comando de segurança do Windows (Garante que o sinal volte para as telas internas)
DisplaySwitch.exe /internal

# 7. Som no Headset e Fecha o Playnite
start ms-settings:display
nircmd setdefaultsounddevice "Alto-falantes"
Stop-Process -Name "Playnite.FullscreenApp" -ErrorAction SilentlyContinue

# Além do que já temos, adicione isso no final:
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Screen]::AllScreens # Força o Windows a ler todos os monitores novamente

# Abre o menu de configurações
start ms-settings:display