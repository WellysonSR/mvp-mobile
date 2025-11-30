<#
Script de configuração simples em PowerShell para Windows.
Cria um ambiente virtual em .venv e instala os requisitos.
#>
param(
    [switch]$ForceExecutionPolicy
)

Write-Host "Criando um ambiente virtual em .venv..."
python -m venv .venv

if ($ForceExecutionPolicy) {
    Write-Host "Definindo a política de execução para este usuário como Assinatura Remota..."
    Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
}

Write-Host "Ativando o ambiente virtual..."
. .\.venv\Scripts\Activate.ps1

Write-Host "Instalando pacotes Python a partir do requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

Write-Host "Setup completo. Use '.\start.ps1' para iniciar a aplicação (ou execute 'python app.py')."
