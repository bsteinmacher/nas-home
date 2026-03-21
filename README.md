# 🏠 Nas-Home App

Interface de gerenciamento e dashboard centralizado para o projeto [meu-nas](https://github.com/didizera/meu-nas). Desenvolvido em **Flutter** para Android, focado em simplicidade, velocidade e estética "Terminal/TUI".

## 🚀 Funcionalidades Atuais

- **Monitoramento de Hardware:** Visualização em tempo real de CPU, Memória e Temperatura (Host: Lenovo E73).
- **Status de Serviços:** Check de disponibilidade (online/offline) de todos os serviços Docker rodando no NAS.
- **Integração Jellyseerr:** Pesquisa e solicitação de filmes e séries diretamente do app.
- **Integração Navidrome:** Navegação pela biblioteca de música (Artistas, Álbuns).
- **Módulos de Acesso Rápido:** Atalhos dinâmicos para Immich, Jellyseerr, Navidrome, qBittorrent e Nextcloud.

## 🏗️ Arquitetura

O projeto segue os princípios da **Clean Architecture** e **SOLID**:

- **Presentation:** Gerenciamento de estado com **BLoC/Cubit**. Widgets modulares e reutilizáveis.
- **Domain:** Entidades puras e casos de uso de negócio.
- **Data:** Implementações de repositórios, data sources (Dio para APIs) e persistência local (Shared Preferences).
- **DI:** Injeção de dependência centralizada com **GetIt**.

## 🛠️ Tecnologias

- **Framework:** Flutter 3.29.x
- **Linguagem:** Dart
- **State Management:** Flutter BLoC
- **API Client:** Dio
- **Geradores de Código:** Freezed, JsonSerializable
- **Design:** Google Fonts (JetBrains Mono) para estética TUI.

## 📱 Screenshots (Em Breve)

---
*Desenvolvido por [didizera](https://github.com/didizera)*
