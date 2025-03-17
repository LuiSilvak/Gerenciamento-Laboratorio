# Importar a lista de máquinas
$maquinas = Get-Content "../config/maquinas.json" | ConvertFrom-Json

foreach ($pc in $maquinas.maquinas) {
    $status = Test-Connection -ComputerName $pc.nome -Count 1 -Quiet
    if ($status) {
        Write-Host "$($pc.nome) está LIGADO." -ForegroundColor Green
    } else {
        Write-Host "$($pc.nome) está DESLIGADO." -ForegroundColor Red
    }
}
