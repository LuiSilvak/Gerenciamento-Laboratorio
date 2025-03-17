# Importar a lista de máquinas
$maquinas = Get-Content "../config/maquinas.json" | ConvertFrom-Json

function Send-WOL {
    param (
        [string]$macAddress,
        [string]$broadcast = "255.255.255.255",
        [int]$port = 9
    )

    $macBytes = $macAddress -split "[:-]" | ForEach-Object { [byte]("0x$_") }
    $packet = (,[byte]0xFF * 6) + ($macBytes * 16)
    $udpClient = New-Object System.Net.Sockets.UdpClient
    $udpClient.Connect($broadcast, $port)
    $udpClient.Send($packet, $packet.Length)
    $udpClient.Close()
}

foreach ($pc in $maquinas.maquinas) {
    Write-Host "Enviando Wake-on-LAN para $($pc.nome)..."
    Send-WOL -macAddress $pc.mac
}
