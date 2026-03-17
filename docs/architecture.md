# 🏛️ Arquitetura do Framework

O **DevOps AI Agents Framework** é construído sobre o princípio de **Separação de Responsabilidades (Separation of Concerns)**. Em vez de depender de um único modelo de IA generalista que tenta resolver tudo (e frequentemente falha ou alucina), utilizamos um ecossistema de agentes isolados, onde cada um domina exclusivamente o seu contexto.

---

## 🔄 Fluxo de Operação (Core Workflow)

O funcionamento do framework é baseado em um modelo de roteamento e validação humana obrigatória (*Human-in-the-loop*).

```mermaid
flowchart TD
    %% Entradas
    User([Usuário / Engenheiro DevOps]) -->|Input: Prompt + Contexto| Orch{Agent Orchestrator}

    %% Roteamento
    Orch -->|Decisão: Ambíguo| User
    Orch -->|Decisão: Roteamento| Router[Seleção de Domínio]

    %% Agentes Especialistas
    Router -->|Troubleshooting| Tr[Troubleshooting Spec.]
    Router -->|Containers/K8s| K8s[Kubernetes Expert]
    Router -->|Empacotamento| Helm[Helm Expert]
    Router -->|Métricas/Logs| Obs[Observability Expert]
    Router -->|Plataforma| Cam[Camunda 8.8 Spec.]
    Router -->|Documentação| Doc[Documentation Spec.]

    %% Processamento
    Tr --> Output[Resposta Padronizada]
    K8s --> Output
    Helm --> Output
    Obs --> Output
    Cam --> Output
    Doc --> Output

    %% Validação e Execução
    Output --> Review{Code Review Obrigatório}
    Review -->|Rejeitado / Ajuste| Orch
    Review -->|Aprovado| Exec[Execução Manual]
    Exec -->|Deploy/Ação| Infra[(Ambiente: AWS, EKS, Local)]