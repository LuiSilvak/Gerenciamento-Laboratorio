# Gerenciamento de Laboratório - PowerShell

Este projeto permite ligar e desligar remotamente as máquinas de um laboratório Windows via rede.

## Configuração Inicial

1. **Copie o arquivo de exemplo**:
```bash
    cp config/maquinas-exemplo.json config/maquinas.json
```

2. **Edite config/maquinas.json e adicione as máquinas com seus MACs**.

3. **Execute os scripts normalmente**.

## Ligar as máquinas
1. **Certifique-se de que o Wake-on-LAN está ativado na BIOS e no Windows**.

2. **Execute scripts/ligar-laboratorio.ps1 via PowerShell**.

## Desligar as máquinas
1. **Certifique-se de que as máquinas permitem desligamento remoto (Enable-PSRemoting)**.

2. **Execute scripts/desligar-laboratorio.ps1 via PowerShell**.

## Dependências

- PowerShell 5.1 ou superior
- Acesso de administrador na máquina que executará os comandos.