# Gerenciamento de Laboratório

Este projeto permite o gerenciamento remoto de máquinas em um laboratório com Windows, utilizando scripts PowerShell para ligar, desligar e verificar o status das máquinas.

## 📂 Estrutura do Projeto

```
📦 Gerenciamento-Laboratorio
├📂 config
│ └📄 maquinas-exemplo.json
├📂 scripts
│ ├📄 desligar-laboratorio.ps1
│ ├📄 executar-comando.ps1
│ ├📄 gerar-log.ps1
│ ├📄 ligar-laboratorio.ps1
│ ├📄 reiniciar-laboratorio.ps1
│ ├📄 verificar-status.ps1
├📄 .gitignore
├📄 LICENSE
├📄 README.md
├📄 run-desligar.bat
├📄 run-executar.bat
├📄 run-ligar.bat
├📄 run-reiniciar.bat
└📄 run-verificar.bat
```

## 🛠️ Funcionalidades

- ✅ **Ligar todas as máquinas do laboratório** via Wake-on-LAN.
- ✅ **Desligar todas as máquinas** remotamente via PowerShell.
- ✅ **Verificar o status das máquinas** (ligadas/desligadas).
- ✅ **Registrar logs de eventos**, como ligações e desligamentos.

## 📝 Logs de Atividades

Os logs são armazenados em `logs/laboratorio-log.txt`. Se o diretório `logs/` não existir, ele será criado automaticamente ao executar os scripts.

### 💜 Exemplo de log:
```
2024-03-17 10:00:00 - Ligar laboratório iniciado.
2024-03-17 18:00:00 - Desligar laboratório concluído.
```

## 🛠️ Scripts PowerShell

### 🔹 `gerar-log.ps1` (Registrar logs)
```powershell
# Definir caminho do log
$logDir = "../logs"
$logPath = "$logDir/laboratorio-log.txt"

# Criar diretório de logs se não existir
if (!(Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

# Função para registrar logs
function Write-Log {
    param (
        [string]$mensagem
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $mensagem" | Out-File -Append -FilePath $logPath
}

# Exemplo de uso
Write-Log "Ligar laboratório iniciado."
```

### 🔹 `ligar-laboratorio.ps1` (Ligar máquinas via Wake-on-LAN)
```powershell
. ./gerar-log.ps1  # Importa a função Write-Log
Write-Log "Enviando pacotes Wake-on-LAN..."
```

### 🔹 `desligar-laboratorio.ps1` (Desligar máquinas remotamente)
```powershell
. ./gerar-log.ps1
Write-Log "Desligando todas as máquinas..."
```

### 🔹 `verificar-status.ps1` (Verificar status das máquinas)
```powershell
. ./gerar-log.ps1
Write-Log "Verificando status das máquinas..."
```

---

## 🚀 Como Usar

1. Clone este repositório:
   ```sh
   git clone https://github.com/LuiSilvak/Gerenciamento-Laboratorio.git
   ```
2. Para executar os scripts PowerShell, abra um terminal como **Administrador** e use:
   ```sh
   cd Gerenciamento-Laboratorio/scripts
   powershell -ExecutionPolicy Bypass -File ligar-laboratorio.ps1
   ```
3. Alternativamente, você pode executar os arquivos `.bat` na raiz do projeto:
   ```sh
   run-ligar.bat     # Liga todas as máquinas
   run-desligar.bat  # Desliga todas as máquinas
   run-verificar.bat # Verifica o status das máquinas
   ```

## 📃 Tabela de Arquivos `.bat`

| Arquivo `.bat`        | Descrição |
|-----------------------|-----------|
| `run-ligar.bat`       | Liga todas as máquinas |
| `run-desligar.bat`    | Desliga todas as máquinas |
| `run-reiniciar.bat`   | Reinicia todas as máquinas |
| `run-verificar.bat`   | Verifica o status das máquinas |


