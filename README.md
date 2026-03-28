# GitRun ADO

![.NET](https://img.shields.io/badge/.NET-10-blueviolet)
![Status](https://img.shields.io/badge/status-WIP-orange)
![Platform](https://img.shields.io/badge/platform-Windows-blue)
![Azure DevOps](https://img.shields.io/badge/Azure%20DevOps-CLI-0078D7)

> **CLI de produtividade para Git + Azure DevOps**  
> Menos navegador. Mais fluxo. Mais execução.

> ⚠️ **Status:** Em desenvolvimento (**WIP / Work in Progress**)  
> Este projeto ainda está em construção ativa.

---

## 💡 Origem da ideia

O **GitRun ADO** nasceu de uma necessidade prática do dia a dia:

> Eu queria reduzir a dependência da interface web do Azure DevOps e acelerar meu fluxo diário de desenvolvimento, então criei uma CLI local para Git + Azure DevOps.

A proposta é simples: trazer para o terminal tarefas operacionais que normalmente exigem múltiplos passos manuais na interface web, tornando o fluxo mais rápido, contínuo e produtivo.

---

## 🚀 O que é o GitRun ADO?

O **GitRun ADO** é uma ferramenta de linha de comando voltada para desenvolvedores que trabalham com:

- **Git**
- **Azure DevOps**
- **Work Items**
- **Branches**
- **Commits**
- **Pull Requests**

O objetivo é transformar operações frequentes do fluxo de desenvolvimento em comandos curtos, rápidos e mais próximos do contexto real de trabalho dentro do repositório.

---

## ⚡ Como a experiência deve ser

A ideia é permitir fluxos como este:

```bash
gitrun task
gitrun commit
gitrun push
gitrun pr
```

Sem depender constantemente da interface web.

---

## 🧩 Comandos planejados

### Git + fluxo local

```bash
gitrun status
gitrun branch
gitrun checkout
gitrun commit
gitrun push
gitrun pull
```

### Azure DevOps + fluxo operacional

```bash
gitrun task
gitrun tasks
gitrun pr
```

---

## 🔄 Fluxo principal

### Automático

Ao criar uma nova demanda:

```text
Criar Work Item
→ Gerar branch automaticamente
→ Associar branch à demanda
```

### Manual

As etapas abaixo continuam separadas:

```text
Commit
Push
Pull Request
```

Essa decisão mantém o fluxo de desenvolvimento mais coerente, previsível e menos acoplado.

---

## 🌿 Padrão de branches

Padrão adotado:

```text
feature/{id}-{slug}
```

Exemplo:

```text
feature/145-login-jwt
```

Outros padrões previstos:

```text
bugfix/{id}-{slug}
hotfix/{id}-{slug}
chore/{id}-{slug}
refactor/{id}-{slug}
```

---

## 🛠️ Funcionalidades planejadas

### Git
- [ ] Verificar status do repositório
- [ ] Identificar branch atual
- [ ] Criar nova branch
- [ ] Checkout de branch
- [ ] Commit
- [ ] Push
- [ ] Pull

### Azure DevOps
- [ ] Criar Work Item
- [ ] Listar tasks atribuídas ao usuário
- [ ] Criar Pull Request
- [ ] Localizar branches por task
- [ ] Iniciar branch a partir de demanda

### Inteligência de fluxo
- [ ] Detectar automaticamente o repositório Git atual
- [ ] Detectar automaticamente a branch atual
- [ ] Gerar slug automático para branches
- [ ] Detectar task associada à branch atual
- [ ] Reduzir inputs manuais sempre que possível

---

## 🏗️ Arquitetura planejada

```text
GitRun.Ado.sln
 ├── GitRun.Cli
 ├── GitRun.Core
 ├── GitRun.Git
 ├── GitRun.AzureDevOps
 ├── GitRun.Config
 └── GitRun.Installer (futuro)
```

---

## 📦 Roadmap

### MVP
- [ ] Estrutura inicial da solução
- [ ] CLI funcional
- [ ] Comandos principais
- [ ] Integração Git
- [ ] Integração Azure DevOps
- [ ] Configuração local mínima

### Fase 2
- [ ] Persistência de configuração
- [ ] Menos inputs manuais
- [ ] Melhor experiência de uso
- [ ] Checkout por task

### Fase 3
- [ ] Executável instalável
- [ ] Setup para Windows
- [ ] Menu de contexto do Windows Explorer
- [ ] Identidade visual própria

---

## 🖥️ Visão futura

O GitRun ADO está sendo pensado para evoluir de uma CLI para uma ferramenta mais nativa no Windows, incluindo:

- executável instalável
- configuração persistida
- comandos globais
- integração com menu de contexto do Windows Explorer

Exemplo futuro:

```text
GitRun >
  Criar Task + Branch
  Commit
  Push
  Criar Pull Request
  Minhas Tasks
  Checkout por Task
```

---

## ⚙️ Instalação (planejada)

A instalação oficial será documentada futuramente.

Fluxo esperado:

```bash
# instalação futura
gitrun --version
```

---

## 🧪 Exemplo de uso (visão futura)

```bash
# cria demanda + branch
gitrun task

# realiza commit
gitrun commit

# envia branch
gitrun push

# cria pull request
gitrun pr
```

---

## 💼 Valor do projeto

O **GitRun ADO** é um projeto construído para resolver uma dor real de fluxo de engenharia e, ao mesmo tempo, servir como peça de portfólio técnico.

Ele demonstra:

- automação de fluxo de desenvolvimento
- integração com ferramentas corporativas
- design de ferramenta interna
- foco em produtividade
- arquitetura orientada à evolução

---

## ⚠️ Status atual

Este projeto ainda está em desenvolvimento ativo.

Neste momento, a estrutura, arquitetura e comandos estão sendo definidos e evoluídos incrementalmente.

---

## 📄 Licença

A definir futuramente.

