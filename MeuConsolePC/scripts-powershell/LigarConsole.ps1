# 1. FORÇA o Windows a mudar para "Somente Segunda Tela" (Isso geralmente foca na TV)
& DisplaySwitch.exe /external
Start-Sleep -s 2

# 2. Mata qualquer tentativa do Monitor 2 de aparecer
# Vamos desativar os monitores do PC pelo NOME e pela ID ao mesmo tempo
MultiMonitorTool.exe /disable "\\.\DISPLAY1"
MultiMonitorTool.exe /disable "\\.\DISPLAY2"
MultiMonitorTool.exe /disable "MONITOR\DELA0D8\{4d36e96e-e325-11ce-bfc1-08002be10318}\0006"

# 3. GARANTE que a TV TCL (ID 0004) seja a ÚNICA ativa e Primária
MultiMonitorTool.exe /enable "MONITOR\XXX2851\{4d36e96e-e325-11ce-bfc1-08002be10318}\0004"
Start-Sleep -s 2
MultiMonitorTool.exe /setprimary "MONITOR\XXX2851\{4d36e96e-e325-11ce-bfc1-08002be10318}\0004"

# 4. Se o Monitor 2 ainda estiver aceso, este comando é o "tiro de misericórdia"
# Ele desativa qualquer monitor que NÃO seja a TV TCL
MultiMonitorTool.exe /Refresh
Start-Sleep -s 1

# 5. Configura Áudio e abre o Playnite
nircmd setdefaultsounddevice "Beyond TV"
Start-Process "C:\Users\alexa\AppData\Local\Playnite\Playnite.DesktopApp.exe" -ArgumentList "--startfullscreen"