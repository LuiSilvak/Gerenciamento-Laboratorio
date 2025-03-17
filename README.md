# Gerenciamento de Laboratório - PowerShell

Este projeto permite ligar e desligar remotamente as máquinas de um laboratório Windows via rede, utilizando **Wake-on-LAN (WoL)** e **PowerShell Remoting**.

## 📁 Estrutura do Projeto
```
📂 Gerenciamento-Laboratorio
│── 📂 scripts
│   │── ligar-laboratorio.ps1        # Script para ligar todas as máquinas do laboratório
│   │── desligar-laboratorio.ps1     # Script para desligar todas as máquinas do laboratório
│── 📂 config
│   │── maquinas-exemplo.json        # Exemplo de configuração com os MACs das máquinas
│── run-ligar.bat                    # Atalho para executar o script de ligar as máquinas
│── run-desligar.bat                  # Atalho para executar o script de desligar as máquinas
│── .gitignore                        # Arquivo para evitar upload de dados sensíveis
│── README.md                         # Documentação do projeto
```

## 🔧 Configuração Inicial

1. **Copie o arquivo de exemplo:**
   ```sh
   cp config/maquinas-exemplo.json config/maquinas.json
   ```
2. **Edite `config/maquinas.json` e adicione as máquinas com seus MACs reais.**
3. **Garanta que o Wake-on-LAN esteja ativado na BIOS e no Windows.**

## 🚀 Como Usar

### ✅ Ligar todas as máquinas
1. Execute `run-ligar.bat` (duplo clique) **ou**:
   ```sh
   powershell -ExecutionPolicy Bypass -File scripts/ligar-laboratorio.ps1
   ```

### ❌ Desligar todas as máquinas
1. Execute `run-desligar.bat` (duplo clique) **ou**:
   ```sh
   powershell -ExecutionPolicy Bypass -File scripts/desligar-laboratorio.ps1
   ```

## 📌 Dependências
- **PowerShell 5.1 ou superior**
- **Acesso de administrador** na máquina que executará os comandos
- **Configuração do PowerShell Remoting** para permitir desligamento remoto (`Enable-PSRemoting`)

## 🛠️ Personalização
Se desejar adicionar mais máquinas, basta editar o arquivo `config/maquinas.json` e incluir os novos dispositivos no formato:
```json
{
  "maquinas": [
    { "nome": "PC1", "mac": "00:00:00:00:00:00" },
    { "nome": "PC2", "mac": "11:11:11:11:11:11" }
  ]
}
```

## 🔒 Segurança
Para evitar expor informações sensíveis:
- **Os arquivos `.json` reais são ignorados pelo `.gitignore`**, impedindo que os MACs sejam enviados ao repositório público.
- **Os arquivos `.bat` não armazenam dados sensíveis**, apenas servem como atalhos.

---
💡 **Agora seu laboratório pode ser gerenciado remotamente de forma simples e eficiente!** 🚀
