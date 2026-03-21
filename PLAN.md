# 🏠 Plano de Implementação: Nas-Home App (Flutter)

Este plano descreve a criação de um aplicativo Android em Flutter para atuar como a homepage e interface de gerenciamento do projeto `meu-nas`.

## 🎯 Objetivos
- Centralizar o acesso aos serviços do NAS (AdGuard, NPM, Jellyfin, etc.).
- Interface customizada para pedidos de Filmes/Séries (via Jellyseerr API).
- Interface customizada para navegação/pedidos de Música (via Navidrome/Subsonic API).
- Dashboard de status dos serviços.
- Arquitetura escalável para novos serviços.

## 📂 Contexto do Projeto
- **Local do Projeto:** `/home/didizera/dev/nas-home`
- **Referência do NAS:** `/home/didizera/meu-nas` (Serviços Docker)

## 🛠️ Ambiente de Desenvolvimento
- **Flutter SDK:** `3.29.0` (Stable) em `/home/didizera/dev/flutter`
- **Dart SDK:** `3.7.0`
- **Path:** Configurado no `~/.zshrc`
- **Target:** Android (API Level a definir)

## 🏗️ Arquitetura Proposta
Utilizaremos **Clean Architecture** para garantir testabilidade e escalabilidade:
- **Data Layer:** Repositórios e Data Sources para APIs (Jellyseerr, Navidrome).
- **Domain Layer:** Entidades e Casos de Uso (ex: `RequestMediaUseCase`, `GetServiceStatusUseCase`).
- **Presentation Layer:** BLoC para gerenciamento de estado e Widgets (Material 3).

## 🚀 Passos de Implementação

### 1. Inicialização do Projeto
- [ ] Criar o projeto Flutter no diretório alvo.
- [ ] Configurar dependências iniciais (`dio`, `flutter_bloc`, `get_it`, `freezed`, `json_serializable`).
- [ ] Configurar o Android Manifest para permissões de rede.

### 2. Infraestrutura e Configuração
- [ ] Implementar armazenamento local (ex: `shared_preferences` ou `hive`) para salvar:
    - IP/Domínio base do NAS.
    - API Keys (Jellyseerr, Navidrome).
- [ ] Criar serviço de verificação de status (ping HTTP) para os serviços Docker listados no `meu-nas/README.md`.

### 3. Integração Jellyseerr (Mídia)
- [ ] Mapear endpoints da Jellyseerr API (Busca, Trending, Solicitar).
- [ ] Criar tela de "Pedidos de Mídia" com barra de busca e posters (grid).
- [ ] Implementar fluxo de solicitação (Radarr/Sonarr via Jellyseerr).

### 4. Integração Navidrome (Música)
- [ ] Mapear API Subsonic (compatível com Navidrome).
- [ ] Criar tela de navegação por Artistas/Álbuns.
- [ ] Implementar funcionalidade de "pedir" (pode ser integração futura com Lidarr ou apenas navegação).

### 5. Dashboard Principal
- [ ] Grid dinâmico de cartões para cada serviço.
- [ ] Indicador visual de status (On/Off).
- [ ] Atalhos para abrir as Web UIs originais no navegador externo ou WebView interna.

## 🧪 Verificação e Testes
- [ ] Testes unitários para os mapeadores de API.
- [ ] Testes de integração com os serviços rodando localmente (se possível).
- [ ] Validação da interface em diferentes tamanhos de tela (Android).

## 🛠️ Próximos Passos (Imediatos)
1. Executar `flutter create nas_home` no diretório `/home/didizera/dev/nas-home`.
2. Definir a estrutura de pastas inicial.
3. Criar a tela de configurações para conectar ao NAS.
