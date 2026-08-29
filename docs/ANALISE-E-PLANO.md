# NAS Monitor — Análise, Necessidades e Plano

Documento de referência do estado do projeto (app Flutter + infraestrutura no NAS), gerado a partir de varredura do código e do servidor em **29/08/2026**.

Substitui os arquivos legados `PLAN.md` e `GEMINI.md`.

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
| Monitoramento host | Glances API v4 (`:61208/api/4/all`) |
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

> **Nota:** configs antigas citavam `192.168.100.85` — o IP atual validado é `192.168.1.99`.

### Rede Docker e domínio

- Rede externa compartilhada: `proxynet`
- Comunicação **serviço → serviço** (ex.: Seerr → Sonarr): usar **nome do container**, nunca o domínio `.home`
- Domínios locais via Nginx Proxy Manager + AdGuard (ex.: `jellyfin.home`, `seerr.home`)
- VPN pública Headscale: `https://mattewhisper3.dedyn.io` (estado atual: **quebrado** — ver §4)
- Vaultwarden público: `https://vault.mattewhisper3.dedyn.io`

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
│   ├── headscale/            # compose próprio + config/
│   ├── npm/                  # Nginx Proxy Manager
│   ├── tailscale/
│   └── vaultwarden/
├── media/                    # stack de mídia (*arr, Jellyfin, etc.)
│   ├── docker-compose.yml
│   ├── jellyfin/, seerr/, lidarr/, radarr/, sonarr/, ...
│   ├── immich/, navidrome/, qbittorrent/, ...
│   └── jellyseerr/           # legado de nome (serviço atual: seerr)
├── tools/                    # utilitários
│   ├── forgejo/
│   ├── glances/              # compose Docker (conflito com Glances do host)
│   ├── registry/             # versão LEGADA do registry (só /config)
│   └── syncthing/            # sync P2P (música offline no celular)
└── data/                     # dados persistentes
    ├── downloads/
    ├── media/
    │   ├── music/
    │   ├── movies/
    │   ├── tv/
    │   └── photos/           # Immich
    └── config/
```

### Nas Registry (código de produção)

Há **duas** árvores — isso é dívida técnica:

| Caminho | Papel |
|---------|--------|
| `~/nas-registry/` | Fonte “oficial” usada no deploy do container (`docker-compose.yaml`, `main.py` com `/config` + `/updates` + `/update`) |
| `~/meu-nas/tools/registry/` | Versão antiga (FastAPI modular, só discovery de keys). **Não** é o que o container em execução usa |

Container em execução: `nas-registry` na porta **8000**, com `docker.sock` e binds read-only das configs `*arr`/Seerr.

### Comandos úteis no NAS

```bash
ssh meu-nas

# Stacks
cd ~/meu-nas/core && docker compose ps
cd ~/meu-nas/media && docker compose ps
cd ~/meu-nas/tools/syncthing && docker compose ps

# Registry
cd ~/nas-registry && docker compose ps
curl -s http://127.0.0.1:8000/health

# Glances (API que o app usa)
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

### Infra NAS (validado em 29/08/2026)

- [x] Maioria da stack media/core/tools saudável
- [x] Syncthing rodando (`:8384`, `:22000`, `:21027`)
- [x] Nas Registry container up (`:8000/health` OK)
- [x] Glances do **host** respondendo na `:61208` (o app funciona por causa disso)

---

## 5. Estado atual — o que está pela metade

| Item | Situação |
|------|----------|
| Sync Settings → Registry | Código no app existe; **`GET /config` no container em execução retorna 404**. Fonte em disco (`~/nas-registry/main.py`) tem o endpoint — imagem desatualizada |
| Contrato JSON do `/config` | App espera chaves `seerr`, `lidarr`, … — precisa validar após redeploy |
| Páginas de serviço (~17) | Só stub `COMING_SOON` + botão de update Docker |
| Health checks | Vaultwarden (porta 80 = NPM), Headscale (porta errada no catálogo) |
| Catálogo do app | Lista Nextcloud (não existe no NAS); **não lista Syncthing** (existe e está up) |
| Docs | `PLAN.md` / `GEMINI.md` desatualizados (substituídos por este arquivo) |
| Testes | `test/widget_test.dart` praticamente vazio |

---

## 6. Estado atual — o que precisa ser feito

### Infra (bloqueadores)

1. **Headscale em crash loop** (~42k restarts): chave `randomize_client_port` removida na imagem `latest`
2. **Glances Docker em restart loop**: porta `61208` já ocupada pelo Glances do host (`systemd`)
3. **Redeploy do Nas Registry** a partir de uma única fonte de verdade, com `/config` + `/updates` + `/update`
4. **Arquivar ou unificar** `~/meu-nas/tools/registry` vs `~/nas-registry`

### App

1. Fazer sync de API keys funcionar de ponta a ponta
2. Adicionar **Syncthing** ao catálogo e à navegação
3. Remover ou marcar **Nextcloud** como inexistente
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
| Nextcloud | **Não** | Sim (stub) | — |
| Headscale | Crash | Stub | — |
| Glances | Host OK / Docker crash | Usa API | — |

---

## 7. Pontos críticos e soluções

### C1 — Sync de API keys morto

