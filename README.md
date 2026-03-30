# 🏠 NAS_MONITOR_v1.0

Interface de gerenciamento e dashboard centralizado para o projeto [meu-nas](https://github.com/didizera/meu-nas).

## 🚀 Funcionalidades Atuais

- **Monitoramento de Hardware:** Visualização em tempo real de CPU, RAM (Uso/Total), Uptime e Temperatura do processador via integração com a **Glances API (v4)**.
- **Status de Serviços:** Check de disponibilidade (online/offline) em tempo real de todos os serviços Docker rodando no NAS (Jellyfin, Navidrome, Immich, etc).
- **Integração Seerr:** Pesquisa e solicitação de filmes e séries diretamente do app.
- **Integração Lidarr:** Pesquisa e solicitação de Artistas e Albúms diretamente do app..
- **Módulos de Acesso Rápido:** Atalhos dinâmicos para Immich, Jellyfin, Navidrome, qBittorrent e Nextcloud.

## 🎨 Design System (TUI Aesthetic)

O aplicativo utiliza uma identidade visual única inspirada em interfaces de terminal clássicas (Text User Interface):

- **Typography:** Uso exclusivo de `JetBrains Mono` para todos os elementos textuais.
- **Terminal Prompt:** Campos de entrada e títulos utilizam o prompt `> ` em `Terminal Green`.
- **ASCII Progress Bars:** Representação visual de recursos de hardware usando caracteres `#` com gradientes dinâmicos.
- **Color Palette:** Fundo escuro profundo (`#0F0F0F`) com cores vibrantes para sinalização de serviços e estados.
- **Global Theme:** Centralização de tokens de design em `lib/core/theme/` para consistência absoluta.

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** e **SOLID**:

- **Presentation:** Gerenciamento de estado com **BLoC/Cubit**. Widgets modulares e reutilizáveis (ex: `TuiProgressBar`, `TuiInputField`).
- **Domain:** Entidades puras e casos de uso de negócio (ex: `GetHardwareInfoUseCase`).
- **Data:** Implementações de repositórios, data sources (Dio para APIs) e persistência local (Shared Preferences).
- **DI:** Injeção de dependência centralizada com **GetIt**.

## 🛠️ Tecnologias

- **Framework:** Flutter 3.29.x
- **Linguagem:** Dart (Interface padronizada em **Inglês**)
- **State Management:** Flutter BLoC
- **API Client:** Dio
- **Backend Monitoring:** [Glances](https://nicolargo.github.io/glances/)
- **Geradores de Código:** Freezed, JsonSerializable
- **Design:** Google Fonts (JetBrains Mono)

## 🛠️ Requisitos do Servidor (NAS)

Para o monitoramento de hardware, o NAS deve estar rodando o **Glances** em modo Web Server:
- **Serviço:** `glances -w` rodando via `systemd`.
- **API:** Disponível na porta `61208` (Endpoint: `/api/4/all`).
- **Dependências:** `python-fastapi` e `uvicorn` (necessários para o modo Web no Arch Linux).

## 📱 Screenshots (Em Breve)

---
*Desenvolvido por [didizera](https://github.com/didizera)*
