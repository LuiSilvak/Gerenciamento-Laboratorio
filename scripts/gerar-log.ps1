# Definir caminho do log
$logPath = "../logs/laboratorio-log.txt"

# Criar o diretório de logs caso não exista
if (!(Test-Path "../logs")) {
    New-Item -ItemType Directory -Path "../logs" | Out-Null
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
