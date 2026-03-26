# 🎮 PC Console Mode Automation v1.0

Este projeto automatiza a transição de um Desktop de trabalho (Angular/SQL Developer) para um modo Console em uma TV TCL 4K, utilizando uma RTX 5070 Ti e um controle 8BitDo.

## 🛠️ Requisitos
* [MultiMonitorTool](https://www.nirsoft.net/utils/multi_monitor_tool.html) - Gestão de monitores via CLI.
* [NirCmd](https://www.nirsoft.net/utils/nircmd.html) - Troca de dispositivos de áudio.
* [AutoHotkey v1.1](https://www.autohotkey.com/) - Remapeamento do controle.
* [Playnite](https://playnite.link/) - Dashboard de jogos.

---

## 🚀 Funcionalidades

### 1. Script: Ligar Console (PowerShell)
* Desativa os monitores de trabalho (Dell e Monitor 2).
* Ativa a TV TCL (ID: `MONITOR\XXX2851...0004`).
* Define a TV como monitor principal e som para "Beyond TV".
* Inicia o Playnite em Fullscreen.

### 2. Script: Desligar Console (PowerShell)
* Reativa os monitores do PC (Dell e Monitor 2).
* Define o Monitor 2 como principal e volta o áudio para o Headset.
* Desativa a TV e encerra o Playnite.

### 3. Atalhos do Controle (8BitDo)
* **L3 + R3 (Analógicos):** Ativa/Desativa o "Modo Mouse".
* **Start + Select:** Foca ou abre o Playnite.
* **Start + R3:** Força o fechamento da janela ativa (Kill Process).
* **Gatilho Direito (RT):** Clique esquerdo do mouse (com trava de segurança para arrastar).

---

## 🔧 Configuração de Eixos (Calibração)
Caso o mouse fique invertido fora do Playnite, edite o arquivo `AtalhoControle.ahk`:
- **DeltaX:** Controla Horizontal.
- **DeltaY:** Controla Vertical.
- Atual: `DeltaX := (JoyU - 50)` / `DeltaY := (JoyR - 50)`.

---

## ⚠️ Notas de Manutenção (Monitor Dell)
Se o monitor Dell não ligar ao voltar para o modo trabalho:
1. O script executa o comando `DisplaySwitch.exe /internal` para forçar.
2. Ative o "Modo Mouse" no controle e use as configurações de exibição do Windows.

---
**Desenvolvido por:** Alex (2026)
