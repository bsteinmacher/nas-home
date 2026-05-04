# NAS Environment Context

## Connectivity
- Remote Host Alias: `meunas`
- IP Address: `192.168.100.85`
- Access Method: `ssh meunas`
- Remote User: `didizera`
- OS: Arch Linux (Kernel 6.19+)

## File System (Remote)
- Base Path: `~/meu-nas`
- Docker Compose Root: `~/meu-nas/media`
- Archive Root: `~/meu-nas/archive` (Serviços inativos ou experimentais)
- Data Root: `~/meu-nas/data`
- Media Root: `~/meu-nas/data/media`
  - Music: `~/meu-nas/data/media/music`
  - Movies: `~/meu-nas/data/media/movies`
  - TV: `~/meu-nas/data/media/tv`
  - Photos (Immich): `~/meu-nas/data/media/photos`
- Tools Root: `~/meu-nas/tools`
- Downloads: `~/meu-nas/data/downloads`

## Services (Docker Stack)
### Core Stack (core)
- VPN: Headscale (Port 8080/8088) -> `https://mattewhisper3.dedyn.io`
- Password Manager: Vaultwarden (Port 80) -> `https://vault.mattewhisper3.dedyn.io`
- DNS: AdGuard Home (Port 53/3000)
- Proxy: Nginx Proxy Manager (Port 80/81/443)

### Media Stack (media)
- Music: Lidarr (Port 8686), Navidrome (Port 4533)
- Video: Jellyfin (Port 8096), Seerr (Port 5055)
- Management: Radarr (7878), Sonarr (8989), Bazarr (6767), Prowlarr (9696), Recyclarr
- Downloads/Automation: qBittorrent (8080), autobrr (7474), FlareSolverr (8191)
- Optimization: Tdarr (8265/8266)
- Photos: Immich (2283)
- Database: Postgres (Immich), Redis (Immich)

### Tools Stack (tools)
- Git: Forgejo (Web: 3001, SSH: 2222) -> `git.home`

### Inactive/Archived (archive)
- **Notas Técnicas:** O acesso remoto via 4G para os serviços exige que o celular esteja conectado à VPN (Headscale). O domínio DeSEC.io é usado para prover certificados HTTPS oficiais.

## Networking
- Docker Network: `proxynet` (external)
- Internal DNS: Services use container names (e.g., `http://lidarr:8686`)
- **CRITICAL RULE:** For internal service-to-service communication (e.g., Seerr -> Sonarr), ALWAYS use the container name (e.g., `sonarr`) instead of the `.home` domain.

## Local Domain Mapping (NPM)
| Local Domain | Internal Service | Port |
| :--- | :--- | :--- |
| `adguard.home` | `adguardhome` | 80 |
| `headscale.home` | `headscale` | 8080 |
| `mattewhisper3.dedyn.io` | `headscale` | 8080 |
| `vault.mattewhisper3.dedyn.io` | `vaultwarden` | 80 |
| `git.home` | `forgejo` | 3000 |
| `bazarr.home` | `bazarr` | 6767 |
| `immich.home` | `immich` | 2283 |
| `jellyfin.home` | `jellyfin` | 8096 |
| `seerr.home` | `seerr` | 5055 |
| `lidarr.home` | `lidarr` | 8686 |
| `navidrome.home` | `navidrome` | 4533 |
| `prowlarr.home` | `prowlarr` | 9696 |
| `radarr.home` | `radarr` | 7878 |
| `sonarr.home` | `sonarr` | 8989 |
| `tdarr.home` | `tdarr` | 8265 |
| `torrent.home` | `qbittorrent` | 8080 |
| `vaultwarden.home` | `vaultwarden` | 80 |

## Media Preferences
- **Audio (Lidarr):** Prioritize **FLAC** (Lossless). Navidrome handles on-the-fly transcoding for mobile/low-bandwidth.
- **Video (Radarr/Sonarr):** Prioritize **HEVC (x265)** for efficiency. 
  - Avoid **REMUX** (excessive file size). 
  - Focus on **1080p Bluray/WEB-DL** (range 5-10GB).
  - Preference for original language audio only.

## Specific Configurations
- FlareSolverr: Configured globally in Prowlarr. Each indexer (Lidarr/Radarr/Sonarr) must select 'FlareSolverr' in the Proxy field. No specific tags required.
- Hardlinks: Supported across `/data` (mount point for both downloads and media).
