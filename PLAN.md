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

## 🛠️ Workflow de Desenvolvimento (MANDATO)
- **Git:** Realizar `git add`, `git commit` (com prefixos `feat:` ou `fix:`) e `git push` **obrigatoriamente** após a conclusão de cada parte/sub-tarefa.
- **Branch:** Trabalho direto na `main`.

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
- [x] **Fix:** Correção da porta do AdGuard Home para `8085`.

### 4. Integração Jellyseerr (Mídia)
- [x] Mapeamento da API Jellyseerr (Search, Trending, Request).
- [x] Tela de **Pedidos de Mídia** com busca e exibição de posters via TMDB.
- [x] Fluxo de solicitação de filmes e séries implementado via `MediaBloc`.

### 5. Integração Navidrome (Música)
- [x] Mapeamento da API Subsonic (Compatível com Navidrome).
- [x] Navegação por **Artistas** e **Álbuns** implementada.
- [x] Lógica de autenticação Subsonic (Token/Salt MD5) funcionando.

### 6. Ambiente de Desenvolvimento (Arch Linux)
- [x] Configuração do **Android SDK** (`/opt/android-sdk`) e `cmdline-tools`.
- [x] Instalação e configuração do **Java 17 (OpenJDK)** como padrão.
- [x] Configuração de permissões USB via `android-udev`.
- [x] Criação do `.vscode/launch.json` para execução via Cursor/VSCode.
- [x] Build e deploy realizado com sucesso no dispositivo físico **SM A736B**.

---

## 📍 Onde estamos (Estado Atual)
- O aplicativo está rodando no dispositivo físico em modo Debug.
- O ambiente de build (Arch Linux) está totalmente funcional com Java 17 e SDK 36.
- O Dashboard, Mídia e Música estão integrados e funcionais em nível de dados.

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
- **Java:** `OpenJDK 17.0.18`
- **Android SDK:** `36.1.0` (API 36)
- **Status da Análise:** `No issues found!`
