# CMR Lab 2026 Roadmap

## Purpose

This roadmap separates completed milestones, current stabilization work and future expansion. It is intended to show the evolution of the project without confusing historical plans with current priorities.

## Project Goal

Redesign and rebuild the CMR home lab from the ground up using available hardware where practical, while creating professional documentation that can support learning, troubleshooting and portfolio development.

## Completed Milestones

| Phase | Milestone | Status |
|---|---|---|
| Phase 0 | Baseline inventory and project start | Complete |
| Phase 1 | Hardware recovery and OptiPlex validation | Complete |
| Phase 2 | Proxmox deployment on `cmr-srv-01` | Complete |
| Phase 3 | UniFi Controller migration to VM110 | Complete |
| Phase 4 | Docker services platform on VM120 | Complete |
| Phase 5 | Homepage, Portainer, Kuma, Vaultwarden, and NPM deployed | Complete |
| Phase 6 | VM100 established as management and automation platform | Complete |
| Phase 7 | AdGuard Home and `cmrlab.internal` DNS implemented | Complete |

## Current Phase - Operations and Governance

The lab is now in an operations and governance phase.

The current focus is to make the lab easier to understand, maintain, recover, and explain.

### Current Priorities

| Priority | Task | Status |
|---:|---|---|
| 1 | Refactor documentation to separate history, current state and future plans | In Progress |
| 2 | Create operations runbook | Pending |
| 3 | Resolve Ansible sudo/become issue in `update-all.yml` | Pending |
| 4 | Define Vaultwarden HTTPS strategy | Pending |
| 5 | Validate backup and restore procedures | Pending |
| 6 | Decide whether AdGuard becomes the default DNS server for the full home network | Pending |

## Future Expansion

Future expansion should only occur after the operations and governance phase is stable.

Potential future services:

- Jellyfin
- Home Assistant
- Grafana and Prometheus
- Wazuh
- Local AI experimentation
- VLANs and firewall improvements