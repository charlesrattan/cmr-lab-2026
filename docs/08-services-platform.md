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
| Homepage | http://dashboard.cmrlab.local | Working |
| Uptime Kuma | http://kuma.cmrlab.local | Working |
| Portainer | https://10.146.91.230:9443 | Working |
| Nginx Proxy Manager | http://10.146.91.230:81 | Working |
| Vaultwarden | http://vault.cmrlab.local | Installed, not production-ready |

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

## Known Issues

| Issue | Current Status |
|---|---|
| Portainer reverse proxy access hangs | Direct access is used for now |
| Vaultwarden requires HTTPS | Pending Tailscale/MagicDNS/HTTPS strategy |
| Docker services are currently deployed with `docker run` | Future improvement: convert to Docker Compose |

---

## Notes

- Vaultwarden should not be used for real credentials until HTTPS is implemented.
- Tailscale has been selected as the preferred remote access and naming strategy.