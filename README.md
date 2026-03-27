# 🏠 Nas-Home App

Interface de gerenciamento e dashboard centralizado para o projeto [meu-nas](https://github.com/didizera/meu-nas). Desenvolvido em **Flutter** para Android, focado em simplicidade, velocidade e estética "Terminal/TUI".

## 🚀 Funcionalidades Atuais

- **Monitoramento de Hardware:** Visualização em tempo real de CPU, RAM (Uso/Total), Uptime e Temperatura do processador via integração com a **Glances API (v4)**.
- **Status de Serviços:** Check de disponibilidade (online/offline) em tempo real de todos os serviços Docker rodando no NAS (Jellyfin, Navidrome, Immich, etc).
- **Integração Jellyseerr:** Pesquisa e solicitação de filmes e séries diretamente do app.
- **Integração Navidrome:** Navegação pela biblioteca de música (Artistas, Álbuns).
- **Módulos de Acesso Rápido:** Atalhos dinâmicos para Immich, Jellyseerr, Navidrome, qBittorrent e Nextcloud.

## 🛠️ Requisitos do Servidor (NAS)

Para o monitoramento de hardware, o NAS deve estar rodando o **Glances** em modo Web Server:
- **Serviço:** `glances -w` rodando via `systemd`.
- **API:** Disponível na porta `61208` (Endpoint: `/api/4/all`).
- **Dependências:** `python-fastapi` e `uvicorn` (necessários para o modo Web no Arch Linux).

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** e **SOLID**:

- **Presentation:** Gerenciamento de estado com **BLoC/Cubit**. Widgets modulares e reutilizáveis com estética baseada em TUI (Text User Interface).
- **Domain:** Entidades puras e casos de uso de negócio (ex: `GetHardwareInfoUseCase`).
- **Data:** Implementações de repositórios, data sources (Dio para APIs) e persistência local (Shared Preferences para salvar a URL do NAS).
- **DI:** Injeção de dependência centralizada com **GetIt**.

## 🛠️ Tecnologias

- **Framework:** Flutter 3.29.x
- **Linguagem:** Dart
- **State Management:** Flutter BLoC
- **API Client:** Dio (utilizado para monitoramento e integração com serviços)
- **Backend Monitoring:** [Glances](https://nicolargo.github.io/glances/)
- **Geradores de Código:** Freezed, JsonSerializable
- **Design:** Google Fonts (JetBrains Mono) para estética TUI.

## 📱 Screenshots (Em Breve)

---
*Desenvolvido por [didizera](https://github.com/didizera)*