- **Causa:** container `nas-registry` sem endpoint `/config` (imagem ≠ código em `~/nas-registry/main.py`).
- **Solução:** rebuild + `docker compose up -d --build` em `~/nas-registry`; validar com token; alinhar parser no Flutter se o JSON divergir.

### C2 — VPN Headscale fora

- **Causa:** breaking change da imagem `headscale/headscale:latest` vs `config.yaml` antigo (`randomize_client_port`).
- **Impacto:** acesso remoto (4G) aos serviços `.home` / domínio público provavelmente quebrado.
- **Solução:** remover/migrar a chave conforme changelog; pin de versão da imagem; reiniciar e testar `mattewhisper3.dedyn.io`.

### C3 — Dois Glances na mesma porta

- **Causa:** processo host + container Docker ambos na `61208`.
- **Solução:** escolher um (recomendação: manter o do host que o app já usa, remover/parar o compose em `tools/glances`).

### C4 — Registry com docker.sock RW

- **Risco:** token vazado = controle de containers.
- **Solução:** token forte, exposição só LAN/VPN, opcional Basic Auth no NPM.

### C5 — App parece completo, mas a maioria dos módulos é fachada

- **Solução:** priorizar poucos módulos com API real + deep links; não criar novos stubs vazios.

### C6 — Catálogo desalinhado

- **Solução:** incluir Syncthing; remover Nextcloud; corrigir portas; idealmente gerar lista a partir do Registry.

---

## 8. Plano de execução

Ordem pensada para desbloquear valor rápido e reduzir risco.

### Fase 0 — Estabilizar o NAS (1 sessão)

| # | Tarefa | Critério de pronto |
|---|--------|--------------------|
| 0.1 | Corrigir config Headscale e reiniciar | Container `healthy`/`up`, sem restart loop |
| 0.2 | Eliminar conflito Glances (parar Docker ou host) | Só um listener em `61208`; app ainda lê hardware |
| 0.3 | Rebuild/redeploy `~/nas-registry` | `GET /health` e `GET /config` (com token) OK |
| 0.4 | Decisão: arquivar `tools/registry` ou migrar compose para lá | Uma única fonte documentada neste arquivo |

### Fase 1 — Fechar o circuito app ↔ registry (curto prazo)

| # | Tarefa | Critério de pronto |
|---|--------|--------------------|
| 1.1 | Validar JSON de `/config` vs `RegistryRepositoryImpl` | Sync em Settings grava `seerr_api_key`, `lidarr_api_key`, etc. |
| 1.2 | Ajustar parser se chaves forem `*_key` ou aninhadas | Snackbar de sucesso + Seerr/Lidarr autenticados |
| 1.3 | Adicionar Syncthing em `_getBaseServices` + card + página mínima | Aparece no status e no quick access |
| 1.4 | Remover Nextcloud do catálogo (ou marcar “not deployed”) | Sem módulo fantasma |
| 1.5 | Corrigir portas Headscale (`8088`) e health Vaultwarden | Status bate com a realidade |

### Fase 2 — Módulos de alto valor (médio prazo)

| # | Tarefa | Notas |
|---|--------|-------|
| 2.1 | qBittorrent: lista/pause/resume/velocidade | API WebUI; credenciais nas Settings ou Registry |
| 2.2 | Radarr + Sonarr: search + add | Reusar padrão Lidarr; keys já previstas no Registry |
| 2.3 | Deep link / `url_launcher` para Immich, Jellyfin, Navidrome, Syncthing | Enquanto não há API nativa |
| 2.4 | Página Registry: mostrar última sync + status dos endpoints | Tirar do “COMING_SOON” |

### Fase 3 — Qualidade e segurança (contínuo)

| # | Tarefa |
|---|--------|
| 3.1 | `flutter_secure_storage` para token e API keys |
| 3.2 | Testes unitários dos datasources/BLoCs críticos |
| 3.3 | Atualizar este documento quando o estado mudar |
| 3.4 | Pin de imagens Docker críticas (Headscale, Glances, Registry) |

---

## 9. Checklist rápido de verificação

Depois de cada fase, no NAS e no app:

```bash
# NAS
ssh meu-nas 'docker ps --format "table {{.Names}}\t{{.Status}}" | grep -E "headscale|glances|nas-registry|syncthing"'
curl -s http://192.168.1.99:8000/health
curl -s -o /dev/null -w "%{http_code}\n" http://192.168.1.99:61208/api/4/all
```

No app:

1. Settings → salvar URL `192.168.1.99` (ou hostname) + token → Sync
2. Home carrega hardware + serviços
3. Seerr trending abre sem erro de auth
4. Syncthing aparece na lista (após Fase 1)

---

## 10. Referência rápida de portas (host)

| Serviço | Porta host |
|---------|------------|
| Nginx Proxy Manager | 80, 81, 443 |
| AdGuard | 53, 3000, 8085 |
| Headscale | 8088→8080, 3478/udp *(quando saudável)* |
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
| Glances API | 61208 |

Domínios `.home` (NPM): `adguard`, `jellyfin`, `seerr`, `lidarr`, `navidrome`, `prowlarr`, `radarr`, `sonarr`, `bazarr`, `tdarr`, `immich`, `torrent`, `vaultwarden`, `git`, `syncthing`, etc.

---

*Última atualização: 29/08/2026 — varredura app + `ssh meu-nas`.*
