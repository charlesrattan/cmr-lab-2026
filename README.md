# CMR Lab 2026

## Overview

CMR Lab 2026 is a documented journey from an informal home technology setup to a structured enterprise-style infrastructure simulation platform.

The project focuses on developing practical skills in infrastructure operations, networking, cybersecurity, automation, governance and documentation while applying the same principles used in professional ICT environments.

Rather than simply deploying services, the goal is to understand how infrastructure evolves, how decisions are made, how systems are documented and how operational maturity is achieved over time.

The lab also serves as:

* A learning platform for enterprise technologies
* A testing environment for infrastructure and operational practices
* A professional portfolio demonstrating practical ICT skills
* A platform for selected personal and family services

The full evolution of the project is documented in:

```text
docs/10-lab-evolution.md
```

---

# Purpose

CMR Lab exists to develop practical capability in:

* Systems Administration
* Networking
* Cybersecurity
* ICT Governance
* Automation
* Infrastructure Documentation
* Virtualization
* Service Management
* Monitoring and Operations
* Self-Hosted Services

The emphasis is on repeatability, documentation, operational discipline, and long-term maintainability rather than simply deploying technology.

---

# Current Status

## Operations and Stabilization Phase

CMR Lab has evolved from a basic homelab rebuild into an enterprise-style infrastructure simulation platform.

The current focus is no longer adding services rapidly. The focus is now:

* Stability
* Documentation
* Automation
* Monitoring
* Backup validation
* Recovery procedures
* Operational maturity

---

# Current Core Systems

| System       | Hostname            | Role                          | Status      |
| ------------ | ------------------- | ----------------------------- | ----------- |
| Proxmox Host | cmr-srv-01          | Virtualization platform       | Operational |
| VM100        | ubuntu-mgmt-01      | Management, automation, DNS   | Operational |
| VM110        | unifi-controller-01 | Network management            | Operational |
| VM120        | docker-services-01  | Application services platform | Operational |

---

# Current Services

| Service                   | Platform          | Purpose                            | Status                      |
| ------------------------- | ----------------- | ---------------------------------- | --------------------------- |
| AdGuard Home              | VM100             | Internal DNS and service discovery | Operational                 |
| Ansible                   | VM100             | Automation and health checks       | Operational                 |
| Tailscale                 | VM100 / endpoints | Secure remote access               | Operational                 |
| UniFi Network Application | VM110             | Wireless network management        | Operational                 |
| Docker Compose            | VM120             | Container orchestration            | Operational                 |
| Homepage                  | VM120             | Service dashboard                  | Operational                 |
| Portainer                 | VM120             | Docker management                  | Operational                 |
| Uptime Kuma               | VM120             | Monitoring                         | Operational                 |
| Vaultwarden               | VM120             | Password management                | Operational                 |
| Nginx Proxy Manager       | VM120             | Reverse proxy and service routing  | Operational                 |

---

# Current Priorities

1. Resolve the Ansible privileged update workflow.
2. Validate backup and restore procedures.
3. Deploy trust for the CMR Lab Root CA across all client devices.
4. Expand internal TLS coverage to core services.
5. Continue operational maturity improvements.
6. Monitor Vaultwarden adoption and validation period.

---

# Repository Structure

| File                           | Purpose                                           |
| ------------------------------ | ------------------------------------------------- |
| docs/00-baseline-inventory.md  | Original inventory and starting point             |
| docs/01-lab-charter.md         | Vision, mission, principles, and success criteria |
| docs/02-asset-register.md      | Infrastructure and asset register                 |
| docs/03-target-architecture.md | Architecture evolution and current design         |
| docs/04-lab-maturity.md        | Maturity assessment and tracking                  |
| docs/05-roadmap.md             | Completed milestones and future priorities        |
| docs/06-decision-log.md        | Key architecture and implementation decisions     |
| docs/07-hardware-validation.md | Hardware testing and validation results           |
| docs/08-services-platform.md   | Services platform documentation                   |
| docs/09-operations-runbook.md  | Operational procedures and maintenance            |
| docs/10-lab-evolution.md       | Project history and evolution                     |
| docs/99-ideas-parking-lot.md   | Future ideas and deferred concepts                |

---

# Project Evolution

The project has progressed through several major phases:

| Phase   | Focus                                        |
| ------- | -------------------------------------------- |
| Phase 0 | Informal home technology setup               |
| Phase 1 | Hardware recovery and rebuild                |
| Phase 2 | Proxmox virtualization foundation            |
| Phase 3 | Docker services platform                     |
| Phase 4 | Automation and operational health checks     |
| Phase 5 | Internal DNS and service discovery           |
| Phase 6 | Remote access, PKI and service consolidation |
| Phase 7 | Operations and governance (current phase)    |

The complete history of the project, including major decisions and lessons learned, is documented in:
docs/10-lab-evolution.md

---

# Guiding Principles

* Stability before complexity
* Documentation before expansion
* Recovery before experimentation
* Automation where it improves reliability
* Security as a requirement, not an afterthought
* Clear separation of system responsibilities
* Learn by building, but preserve what was learned

---

# Note

This repository currently serves as both an operational record and a learning portfolio.

As the project matures, operational documentation containing infrastructure-specific details may be separated from public-facing documentation intended for knowledge sharing, professional development and portfolio presentation.

---

# Owner

Charles Rattan
