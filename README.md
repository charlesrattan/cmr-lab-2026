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

Operations and Stabilization Phase

CMR Lab has evolved from a basic homelab rebuild into an enterprise-style infrastructure simulation platform.

The current focus is no longer adding new services quickly. The focus is now stability, documentation, automation, monitoring, backup validation, and operational maturity.

### Current Core Systems

| System | Hostname | IP Address | Role | Status |
|---|---|---:|---|---|
| Proxmox Host | cmr-srv-01 | 10.146.91.13 | Virtualization host | Operational |
| VM100 | ubuntu-mgmt-01 | 10.146.91.99 | Management, automation, DNS | Operational |
| VM110 | unifi-controller-01 | 10.146.91.172 | UniFi Network Controller | Operational |
| VM120 | docker-services-01 | 10.146.91.230 | Docker services platform | Operational |

### Current Services

| Service | Platform | Purpose | Status |
|---|---|---|---|
| AdGuard Home | VM100 | Internal DNS and service discovery | Operational |
| Ansible | VM100 | Lab automation and health checks | Operational |
| Tailscale | VM100 / devices | Remote access | Operational |
| UniFi Network Application | VM110 | Wireless network management | Operational |
| Docker Compose | VM120 | Container orchestration baseline | Operational |
| Homepage | VM120 | Lab dashboard | Operational |
| Portainer | VM120 | Docker management | Operational |
| Uptime Kuma | VM120 | Basic monitoring | Operational |
| Vaultwarden | VM120 | Password manager | Working, HTTPS pending |
| Nginx Proxy Manager | VM120 | Reverse proxy | Operational |

### Current Priorities

1. Clean up and align documentation with the current lab state.
2. Create an operations runbook.
3. Resolve the Ansible sudo/become issue in `update-all.yml`.
4. Define the Vaultwarden HTTPS strategy.
5. Validate backup and restore procedures.
6. Decide whether AdGuard should become the default DNS server for the full home network.

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

## Project Evolution

The lab has evolved through several phases:

1. Informal home technology setup
2. Hardware recovery and rebuild
3. Proxmox virtualization foundation
4. Docker services platform
5. Automation and health checks
6. Internal DNS and service discovery
7. Current operations and governance phase

The full project history is documented in:
docs/10-lab-evolution.md

## Owner

Charles Rattan
