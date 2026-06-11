# Services Platform

## Purpose

This document records the current CMR Lab services platform running on VM120.

The goal of this platform is to provide practical daily-use services, service monitoring, container management, and a foundation for future self-hosted applications.

---

## Platform Host

| Attribute | Value |
|---|---|
| VM ID | 120 |
| Name | docker-services-01 |
| IP Address | 10.146.91.230 |
| Host | cmr-srv-01 |
| OS | Ubuntu Server |
| Role | Docker services host |
| Status | Operational |

---

## Installed Platform Components

| Component | Purpose | Status |
|---|---|---|
| Docker Engine | Container runtime | Operational |
| Portainer CE | Docker web management | Operational |
| Homepage | Lab operations dashboard | Operational |
| Uptime Kuma | Service monitoring | Operational |
| Nginx Proxy Manager | Reverse proxy testing and future service routing | Operational |
| Vaultwarden | Password manager | Installed, pending HTTPS readiness |

---

## Active Containers

| Container | Image | Port Mapping | Persistent Data |
|---|---|---|---|
| portainer | portainer/portainer-ce:latest | 9443:9443, 9000:9000 | Docker volume: portainer_data |
| homepage | ghcr.io/gethomepage/homepage:latest | 3000:3000 | ~/docker/homepage/config |
| uptime-kuma | louislam/uptime-kuma:latest | 3001:3001 | ~/docker/uptime-kuma |
| vaultwarden | vaultwarden/server:latest | 8080:80 | ~/docker/vaultwarden |
| nginx-proxy-manager | jc21/nginx-proxy-manager:latest | 80:80, 81:81, 443:443 | ~/docker/nginx-proxy-manager |

---

## Current Access URLs

| Service | URL | Status |
|---|---|---|
| Homepage | `http://dashboard.cmrlab.internal` | Working |
| Uptime Kuma | `http://kuma.cmrlab.internal` | Working |
| Portainer | `https://portainer.cmrlab.internal` | Working |
| Nginx Proxy Manager | `http://10.146.91.230:81` | Working |
| Vaultwarden | `http://vault.cmrlab.internal` | Working, HTTPS pending |
| AdGuard Home | `http://adguard.cmrlab.internal` | Working |
| UniFi Network Application | `https://unifi.cmrlab.internal:8443` | Working |
| Proxmox | `https://proxmox.cmrlab.internal:8006` | Working |

---

## Temporary Hostname Mapping

The following `.cmrlab.local` names are currently mapped through the Windows hosts file on the Dell main PC.

| Hostname | Target |
|---|---|
| dashboard.cmrlab.local | 10.146.91.230 |
| kuma.cmrlab.local | 10.146.91.230 |
| portainer.cmrlab.local | 10.146.91.230 |
| vault.cmrlab.local | 10.146.91.230 |
| proxmox.cmrlab.local | 10.146.91.13 |
| unifi.cmrlab.local | 10.146.91.172 |

---

## Internal DNS and Service Discovery

AdGuard Home is deployed on VM100 `ubuntu-mgmt-01` and provides centralized DNS for CMR Lab.

| Item | Value |
|---|---|
| DNS Server | `10.146.91.99` |
| Web UI | `http://adguard.cmrlab.internal` |
| Upstream DNS | Quad9 DNS-over-HTTPS |
| Upstream URL | `https://dns10.quad9.net/dns-query` |
| Internal Domain | `cmrlab.internal` |

### DNS Rewrites

| Hostname | Target |
|---|---|
| `proxmox.cmrlab.internal` | `10.146.91.13` |
| `unifi.cmrlab.internal` | `10.146.91.172` |
| `dashboard.cmrlab.internal` | `10.146.91.230` |
| `vault.cmrlab.internal` | `10.146.91.230` |
| `kuma.cmrlab.internal` | `10.146.91.230` |
| `portainer.cmrlab.internal` | `10.146.91.230` |
| `adguard.cmrlab.internal` | `10.146.91.99` |

### Nginx Proxy Manager Hosts

| Hostname | Destination | Status |
|---|---|---|
| `dashboard.cmrlab.internal` | Homepage on VM120 | Working |
| `vault.cmrlab.internal` | Vaultwarden on VM120 | Working |
| `kuma.cmrlab.internal` | Uptime Kuma on VM120 | Working |
| `portainer.cmrlab.internal` | Portainer on VM120 | Working |
| `adguard.cmrlab.internal` | AdGuard Home on VM100 | Working |

### Notes
- Homepage required `dashboard.cmrlab.internal` to be added to `HOMEPAGE_ALLOWED_HOSTS`.
- Portainer requires HTTPS upstream to port `9443`.
- Vaultwarden HTTPS is still pending.
- Proxmox and UniFi are reachable using `.internal` names with their native ports.

---

## Docker Compose

Docker services are now managed through:
/home/charles/docker/docker-compose.yml

---

## Known Issues

| Issue | Current Status |
|---|---|
| Portainer reverse proxy access hangs | Direct access is used for now |
| Vaultwarden requires HTTPS | Pending Tailscale/MagicDNS/HTTPS strategy |
| Docker Compose baseline | Completed; `/home/charles/docker/docker-compose.yml` is now the source of truth |


---

## Notes

- Vaultwarden should not be used for real credentials until HTTPS is implemented.
- Tailscale has been selected as the preferred remote access and naming strategy.