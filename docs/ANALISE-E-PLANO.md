# NAS Monitor — Análise, Necessidades e Plano

Documento de referência do estado do projeto (app Flutter + infraestrutura no NAS).

Substitui os arquivos legados `PLAN.md` e `GEMINI.md`.

**Última atualização:** 29/08/2026 (após Fase 0 no NAS: deSEC, Headscale, Glances, Registry).

---

## 1. Visão geral

**NAS_MONITOR_v1.0** é um app Flutter (Clean Architecture + BLoC) que funciona como dashboard e painel de operação do home server **meu-nas** (Lenovo E73, Arch Linux).

Objetivo: ver saúde do host, status dos containers, sincronizar API keys automaticamente e operar serviços de mídia (hoje: Seerr e Lidarr) sem abrir várias UIs web.

### Stack do app

| Camada | Tecnologia |
|--------|------------|
| UI | Flutter, tema TUI (`lib/core/theme/`) |
| Estado | flutter_bloc + Freezed |
| HTTP | Dio |
| DI | GetIt |
| Persistência local | SharedPreferences |
| Monitoramento host | Glances API v4 (`:61208/api/4/all`) via `glances-api.service` |
| Discovery / updates | Nas Registry (`:8000`) |

### Arquitetura do app (resumo)

```
lib/
  core/          # tema, DI
  data/          # datasources (Seerr, Lidarr, Registry) + repositories
  domain/        # entities, usecases, repository contracts
  presentation/  # BLoCs, pages, widgets TUI
```

Fluxo típico:

1. Usuário configura `nas_url` + `registry_token` em Settings.
2. Home carrega hardware (Glances) + status HTTP por porta + badges de update (Registry).
3. Módulos Seerr/Lidarr usam API keys salvas (idealmente via sync do Registry).
4. Botão de update por serviço chama `POST /update/{container}` no Registry.

---

## 2. Acesso ao servidor NAS

| Item | Valor |
|------|--------|
| Alias SSH (máquina de desenvolvimento) | `meu-nas` (também aparece como `meunas` em configs antigas) |
| Host / IP LAN | `192.168.1.99` (`enp2s0`) |
| Usuário | `didizera` |
| Hostname | `meu-nas` |
| OS | Arch Linux |
| Comando | `ssh meu-nas` |

> **Nota:** configs antigas citavam `192.168.100.85` — o IP atual validado é `192.168.1.99`. Os `extra_records` do Headscale já foram atualizados para esse IP.

### Rede Docker e domínio

- Rede externa compartilhada: `proxynet`
- Comunicação **serviço → serviço** (ex.: Seerr → Sonarr): usar **nome do container**, nunca o domínio `.home`
- Domínios locais via Nginx Proxy Manager + AdGuard (ex.: `jellyfin.home`, `seerr.home`)
- VPN pública Headscale: `https://mattewhisper3.dedyn.io` (**operacional** após correção em 29/08/2026)
- Vaultwarden público: `https://vault.mattewhisper3.dedyn.io`
- DNS / certificados Let's Encrypt: **deSEC** (`dns-desec` no Certbot do NPM). Token API em `/etc/letsencrypt/credentials/desec.ini` e `credentials-9` (token `certbot` no painel deSEC, sem expiração)

### Preferências de mídia (contexto operacional)

- Áudio: priorizar FLAC; Navidrome faz transcode sob demanda
- Vídeo: HEVC/x265, ~1080p Bluray/WEB-DL (evitar REMUX)
- Áudio original preferencial
- Hardlinks: downloads e mídia sob o mesmo mount `/data`

---

## 3. Disposição dos arquivos no NAS

Raiz da infraestrutura: `~/meu-nas` (`/home/didizera/meu-nas`).

```
~/meu-nas/
├── README.md                 # docs da infra
├── archive/                  # serviços inativos / experimentos
├── core/                     # segurança, DNS, proxy, VPN
│   ├── docker-compose.yml
│   ├── adguard/
│   ├── headscale/            # compose próprio + config/ (corrigido 29/08)
│   ├── npm/                  # Nginx Proxy Manager + credentials deSEC
│   ├── tailscale/
│   └── vaultwarden/
├── media/                    # stack de mídia (*arr, Jellyfin, etc.)
│   ├── docker-compose.yml
│   ├── jellyfin/, seerr/, lidarr/, radarr/, sonarr/, ...
│   ├── immich/, navidrome/, qbittorrent/, ...
│   └── jellyseerr/           # legado de nome (serviço atual: seerr)
├── tools/                    # utilitários
│   ├── forgejo/
│   ├── glances/              # compose DESABILITADO (profile disabled) — ver §4
│   └── syncthing/            # sync P2P (música offline no celular)
│   # registry legado → archive/registry-legacy/ (arquivado 29/08)
└── data/                     # dados persistentes
    ├── downloads/
    ├── media/
    │   ├── music/
    │   ├── movies/
    │   ├── tv/
    │   └── photos/           # Immich
    └── config/
```

