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

Management, Docker, Backup, and Automation Baseline Complete

### Current Core Systems

| System | Hostname | IP Address | Role | Status |
|---|---|---:|---|---|
| Proxmox Host | cmr-srv-01 | 10.146.91.13 | Virtualization host | Operational |
| VM100 | ubuntu-mgmt-01 | 10.146.91.99 | Management and automation | Operational |
| VM110 | unifi-controller-01 | 10.146.91.172 | UniFi Network Controller | Operational |
| VM120 | docker-services-01 | 10.146.91.230 | Docker services platform | Operational |

### Current Services

| Service | Platform | Purpose | Status |
|---|---|---|---|
| UniFi Network Application | VM110 | Wireless network management | Operational |
| Docker Compose | VM120 | Container orchestration baseline | Operational |
| Homepage | VM120 | Lab dashboard | Operational |
| Portainer | VM120 | Docker management | Operational |
| Uptime Kuma | VM120 | Basic monitoring | Operational |
| Vaultwarden | VM120 | Password manager | Working, HTTPS pending |
| Nginx Proxy Manager | VM120 | Reverse proxy | Operational |
| Tailscale | VM100 / VM120 / devices | Remote access | Operational |
| Ansible | VM100 | Lab automation | Started |

### Current Priorities

1. Complete Git documentation update.
2. Complete Ansible health check and update playbooks.
3. Deploy AdGuard Home on VM100 for internal DNS.
4. Resolve Vaultwarden HTTPS.
5. Deploy Jellyfin on VM120.

---

Phase 2: Service Platform Stabilization

The core Proxmox, UniFi, Docker, backup, and management foundation is operational. VM100 now acts as the management and automation platform, VM110 remains dedicated to UniFi, and VM120 hosts Docker-based services.

---

### Current Focus

- Completing Git documentation updates
- Building Ansible health check and update playbooks
- Deploying AdGuard Home for internal DNS
- Resolving Vaultwarden HTTPS
- Planning Jellyfin deployment on VM120
- Documenting backup and restore procedures

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
