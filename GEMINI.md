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
- Data Root: `~/meu-nas/data`
- Media Root: `~/meu-nas/data/media`
  - Music: `~/meu-nas/data/media/music`
  - Movies: `~/meu-nas/data/media/movies`
  - TV: `~/meu-nas/data/media/tv`
  - Photos (Immich): `~/meu-nas/data/media/photos`
- Downloads: `~/meu-nas/data/downloads`

## Services (Docker Stack: media)
- Music: Lidarr (Port 8686), Navidrome (Port 4533)
- Video: Jellyfin (Port 8096), Seerr (Port 5055)
- Management: Radarr (7878), Sonarr (8989), Bazarr (6767), Prowlarr (9696), Recyclarr
- Downloads/Automation: qBittorrent (8080), autobrr (7474), FlareSolverr (8191)
- Optimization: Tdarr (8265/8266)
- Photos: Immich (2283)
- Database: Postgres (Immich), Redis (Immich)

## Critical API Keys / Secrets
- Lidarr: `4540e053d6c1496ba99a0ecd32a6f455`
- Prowlarr: `0aea3885b6314515b3479588e3401db6`
- Seerr: `MTc3MzE2MTE0MTU0N2I3NmI3YTc0LThiYmEtNGZiOC1iYjk3LWEyYzEzM2VlMDNiYg==`

## Networking
- Docker Network: `proxynet` (external)
- Internal DNS: Services use container names (e.g., `http://lidarr:8686`)
- **CRITICAL RULE:** For internal service-to-service communication (e.g., Seerr -> Sonarr), ALWAYS use the container name (e.g., `sonarr`) instead of the `.home` domain.

## Local Domain Mapping (NPM)
| Local Domain | Internal Service | Port |
| :--- | :--- | :--- |
| `adguard.home` | `adguardhome` | 80 |
| `bazarr.home` | `bazarr` | 6767 |
| `immich.home` | `immich` | 2283 |
| `jellyfin.home` | `jellyfin` | 8096 |
| `lidarr.home` | `lidarr` | 8686 |
| `navidrome.home` | `navidrome` | 4533 |
| `prowlarr.home` | `prowlarr` | 9696 |
| `radarr.home` | `radarr` | 7878 |
| `seerr.home` | `seerr` | 5055 |
| `sonarr.home` | `sonarr` | 8989 |
| `tdarr.home` | `tdarr` | 8265 |
| `torrent.home` | `qbittorrent` | 8080 |
| `vaultwarden.home` | `vaultwarden` | 80 |

## Specific Configurations
- FlareSolverr: Configured globally in Prowlarr. Each indexer (Lidarr/Radarr/Sonarr) must select 'FlareSolverr' in the Proxy field. No specific tags required.
- Hardlinks: Supported across `/data` (mount point for both downloads and media).