### 3.1 Nas Registry (código de produção)

| Caminho | Papel |
|---------|--------|
| `~/nas-registry/` | **Fonte de verdade** do deploy (`Dockerfile` copia `src/main.py`) |
| `~/meu-nas/archive/registry-legacy/` | Versão antiga arquivada em 29/08/2026 — **não usar** |

**Importante:** o `Dockerfile` usa `COPY src/main.py`. Em 29/08 o `main.py` da raiz (com `/config`) foi sincronizado para `src/main.py` e o container foi rebuildado.

Endpoints atuais (validados):

| Método | Path | Função |
|--------|------|--------|
| GET | `/health` | Health check |
| GET | `/config` | API keys (`lidarr`, `radarr`, `sonarr`, `prowlarr`, `seerr`) — header `X-Registry-Token` |
| GET | `/updates` | Digests / update available por container |
| POST | `/update/{service_name}` | Pull + recreate via compose |

Container: `nas-registry` na porta **8000**, com `docker.sock` e binds read-only das configs `*arr`/Seerr.

### Comandos úteis no NAS

```bash
ssh meu-nas

# Stacks
cd ~/meu-nas/core && docker compose ps
cd ~/meu-nas/media && docker compose ps
cd ~/meu-nas/tools/syncthing && docker compose ps
cd ~/meu-nas/core/headscale && docker compose ps

# Registry
cd ~/nas-registry && docker compose ps
curl -s http://127.0.0.1:8000/health
# /config exige token do ~/nas-registry/.env
curl -s -H "X-Registry-Token: $REGISTRY_TOKEN" http://127.0.0.1:8000/config

# Glances (API que o app usa — serviço host)
systemctl status glances-api.service
curl -s -o /dev/null -w "%{http_code}\n" http://127.0.0.1:61208/api/4/all
```

---

## 4. Estado atual — o que está pronto

### App Flutter

- [x] Shell TUI (tema, tipografia, widgets reutilizáveis)
- [x] Home: hardware via Glances (CPU, RAM, SSD, HDD, rede, temp, uptime)
- [x] Home: status online/offline por porta
- [x] UI de updates por serviço (integração Watchtower-like)
- [x] Settings: URL + Registry Token + botão de sync
- [x] **Seerr**: trending, busca, detalhes, request, seleção de temporadas
- [x] **Lidarr**: busca de artistas, add, listagem de álbuns
- [x] DI, Freezed, repositórios para Seerr/Lidarr/NAS/Registry

### Infra NAS (atualizado 29/08/2026)

- [x] Maioria da stack media/core/tools saudável
- [x] Syncthing rodando (`:8384`, `:22000`, `:21027`)
- [x] **Headscale** up (`v0.29.3`, porta host `8088`, sem restart loop)
- [x] **Glances host** via `glances-api.service` na `:61208` (API 200)
- [x] **Glances Docker** desabilitado (`tools/glances` com `profiles: ["disabled"]`)
- [x] **Nas Registry** rebuildado: `/health`, `/config`, `/updates`, `/update/{name}` OK
- [x] Token **deSEC** renovado (vitalício) e gravado nas credenciais do Certbot/NPM

---

## 5. Estado atual — o que está pela metade / pendente no app

| Item | Situação |
|------|----------|
| Sync Settings → Registry | Backend OK (`/config` retorna keys). Falta validar ponta a ponta no app (Fase 1.1–1.2) |
| Páginas de serviço (~17) | Só stub `COMING_SOON` + botão de update Docker |
| Health checks no app | Vaultwarden (porta 80 = NPM), Headscale ainda listado como `8080` no catálogo (deveria `8088`) |
| Catálogo do app | **Nextcloud** marcado como `NOT_DEPLOYED` (planejado para fase futura); **não lista Syncthing** (existe e está up) |
| Unificar registries | ~~`tools/registry` legado~~ **arquivado** em `archive/registry-legacy/` |
| Testes | `test/widget_test.dart` praticamente vazio |

---

## 6. Estado atual — o que precisa ser feito

### Infra (restante)

