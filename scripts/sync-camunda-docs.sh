#!/bin/bash

# 1. Carrega as variáveis do .env
if [ -f .env ]; then
    set -a; source .env; set +a
fi

DEST_DIR="knowledge-base/camunda/official-docs"
REPO_OWNER="camunda"
REPO_NAME="camunda-docs"
BASE_PATH="docs/self-managed"
TOKEN=$GITHUB_TOKEN

mkdir -p "$DEST_DIR"

echo "🚀 Iniciando Sincronização Estável (Self-Managed)..."

download_recursive() {
    local current_path=$1
    local local_dest=$2

    # Busca a lista de itens da API
    local response=$(curl -s -H "Authorization: Bearer $TOKEN" \
                          -H "Accept: application/vnd.github+json" \
                          "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$current_path")

    # Verifica erro de API
    if [[ $(echo "$response" | jq -r 'if type=="object" then .message else empty end') ]]; then
        echo "❌ Erro na API em $current_path"
        return
    fi

    # Processa cada item usando JQ para evitar confusão entre arquivos e pastas
    echo "$response" | jq -c '.[]' | while read -r item; do
        local name=$(echo "$item" | jq -r '.name')
        local type=$(echo "$item" | jq -r '.type')
        local download_url=$(echo "$item" | jq -r '.download_url')
        local path=$(echo "$item" | jq -r '.path')

        if [ "$type" == "dir" ]; then
            echo "📂 Pasta: $path"
            mkdir -p "$local_dest/$name"
            download_recursive "$path" "$local_dest/$name"
        else
            echo "   📥 Arquivo: $name"
            curl -s -L -H "Authorization: Bearer $TOKEN" "$download_url" -o "$local_dest/$name"
        fi
    done
}

download_recursive "$BASE_PATH" "$DEST_DIR"

echo -e "\n✅ Sincronização finalizada com sucesso!"