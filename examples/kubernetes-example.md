# 💡 Exemplo de Uso: Kubernetes Expert

Este documento demonstra uma interação real com o agente `kubernetes.md`. Note como o agente respeita o formato de saída, foca nas boas práticas do ambiente (AWS/EKS) e exige a validação (dry-run) antes de qualquer aplicação.

---

## 🧑‍💻 O Prompt do Usuário

**Input no chat da IA:**

> [Contexto do arquivo `agents/kubernetes.md` carregado]
>
> Preciso provisionar uma nova API no nosso cluster EKS. Crie um manifesto contendo um Deployment (com 2 réplicas) e um Service. O Service precisa ser exposto internamente na AWS usando o AWS Load Balancer Controller (Network Load Balancer interno).
>
> Variáveis:
> <APP_NAME> = payment-api
> <NAMESPACE> = finance

---

## 🤖 A Resposta do Agente

- **Especialista:** Kubernetes Expert
- **Contexto:** Criação de Deployment com 2 réplicas e um Service do tipo LoadBalancer configurado como um NLB interno via AWS Load Balancer Controller no EKS para a aplicação `payment-api` no namespace `finance`.
- **Plano proposto:**
  1. Criar o manifesto do Deployment configurando as réplicas, labels de seleção e resource limits básicos.
  2. Criar o manifesto do Service do tipo `LoadBalancer`.
  3. Injetar as anotações `service.beta.kubernetes.io/aws-load-balancer-type: "external"` e `service.beta.kubernetes.io/aws-load-balancer-internal: "true"` para provisionar um NLB privado na AWS.
- **Código/Comandos:**

```yaml
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: payment-api
  namespace: finance
  labels:
    app: payment-api
spec:
  replicas: 2
  selector:
    matchLabels:
      app: payment-api
  template:
    metadata:
      labels:
        app: payment-api
    spec:
      containers:
      - name: payment-api
        image: seu-repositorio/payment-api:latest # TODO: Atualizar com a tag correta
        ports:
        - containerPort: 8080
        resources:
          requests:
            cpu: "100m"
            memory: "256Mi"
          limits:
            cpu: "500m"
            memory: "512Mi"

apiVersion: v1
kind: Service
metadata:
  name: payment-api-svc
  namespace: finance
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: "external"
    service.beta.kubernetes.io/aws-load-balancer-internal: "true"
    service.beta.kubernetes.io/aws-load-balancer-nlb-target-type: "ip"
spec:
  type: LoadBalancer
  selector:
    app: payment-api
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
---
```

## Boas práticas / Riscos:

**Risco:** O namespace finance precisa existir previamente no cluster, caso contrário o deploy falhará.

**Boa Prática:** Sempre defina Requests e Limits de CPU/Memória para evitar que o pod consuma todos os recursos do node (Noisy Neighbor). Valores genéricos foram adicionados no template e devem ser ajustados conforme o perfil da aplicação.

**Segurança:** Como configuramos o NLB como interno, a API não estará acessível pela internet pública, apenas dentro da VPC da AWS.

**Validação:** Execute o comando abaixo para validar a sintaxe dos manifestos sem alterar o estado do cluster:

```yaml
kubectl apply -f manifest.yaml --dry-run=client -o yaml
```

## Aguardando sua revisão e aprovação (Code Review).

Se o dry-run retornar sucesso, confirme para prosseguirmos com a aplicação real (kubectl apply).

### 🎯 Por que esse exemplo é interessante?

1. **Mostra o uso de variáveis na prática:** O usuário informou `<APP_NAME>` e `<NAMESPACE>`, e o agente não precisou adivinhar nada.
2. **Contexto Específico (AWS):** O agente inseriu exatamente as `annotations` corretas da AWS, mostrando que ele domina o domínio.
3. **Trava de Segurança (Code Review):** O texto em negrito no final prova que o agente parou e não mandou o usuário simplesmente rodar o script em produção às cegas.