1. ~~Headscale crash loop~~ **feito**
2. ~~Conflito Glances~~ **feito**
3. ~~Redeploy Nas Registry com `/config`~~ **feito**
4. ~~**Arquivar ou unificar** `~/meu-nas/tools/registry` vs `~/nas-registry`~~ **feito** (29/08)
5. Pin de versão da imagem Headscale (evitar novo breaking change do `latest`)
6. Testar acesso remoto real via `mattewhisper3.dedyn.io` / cliente Tailscale-Headscale no celular

### App (Fase 1+)

1. Validar sync de API keys no Settings (backend já responde)
2. Adicionar **Syncthing** ao catálogo e à navegação
3. ~~Remover ou marcar **Nextcloud** como inexistente~~ **feito** — `isDeployed: false`, badge `NOT_DEPLOYED`, deploy planejado para fase futura
4. Corrigir portas/health (Headscale `8088`, Vaultwarden via proxy/domínio)
5. Implementar módulos de alto valor: qBittorrent, Radarr, Sonarr
6. Deep link / WebView para Immich, Jellyfin, Navidrome enquanto não há API nativa
7. Considerar `flutter_secure_storage` para tokens/keys
8. Testes de BLoC/datasources

### Serviços no NAS vs app

| Serviço | No NAS | No app | Módulo real |
|---------|--------|--------|-------------|
| Seerr, Lidarr | Sim | Sim | Sim |
| Demais *arr / media / core listados | Sim | Sim (stub) | Não |
| Syncthing | Sim | **Não** | — |
| Recyclarr, Tailscale client | Sim | Não | — |
| Nextcloud | **Não** | Sim (`NOT_DEPLOYED`) | — (planejado) |
| Headscale | **Up** | Stub | — |
| Glances | Host OK (Docker off) | Usa API | — |

---

## 7. Pontos críticos — histórico e status

### C1 — Sync de API keys — **resolvido no backend**

- **Causa:** `Dockerfile` copiava `src/main.py` sem `/config`; container desatualizado vs `main.py` da raiz.
- **Feito:** sync `main.py` → `src/main.py` + `docker compose up --build -d` em `~/nas-registry`.
- **Validado:** `/config` 200 com token; keys lidarr/radarr/sonarr/prowlarr/seerr presentes.
- **Restante:** testar botão Sync no app Flutter.

### C2 — VPN Headscale — **resolvido**

- **Causa:** `randomize_client_port` removida na imagem `latest`.
- **Feito:** chave removida do `config.yaml`; IPs MagicDNS atualizados para `192.168.1.99`; container recriado.
- **Validado:** Up, `RestartCount=0`, HTTP `:8088` → 200, versão `v0.29.3`.
- **Restante:** pin de tag da imagem; teste de VPN no celular.

### C3 — Dois Glances na mesma porta — **resolvido**

- **Causa:** `glances-api.service` (host) + container Docker em `tools/glances`.
- **Feito:** `docker compose down`; compose com `profiles: ["disabled"]` e `restart: "no"`.
- **Mantido:** Glances do host (o que o app usa).

### C4 — Registry com docker.sock RW — **ativo (aceito com cuidado)**

- **Risco:** token vazado = controle de containers.
- **Mitigação:** token forte, exposição só LAN/VPN, opcional Basic Auth no NPM.

### C5 — App parece completo, mas a maioria dos módulos é fachada — **aberto**

- Priorizar poucos módulos com API real + deep links; não criar novos stubs vazios.

### C6 — Catálogo desalinhado — **parcial**

- Nextcloud marcado como não implantado no app.
- Ainda falta: incluir Syncthing; corrigir portas Headscale/Vaultwarden.

### C7 — Token deSEC / certificados — **resolvido**

- Token API renovado no painel (nome `certbot`, sem `max_age` / `max_unused_period`).
- Gravado em `desec.ini` e `credentials-9` no volume do NPM.
- Tokens antigos `NPM-Wildcard` e `dyndns` puderam ser removidos (não referenciados no NAS).

---

## 8. Plano de execução

### Fase 0 — Estabilizar o NAS

| # | Tarefa | Status |
|---|--------|--------|
| 0.0 | Renovar token deSEC + atualizar credenciais NPM | **Feito** |
| 0.1 | Corrigir config Headscale e reiniciar | **Feito** |
| 0.2 | Eliminar conflito Glances | **Feito** |
| 0.3 | Rebuild/redeploy `~/nas-registry` com `/config` | **Feito** |
| 0.4 | Arquivar `tools/registry` legado | **Feito** → `archive/registry-legacy/` + `ARCHIVED.md` |
| 0.5 | Pin imagem Headscale + teste VPN no celular | Pendente |

### Fase 1 — Fechar o circuito app ↔ registry (próxima)

