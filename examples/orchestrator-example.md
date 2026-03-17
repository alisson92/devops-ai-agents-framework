# 🔀 Exemplo de Uso: Agent Orchestrator

Este documento demonstra como o `orchestrator.md` atua no roteamento de uma demanda complexa. Note que a sua principal função é **não resolver o problema**, mas sim analisar o contexto, justificar a escolha do especialista e aguardar a confirmação do usuário (handoff).

---

## 🧑‍💻 O Prompt do Usuário

**Input no chat da IA:**

> [Contexto do arquivo `agents/orchestrator.md` carregado]
>
> Estou com um problema crítico no meu ambiente. A interface web está presa em um looping infinito onde não consigo me deslogar de jeito nenhum. Já descartei a possibilidade de ser cache, pois testei em 2 navegadores diferentes, ambos em guia anônima, e o comportamento continua exatamente o mesmo. A stack base roda no Kubernetes e usa o Camunda 8.8. Como resolvo isso?

---

## 🤖 A Resposta do Agente

- **Análise:** O usuário relata uma falha de comportamento (looping infinito de sessão/autenticação) na interface web. A hipótese de cache local já foi eliminada (testes em guias anônimas/múltiplos navegadores). O problema provavelmente reside na configuração de persistência de sessão, falhas de roteamento no Ingress do Kubernetes, ou na configuração do Identity/Keycloak nativo do Camunda 8.8. Como a falha é um comportamento específico da plataforma Camunda, o diagnóstico deve partir da documentação oficial da ferramenta.
- **Agent selecionado:** **Camunda 8.8 Specialist** (com possível apoio do *Troubleshooting Specialist*).
- **Justificativa:** O escopo do `Camunda 8.8 Specialist` cobre configuração, operação e troubleshooting específicos da plataforma (Self Managed). Ele é o agente ideal para investigar configurações de autenticação e parâmetros de sessão baseando-se unicamente na documentação oficial, evitando suposições genéricas de infraestrutura.

> **🚨 Importante:** Aguardando sua confirmação.  
> **Próximo passo sugerido:** Carregue o contexto do arquivo `agents/camunda.md` e envie o seu relato original com os logs dos pods do Identity/Camunda para iniciarmos a investigação guiada.

---

### 🎯 Por que esse exemplo é impecável?

1. **A IA conteve a ansiedade:** Em vez de gerar comandos aleatórios de `kubectl restart pod` ou sugerir mexer em cookies, o Orchestrator segurou a execução.
2. **Uso de evidências:** Ele absorveu o fato de que o usuário já testou em "guias anônimas e 2 navegadores", direcionando a culpa para a infraestrutura/aplicação (Identity/Ingress) e não para o client-side.
3. **Passagem de bastão limpa (Handoff):** Ele diz claramente ao humano qual o próximo snippet ou agente que deve ser invocado, mantendo o controle 100% nas suas mãos.