# CMR Lab Operations Runbook

## Purpose

This document will become the operational guide for running, maintaining, troubleshooting and recovering CMR Lab.

It is intentionally separate from the architecture and roadmap documents.

---

## Daily / Routine Checks

### Run Ansible Health Check

From VM100:
cd ~/ansible
ansible-playbook -i inventory.ini health-check.yml

---

### Current checks include:
- Host reachability
- IP address
- Uptime
- Disk usage
- Memory usage
- Reboot required status
- UniFi service status
- Docker service status

### Core Service Access
| Service |	URL|
| --- | --- |
| Proxmox |	https://proxmox.cmrlab.internal:8006 |
| UniFi |	https://unifi.cmrlab.internal:8443 |
| Dashboard |	http://dashboard.cmrlab.internal |
| Vaultwarden |	http://vault.cmrlab.internal |
| Uptime Kuma |	http://kuma.cmrlab.internal |
| Portainer |	https://portainer.cmrlab.internal |
| AdGuard |	http://adguard.cmrlab.internal |

### Known Issues
| Issue | Status |	Notes |
| --- | --- | --- |
| Vaultwarden HTTPS |	Pending |	Currently works over HTTP through NPM |
| Ansible update playbook sudo/become	| Pending |	Health check works; privileged update workflow needs fixing |
| Full network DNS rollout | Pending |	AdGuard is validated but not yet deployed as DNS for all home devices |

