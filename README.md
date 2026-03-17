# 🚀 DevOps AI Agents Framework

![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-in%20development-blue)
![DevOps](https://img.shields.io/badge/focus-DevOps-orange)
![AI](https://img.shields.io/badge/powered%20by-AI-purple)

Framework de **Agents especializados em DevOps**, projetado para tornar o uso de IA **prático, previsível e aplicável no dia a dia real**.

---

## 🎯 Propósito

No uso tradicional de IA, respostas tendem a ser:

-   Genéricas
-   Inconsistentes
-   Difíceis de reutilizar

Este projeto resolve isso através de um **sistema de agents especializados**, onde cada agent atua de forma isolada em um domínio técnico específico.

> Resultado: respostas mais precisas, padronizadas e utilizáveis localmente (por enquanto).

---

## ⚡ Quick Start (uso em 30 segundos)

1.  Abra sua extensão de IA no VS Code (ex: Claude, Copilot, Roo Code)
2.  Use um snippet (ex: digite `agent-k8s` e aperte `Tab`) ou copie um agent da pasta `/agents`
3.  Preencha as variáveis do template e faça sua solicitação

Exemplo:

``` txt
agent-k8s

Preciso de um Deployment para uma API Node com 2 réplicas

<APP_NAME> = api-node
<NAMESPACE> = backend
```

---

## 🧠 Como funciona

``` mermaid
flowchart TD
    A[Usuário] -->|Prompt/Dúvida| B{Orchestrator}
    B -->|Contexto: K8s| C[Kubernetes Expert]
    B -->|Contexto: Deploy| D[Helm Expert]
    B -->|Contexto: Falhas| E[Troubleshooting]
    C --> F[Resposta Estruturada]
    D --> F
    E --> F
    F --> G[Validação Humana & Code Review]
    G --> H[Execução Manual]
```

---

## 🤖 Agents disponíveis

| Agent | Responsabilidade |
|---|---|
| Kubernetes Expert | Deploy, manifests, arquitetura |
| Helm Expert | Charts e padronização |
| Observability Expert | Métricas, logs e monitoramento |
| Documentation Specialist | Documentação técnica |
| Camunda 8.8 Specialist | Baseado na documentação oficial |
| Troubleshooting Specialist | Diagnóstico e causa raiz |
| Orchestrator | Escolha do agent correto |

---

## 🔍 Exemplo real

Veja exemplos completos de uso na prática:

📁 `/examples/kubernetes-example.md` (Geração de manifestos e IaC)\
📁 `/examples/orchestrator-example.md` (Roteamento de incidentes)

---

## 📦 Estrutura do projeto

    /.vscode        → Snippets de produtividade automatizados para a IDE
    /agents         → Prompts dos agents especializados e template base
    /docs           → Documentação de arquitetura, changelog e guia de uso
    /examples       → Casos reais de interação e respostas esperadas

---

## 🔐 Code Review obrigatório

Nenhuma ação é executada automaticamente.

Fluxo:

1. Agent propõe
2. Você revisa
3. Você aprova
4. Execução manual

---

## 🔥 Diferenciais

-   Agents com escopo isolado
-   Respostas padronizadas
-   Foco em uso real
-   Integração com workflow DevOps
-   Evolução estruturada

---

## 🧠 Sobre

Projeto focado em transformar IA em uma ferramenta:

> **Confiável, previsível e útil no dia a dia DevOps**

---

## 🚀 Roadmap

-   [ ] Orchestrator automatizado
-   [ ] Agents com memória
-   [ ] Integração com APIs
-   [ ] Execução semi-automatizada

---

## 📄 Licença

MIT
