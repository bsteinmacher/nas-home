# NAS_MONITOR_v1.0

App Flutter de monitoramento e operação do home server [meu-nas](https://github.com/didizera/meu-nas).

Dashboard TUI (terminal aesthetic) com status de hardware/serviços, sync de API keys via Nas Registry e módulos reais para **Seerr** e **Lidarr**.

## Documentação

- **[Análise, necessidades e plano](docs/ANALISE-E-PLANO.md)** — estado do app e do NAS, gaps, pontos críticos e roadmap por fases
- Acesso SSH, layout de pastas no servidor e portas estão nesse documento

## O que já funciona

- Monitoramento de hardware via **Glances** (`:61208/api/4/all`)
- Status online/offline dos serviços por porta
- Badges / update de containers via **Nas Registry** (`:8000`)
- **Seerr**: busca, trending, detalhes, request (com temporadas)
- **Lidarr**: busca e add de artistas, álbuns
- Settings: URL do NAS + Registry Token + sync (depende do `/config` no Registry — ver doc)

## Arquitetura

Clean Architecture + BLoC + GetIt + Dio + Freezed.

```
lib/core/          # tema TUI, DI
lib/data/          # datasources e repositories
lib/domain/        # entities e usecases
lib/presentation/  # pages, BLoCs, widgets
```

## Stack

| Item | Valor |
|------|--------|
| Framework | Flutter / Dart |
| Estado | flutter_bloc |
| HTTP | Dio |
| Persistência | SharedPreferences |
| Design | JetBrains Mono, tokens em `lib/core/theme/` |

## NAS (resumo)

```bash
ssh meu-nas          # host LAN 192.168.1.99
# Infra: ~/meu-nas/{core,media,tools,data}
# Registry (deploy): ~/nas-registry
```

Detalhes de pastas, portas, problemas atuais e plano de correção: [docs/ANALISE-E-PLANO.md](docs/ANALISE-E-PLANO.md).

## Desenvolvimento

```bash
flutter pub get
flutter run
```

Dependência local: `../design_system` (path no `pubspec.yaml`).

---

*Desenvolvido por [didizera](https://github.com/didizera)*
