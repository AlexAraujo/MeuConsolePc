Parte 1: Introdução e Funcionalidades

# 🎮 Automatização PC-Console v1.0 (Alexa Integrated)

Este projeto transforma um computador em um console de jogos totalmente automatizado. Através de comandos de voz da Alexa e scripts inteligentes, o sistema alterna entre o modo Desktop e o Modo Console em uma TV, eliminando a necessidade de teclado e mouse para jogar.

IMPORTANTE:
Caso esteja usando um cabo hdmi muito grande, lembre de trocar na sua tv o hdmi de 2,1 para um versão 1.4 ou 1.x

---

## 🚀 Funcionalidades Principais

* **⚡ Transição por Voz:** Alterne entre monitor e TV com apenas um comando para a Alexa.
* **🎮 Joystick-First:** Controle o cursor do Windows e clique com o controle 8BitDo (Modo Mouse).
* **📺 Gestão Inteligente de Telas:** Desliga os monitores do PC ao ligar a TV para foco total.
* **🔊 Automação de Áudio:** Troca o som do Headset para os alto-falantes da TV automaticamente.
* **🕹️ Interface de Console:** Inicia o Playnite em modo Fullscreen (estilo PS5/Xbox).

---

## 🛠️ Requisitos de Instalação

Para replicar este setup, você precisará dos seguintes utilitários:

1. [MultiMonitorTool](https://www.nirsoft.net/utils/multi_monitor_tool.html)
2. [NirCmd](https://www.nirsoft.net/utils/nircmd.html)
3. [AutoHotkey v1.1](https://www.autohotkey.com/)
4. [TRIGGERcmd](https://www.triggercmd.com/)
5. [Playnite](https://playnite.link/)

Parte 2: Configuração Alexa e TRIGGERcmd

---

## 🎙️ Guia de Configuração: Alexa & Voice

A automação é feita via **TRIGGERcmd**, que funciona como um "interruptor inteligente" para o seu PC.

### 1. No TRIGGERcmd (PC)
Adicione dois comandos apontando para os scripts na pasta `scripts-powershell`:
* **Comando:** `Ligar Console` -> Executa `LigarConsole.ps1`
* **Comando:** `Desligar Console` -> Executa `DesligarConsole.ps1`

### 2. No App Alexa (Celular)
Crie as seguintes **Rotinas**:
* **"Alexa, hora de jogar"**: Ativa o comando "Ligar Console".
* **"Alexa, hora de parar"**: Ativa o comando "Desligar Console".

Parte 3: Guia do Controle e Notas Finais

---

## 🕹️ Guia do Controle (Sem Teclado/Mouse)

O script de **Modo Mouse** permite navegar no Windows usando apenas o controle.

| Botão | Ação |
| :--- | :--- |
| **L3 + R3 (Analógicos)** | **Ativa/Desativa o Modo Mouse** |
| **Analógico Direito** | Move o cursor (Seta do mouse) |
| **Gatilho Direito (RT)** | Clique Esquerdo (Segure para arrastar) |
| **Gatilho Esquerdo (LT)** | Clique Direito |
| **Start + Select** | Abre/Foca no Menu de Jogos (Playnite) |
| **Start + R3** | **Fechar Jogo:** Força o fechamento do app atual |

---

## ⚠️ Notas Importantes (Solução de Problemas)

* **Monitor Secundário:** O script de retorno força o sinal para o monitor principal (`DisplaySwitch /internal`).
* **Permissões:** Sempre execute o AutoHotkey como Administrador para que ele funcione por cima de jogos e da Steam.

---
**Status do Projeto:** v1.0 - Estável ✅
