param (
    [string]$Comando
)

# Importar a lista de máquinas
$maquinas = Get-Content "../config/maquinas.json" | ConvertFrom-Json

foreach ($pc in $maquinas.maquinas) {
    Write-Host "Executando comando em $($pc.nome)..."
    Invoke-Command -ComputerName $pc.nome -ScriptBlock { param($cmd) Invoke-Expression $cmd } -ArgumentList $Comando
}
