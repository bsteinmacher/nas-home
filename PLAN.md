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

## 🏗️ Arquitetura Implementada
Utilizamos **Clean Architecture** para garantir testabilidade e escalabilidade:
- **Data Layer:** Repositórios e Data Sources para APIs (Jellyseerr, Navidrome, Status Check).
- **Domain Layer:** Entidades e Casos de Uso (ex: `RequestMediaUseCase`, `GetServicesStatusUseCase`).
- **Presentation Layer:** Gerenciamento de estado com **BLoC** e Widgets Material 3.
- **Injeção de Dependência:** Centralizada via **GetIt**.

---

## ✅ O que já foi feito (Concluído)

### 1. Inicialização e Infraestrutura
- [x] Criação do projeto Flutter (`nas_home`).
- [x] Configuração de dependências (`dio`, `flutter_bloc`, `get_it`, `freezed`, `shared_preferences`, `crypto`).
- [x] Configuração do Android Manifest (Permissões de rede).
- [x] Definição da estrutura de pastas Clean Architecture.
- [x] Implementação do container de Injeção de Dependência (`injection_container.dart`).

### 2. Configurações e Persistência
- [x] Tela de **Configurações** implementada.
- [x] Persistência de dados (URL do NAS, API Keys de Jellyseerr, Credenciais Subsonic) usando `shared_preferences`.

### 3. Dashboard de Status
- [x] Mapeamento de 12 serviços baseados no `meu-nas/README.md`.
- [x] Lógica de "HTTP Ping" para verificar disponibilidade dos serviços.
- [x] Grid dinâmico na `HomePage` com indicadores visuais de Online/Offline e ícones personalizados.

### 4. Integração Jellyseerr (Mídia)
- [x] Mapeamento da API Jellyseerr (Search, Trending, Request).
- [x] Tela de **Pedidos de Mídia** com busca e exibição de posters via TMDB.
- [x] Fluxo de solicitação de filmes e séries implementado via `MediaBloc`.

### 5. Integração Navidrome (Música)
- [x] Mapeamento da API Subsonic (Compatível com Navidrome).
- [x] Navegação por **Artistas** e **Álbuns** implementada.
- [x] Lógica de autenticação Subsonic (Token/Salt MD5) funcionando.

---

## 📍 Onde estamos (Estado Atual)
- O "esqueleto" funcional e a infraestrutura de dados do aplicativo estão prontos.
- O app compila perfeitamente e passa em todas as análises estáticas (`flutter analyze`).
- As três vertentes principais (Status, Mídia, Música) possuem BLoCs e UIs básicas funcionando.

---

## 🚀 Para onde vamos (Próximos Passos)

### 1. Melhorias na Experiência de Música
- [ ] Implementar um **Audio Player** para ouvir as músicas diretamente pelo app.
- [ ] Adicionar suporte a playlists e busca de músicas.
- [ ] Melhorar o carregamento de capas de álbuns (cache e placeholders).

### 2. Navegação e Interação
- [ ] Adicionar navegação via **BottomNavigationBar** para alternar entre Dashboard, Mídia e Música.
- [ ] Implementar abertura dos serviços (ex: AdGuard Home, NPM) em uma **WebView interna** ou navegador externo.
- [ ] Detalhes da mídia (sinopse, elenco, trailer) ao clicar em um poster no Jellyseerr.

### 3. Refinamento Visual e UX
- [ ] Implementar tratamento de erros mais amigável (ex: diálogos de erro, estados de vazio).
- [ ] Refinar o tema Material 3 (cores dinâmicas baseadas no NAS).
- [ ] Adicionar animações de transição entre telas.

### 4. Testes e Estabilidade
- [ ] Escrever testes unitários para os Repositórios e BLoCs.
- [ ] Testar em dispositivos físicos para validar performance de rede.

---

## 🛠️ Ambiente de Referência
- **Flutter SDK:** `3.29.0` (Stable)
- **Dart SDK:** `3.7.0`
- **Status da Análise:** `No issues found!`
