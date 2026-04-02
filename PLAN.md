# PLAN: Magia Automática (NAS Registry)

O objetivo é criar um microserviço no NAS que automatiza a configuração do app, eliminando a necessidade de copiar e colar chaves de API manualmente.

## 1. Back-end: NAS Registry (Docker)
Criaremos um container leve (Python + FastAPI) que roda no NAS.

### Funcionalidades:
- **Auto-Discovery:** O container terá acesso (read-only) aos volumes de configuração do Lidarr, Radarr, Sonarr, Seerr e Prowlarr.
- **API Endpoint:** Um endpoint `GET /config` que retorna um JSON com todas as chaves extraídas em tempo real.
- **Segurança:** Implementação de um `X-Registry-Token` para que apenas o seu app possa ler as chaves.

### Estrutura do Docker:
- **Imagem:** `python:3.11-slim`
- **Volumes:**
  - `/home/didizera/meu-nas/media/lidarr/config.xml:/app/configs/lidarr/config.xml:ro`
  - `/home/didizera/meu-nas/media/seerr/settings.json:/app/configs/seerr/settings.json:ro`
  - (e outros conforme necessário)

## 2. Rede e Exposição (Nginx Proxy Manager)
- Criar host `registry.meunas.home` apontando para o container na porta 8000.
- Adicionar cabeçalho de segurança ou Basic Auth se preferir.

## 3. Front-end: Flutter App
- **Settings Page:** Adicionar botão "Sincronizar com NAS".
- **Fluxo:**
  1. O usuário digita o "Registry Token" (uma vez).
  2. O app chama `http://registry.meunas.home/config`.
  3. O app popula `SharedPreferences` com as chaves recebidas.

## 4. Cronograma de Execução:
1. **[ ]** Criar código do microserviço `nas-registry` (Python).
2. **[ ]** Criar `Dockerfile` e `docker-compose.yaml` (ou adicionar ao existente).
3. **[ ]** Deploy no NAS via SSH.
4. **[ ]** Configurar Nginx Proxy Manager.
5. **[ ]** Implementar lógica de sincronização no app Flutter.
