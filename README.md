# CMR Lab 2026

## Purpose

CMR Lab 2026 is my personal home laboratory for developing practical skills in:

- Systems administration
- Networking
- Cybersecurity
- ICT governance
- Automation
- Infrastructure documentation
- Self-hosted services

The lab is being built from the ground up with an emphasis on documentation, repeatability, professional practices, and practical daily use.

---

## Current Status

Service Platform Build Phase

---

## Current Phase

Phase 2: Service Platform Stabilization

The core Proxmox and UniFi foundation is operational. VM120 has been introduced as the Docker services host for daily-use and management applications.

---

## Current Focus

- Stabilizing VM120 Docker services
- Building the Homepage operations dashboard
- Monitoring core services with Uptime Kuma
- Preparing Tailscale for secure remote access and MagicDNS
- Making Vaultwarden production-ready with HTTPS
- Documenting services, access methods, and known issues

---

## Current Core Infrastructure

| Component | Role | Status |
|---|---|---|
| Dell OptiPlex 7010 SFF | Primary Proxmox host | Operational |
| Proxmox VE | Virtualization platform | Operational |
| VM100 ubuntu-mgmt-01 | Management VM | Operational |
| VM110 unifi-controller-01 | UniFi Network Controller | Operational |
| VM120 docker-services-01 | Docker services host | Operational |
| UniFi AC Pro | Primary wireless access point | Operational |

---

## Current Services

| Service | Location | Status |
|---|---|---|
| UniFi Network Controller | VM110 | Operational |
| Docker Engine | VM120 | Operational |
| Portainer | VM120 | Operational |
| Homepage | VM120 | Operational |
| Uptime Kuma | VM120 | Operational |
| Nginx Proxy Manager | VM120 | Operational |
| Vaultwarden | VM120 | Installed, pending HTTPS readiness |

---

## Repository Structure

| File | Purpose |
|---|---|
| `docs/00-baseline-inventory.md` | Initial known hardware inventory |
| `docs/01-lab-charter.md` | Lab vision, objectives, principles, and success criteria |
| `docs/02-asset-register.md` | Authoritative asset and infrastructure register |
| `docs/03-target-architecture.md` | Current and target architecture |
| `docs/04-lab-maturity.md` | Maturity model and improvement tracking |
| `docs/05-roadmap.md` | Project roadmap and phased tasks |
| `docs/06-decision-log.md` | Architecture and implementation decisions |
| `docs/07-hardware-validation.md` | Hardware validation and test results |
| `docs/08-services-platform.md` | Docker services platform and application register |
| `docs/99-ideas-parking-lot.md` | Future ideas and non-current scope items |

---

## Owner

Charles Rattan
