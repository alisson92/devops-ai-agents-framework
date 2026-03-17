# 📖 Guia de Uso - DevOps AI Agents Framework

Este guia demonstra como utilizar os agentes especialistas no seu fluxo de trabalho diário, garantindo respostas precisas, estruturadas e prontas para uso em produção.

---

## 🚀 Como Invocar um Agente

O framework foi desenhado para ser agnóstico, mas brilha quando integrado diretamente na sua IDE (ex: VS Code com extensões de IA como Claude, Roo Code, Copilot, etc).

Você tem duas formas principais de iniciar uma interação:

1. **Via Snippets (Recomendado):** Digite o gatilho do snippet (ex: `agent-camunda`) no chat da sua IA para carregar instantaneamente o System Prompt do especialista.
2. **Via Arquivo (Manual):** Copie o conteúdo do arquivo `.md` desejado da pasta `/agents` e cole no chat como a primeira mensagem de contexto.

---

## 🛠️ Cenários de Uso Prático

### Cenário 1: Na dúvida, chame o Orchestrator
Você está diante de um problema complexo e não tem certeza se é uma falha de manifesto Kubernetes, um erro no chart do Helm ou um problema de aplicação.

**Seu Prompt:**
> "[Conteúdo de `orchestrator.md`] 
> Estou com um problema na minha stack. Os pods estão subindo, mas o serviço não responde."

**O que vai acontecer:** O Orchestrator não vai tentar adivinhar a solução. Ele vai analisar o cenário e instruir você a acionar o `Troubleshooting Specialist` ou o `Kubernetes Expert` com os logs específicos.

### Cenário 2: Resolução de Problemas Específicos (Troubleshooting + Camunda)
Você está enfrentando um problema real na sua operação, como um looping infinito de login na interface do Camunda 8.8.

**Seu Prompt:**
> "[Conteúdo de `camunda.md` ou `troubleshooting.md`]
> Estou enfrentando um looping infinito na tela de login do Camunda 8.8 no meu cluster. Já testei em dois navegadores diferentes e ambos em guia anônima, então tenho certeza de que não é problema de cache do navegador. Preciso diagnosticar isso."

**O que vai acontecer:** Como o agente possui regras rígidas, ele vai descartar a hipótese de cache (baseado no seu input) e gerar um plano estruturado (Hipóteses → Verificações → Comandos), focando exclusivamente na documentação oficial do Camunda sobre autenticação (Identity/Keycloak), secrets mal configuradas no K8s ou falhas de roteamento no Ingress.

### Cenário 3: Criação Rápida de Infraestrutura (K8s)
Você precisa criar manifestos padronizados.

**Seu Prompt:**
> "[Conteúdo de `kubernetes.md`]
> Modo rápido. Preciso de um Deployment e um Service NodePort para uma aplicação Nginx. <NAMESPACE> = web, <APP_NAME> = frontend."

**O que vai acontecer:**
A tag "Modo rápido" corta qualquer explicação extensa. O agente substitui as variáveis informadas e cospe os manifestos YAML prontos, finalizando com o comando de validação (ex: `kubectl apply -f manifest.yaml --dry-run=client`).

---

## 💎 Dicas de Ouro para Máxima Eficiência

* **Use o `Modo rápido`:** Quando você já sabe o que quer e só precisa da sintaxe correta ou do manifesto gerado, adicione "Modo rápido" no final do seu prompt.
* **Preencha as Variáveis:** Sempre que pedir um manifesto ou chart, já forneça os valores para `<NAMESPACE>`, `<APP_NAME>`, ou `<RELEASE_NAME>`. Isso evita que a IA crie nomes genéricos (`my-app`) que você terá que alterar depois.
* **Nunca pule o Code Review:** A IA propõe, você valida. Se a IA sugerir um comando destrutivo durante um troubleshooting, barre a execução e peça comandos de leitura (Read-Only) primeiro.