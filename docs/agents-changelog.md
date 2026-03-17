# Changelog - DevOps AI Agents Framework

Todas as mudanças notáveis nos agentes e na estrutura deste projeto serão documentadas neste arquivo.

O formato baseia-se em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/), e este projeto adere ao Versionamento Semântico para os System Prompts.

---

## [1.0.0] - 2026-03-17

### 🚀 Adicionado
- **Suite Inicial de Agentes Especialistas:** Lançamento dos agentes isolados por domínio técnico para garantir respostas precisas e sem alucinações.
  - `camunda.md`: Focado exclusivamente na documentação oficial do Camunda 8.8 Self-Managed (operações e troubleshooting).
  - `kubernetes.md`: Especialista em manifests, arquitetura de cluster e EKS.
  - `helm.md`: Focado em Go templating, `values.yaml` e empacotamento.
  - `observability.md`: Focado na stack open source (Prometheus, Grafana).
  - `documentation.md`: Focado em runbooks e markdown estruturado.
  - `troubleshooting.md`: Implementa um fluxo obrigatório de método científico (Hipóteses → Verificações → Causa Raiz).
- **Agent Orchestrator (`orchestrator.md`):** Adicionado o agente roteador responsável por analisar a ambiguidade e direcionar a demanda para o especialista correto.

### 🔄 Modificado
- **Refatoração do Template Base (`_template.md`):** Estrutura totalmente reescrita para forçar a padronização de todos os agentes.
  - Implementação obrigatória de **Persona**, **Escopo** e **Regras Críticas/Guardrails**.
  - Adição da seção **Boas práticas / Riscos** no output padrão.
  - Padronização do uso de variáveis no formato `<NOME_DA_VARIAVEL>`.

### 🛡️ Segurança (Guardrails)
- **Code Review Obrigatório:** Estabelecido como regra inegociável em todos os agentes. O modelo atua apenas como consultor e exige aprovação explícita antes de sugerir comandos de execução ou validação (ex: `--dry-run`).

### 🗺️ Planejado (Roadmap)
- Criação de agentes focados em IaC (Infrastructure as Code) e gerência de configuração.