| # | Tarefa | Critério de pronto |
|---|--------|--------------------|
| 1.1 | Validar JSON de `/config` vs `RegistryRepositoryImpl` | Sync em Settings grava `seerr_api_key`, `lidarr_api_key`, etc. |
| 1.2 | Ajustar parser se necessário | Snackbar de sucesso + Seerr/Lidarr autenticados |
| 1.3 | Adicionar Syncthing em `_getBaseServices` + card + página mínima | Aparece no status e no quick access |
| 1.4 | Marcar Nextcloud como `NOT_DEPLOYED` | **Feito** — badge no app + nota de deploy futuro |
| 1.5 | Corrigir portas Headscale (`8088`) e health Vaultwarden | Status bate com a realidade |

### Fase 2 — Módulos de alto valor (médio prazo)

| # | Tarefa | Notas |
|---|--------|-------|
| 2.1 | qBittorrent: lista/pause/resume/velocidade | API WebUI; credenciais nas Settings ou Registry |
| 2.2 | Radarr + Sonarr: search + add | Reusar padrão Lidarr; keys já no Registry |
| 2.3 | Deep link / `url_launcher` para Immich, Jellyfin, Navidrome, Syncthing | Enquanto não há API nativa |
| 2.4 | Página Registry: mostrar última sync + status dos endpoints | Tirar do “COMING_SOON” |

### Fase 3 — Qualidade e segurança (contínuo)

| # | Tarefa |
|---|--------|
| 3.1 | `flutter_secure_storage` para token e API keys |
| 3.2 | Testes unitários dos datasources/BLoCs críticos |
| 3.3 | Manter este documento atualizado |
| 3.4 | Pin de imagens Docker críticas (Headscale, Registry) |

---

## 9. Checklist rápido de verificação

```bash
# NAS
ssh meu-nas 'docker ps --format "table {{.Names}}\t{{.Status}}" | grep -E "headscale|nas-registry|syncthing"'
# Glances NÃO deve aparecer como container ativo
systemctl is-active glances-api.service   # expected: active
curl -s http://192.168.1.99:8000/health
curl -s -o /dev/null -w "%{http_code}\n" http://192.168.1.99:61208/api/4/all
curl -s -o /dev/null -w "%{http_code}\n" http://192.168.1.99:8088/
```

No app:

1. Settings → URL `192.168.1.99` + token do `~/nas-registry/.env` → Sync
2. Home carrega hardware + serviços
3. Seerr trending abre sem erro de auth
4. Syncthing aparece na lista (após Fase 1)

---

## 10. Referência rápida de portas (host)

| Serviço | Porta host |
|---------|------------|
| Nginx Proxy Manager | 80, 81, 443 |
| AdGuard | 53, 3000, 8085 |
| Headscale | **8088**→8080, 3478/udp |
| qBittorrent | 8080 |
| Jellyfin | 8096 |
| Seerr | 5055 |
| Navidrome | 4533 |
| Lidarr | 8686 |
| Radarr | 7878 |
| Sonarr | 8989 |
| Prowlarr | 9696 |
| Bazarr | 6767 |
| Tdarr | 8265–8266 |
| Immich | 2283 |
| Autobrr | 7474 |
| FlareSolverr | 8191 |
| Forgejo | 3001, 2222 |
| Syncthing | 8384, 22000, 21027 |
| Nas Registry | 8000 |
| Glances API (host) | 61208 |

Domínios `.home` (NPM): `adguard`, `jellyfin`, `seerr`, `lidarr`, `navidrome`, `prowlarr`, `radarr`, `sonarr`, `bazarr`, `tdarr`, `immich`, `torrent`, `vaultwarden`, `git`, `syncthing`, etc.

Públicos (deSEC + NPM): `mattewhisper3.dedyn.io` (Headscale), `vault.mattewhisper3.dedyn.io` (Vaultwarden).

---

## 11. Changelog desta sessão (29/08/2026)

1. Token deSEC `certbot` criado (sem expiração); credenciais NPM atualizadas; tokens antigos `NPM-Wildcard` / `dyndns` descartáveis.
2. Headscale: removido `randomize_client_port`; IPs MagicDNS → `192.168.1.99`; serviço estável.
3. Glances Docker parado e compose desabilitado; mantido `glances-api.service`.
4. Nas Registry: `src/main.py` alinhado com `/config`; imagem rebuildada; endpoints validados.
5. `tools/registry` legado movido para `~/meu-nas/archive/registry-legacy/`.
6. App: Nextcloud com `isDeployed: false`, status `NOT_DEPLOYED`, deploy planejado para fase futura.

---

*Varredura inicial + correções Fase 0 via `ssh meu-nas`.*
