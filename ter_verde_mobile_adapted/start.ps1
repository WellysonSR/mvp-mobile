<#
Script de inicialização para desenvolvimento no Windows (PowerShell).
Ativa o ambiente virtual local (.venv) e executa o aplicativo Flask.
#>
<# O script suporta tanto ambientes `.venv` (criados pelo setup_env.ps1) quanto ambientes `venv` (existentes), portanto, funciona em ambos os casos. #>

$activatePath = $null
if (Test-Path ".\.venv\Scripts\Activate.ps1") {
    $activatePath = ".\.venv\Scripts\Activate.ps1"
} elseif (Test-Path ".\venv\Scripts\Activate.ps1") {
    $activatePath = ".\venv\Scripts\Activate.ps1"
}

if (-not $activatePath) {
    Write-Error "Ambiente virtual não encontrado. Execute primeiro o arquivo .\setup_env.ps1 para criar e instalar as dependências."
    exit 1
}

Write-Host "Ativando o ambiente virtual: $activatePath"
. $activatePath

Write-Host "Iniciando o aplicativo Flask (python app.py)"
python app.py
