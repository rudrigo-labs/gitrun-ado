# ============================================
# GitRun ADO - Bootstrap da Solução
# .NET 10
# Estrutura:
# src/
#   ├── GitRun.Ado.slnx
#   ├── GitRun.Cli/
#   ├── GitRun.Core/
#   ├── GitRun.Git/
#   ├── GitRun.AzureDevOps/
#   └── GitRun.Config/
# ============================================

$SolutionName = "GitRun.Ado"
$Root = Get-Location
$SrcPath = Join-Path $Root "src"

Write-Host ""
Write-Host "============================================"
Write-Host " Criando estrutura da solução GitRun ADO"
Write-Host "============================================"
Write-Host ""

# --------------------------------------------
# Criar pasta src
# --------------------------------------------
New-Item -ItemType Directory -Path $SrcPath -Force | Out-Null
Set-Location $SrcPath

# --------------------------------------------
# Criar solução dentro de src
# --------------------------------------------
dotnet new sln --name $SolutionName

# Renomear para .slnx
if (Test-Path "$SolutionName.sln") {
    Rename-Item "$SolutionName.sln" "$SolutionName.slnx"
}

# --------------------------------------------
# Criar projetos
# --------------------------------------------
Write-Host "Criando projetos..."

dotnet new console   -n GitRun.Cli         -f net10.0 -o "GitRun.Cli"
dotnet new classlib  -n GitRun.Core        -f net10.0 -o "GitRun.Core"
dotnet new classlib  -n GitRun.Git         -f net10.0 -o "GitRun.Git"
dotnet new classlib  -n GitRun.AzureDevOps -f net10.0 -o "GitRun.AzureDevOps"
dotnet new classlib  -n GitRun.Config      -f net10.0 -o "GitRun.Config"

# --------------------------------------------
# Adicionar projetos à solução
# --------------------------------------------
Write-Host "Adicionando projetos à solução..."

dotnet sln add "GitRun.Cli/GitRun.Cli.csproj"
dotnet sln add "GitRun.Core/GitRun.Core.csproj"
dotnet sln add "GitRun.Git/GitRun.Git.csproj"
dotnet sln add "GitRun.AzureDevOps/GitRun.AzureDevOps.csproj"
dotnet sln add "GitRun.Config/GitRun.Config.csproj"

# --------------------------------------------
# Referências entre projetos
# --------------------------------------------
Write-Host "Criando referências..."

# CLI depende de tudo que orquestra
dotnet add "GitRun.Cli/GitRun.Cli.csproj" reference `
    "GitRun.Core/GitRun.Core.csproj" `
    "GitRun.Git/GitRun.Git.csproj" `
    "GitRun.AzureDevOps/GitRun.AzureDevOps.csproj" `
    "GitRun.Config/GitRun.Config.csproj"

# Git depende de Core
dotnet add "GitRun.Git/GitRun.Git.csproj" reference `
    "GitRun.Core/GitRun.Core.csproj"

# AzureDevOps depende de Core + Config
dotnet add "GitRun.AzureDevOps/GitRun.AzureDevOps.csproj" reference `
    "GitRun.Core/GitRun.Core.csproj" `
    "GitRun.Config/GitRun.Config.csproj"

# Config depende de Core
dotnet add "GitRun.Config/GitRun.Config.csproj" reference `
    "GitRun.Core/GitRun.Core.csproj"

# --------------------------------------------
# Criar estrutura inicial de pastas
# --------------------------------------------
Write-Host "Criando estrutura inicial de pastas..."

# CLI
New-Item -ItemType Directory -Path "GitRun.Cli/Commands" -Force | Out-Null

# Core
New-Item -ItemType Directory -Path "GitRun.Core/Abstractions" -Force | Out-Null
New-Item -ItemType Directory -Path "GitRun.Core/Models" -Force | Out-Null
New-Item -ItemType Directory -Path "GitRun.Core/Results" -Force | Out-Null

# Git
New-Item -ItemType Directory -Path "GitRun.Git/Services" -Force | Out-Null

# Azure DevOps
New-Item -ItemType Directory -Path "GitRun.AzureDevOps/Services" -Force | Out-Null

# Config
New-Item -ItemType Directory -Path "GitRun.Config/Models" -Force | Out-Null
New-Item -ItemType Directory -Path "GitRun.Config/Services" -Force | Out-Null

# --------------------------------------------
# Build inicial
# --------------------------------------------
Write-Host "Executando build inicial..."
dotnet build

Write-Host ""
Write-Host "============================================"
Write-Host " Estrutura criada com sucesso!"
Write-Host "============================================"
Write-Host ""
Write-Host "Solução: $SrcPath\\$SolutionName.slnx"
Write-Host ""