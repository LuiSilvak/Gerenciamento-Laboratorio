# Importar a lista de máquinas
$maquinas = Get-Content "../config/maquinas.json" | ConvertFrom-Json

foreach ($pc in $maquinas.maquinas) {
    Write-Host "Desligando $($pc.nome)..."
    Stop-Computer -ComputerName $pc.nome -Force
}
