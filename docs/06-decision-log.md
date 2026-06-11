# CMR Lab 2026 - Decision Log

## Purpose

This document records significant architectural, operational and governance decisions made during the development of CMR Lab.

The objective is to capture not only what decisions were made but why they were made and how they influenced the evolution of the environment.

This document serves as a lightweight Architecture Decision Record (ADR) register.

---

# Decision Register

| Date       | Decision                                                                        | Reason                                                                                           | Outcome  |
| ---------- | ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------- |
| 2026-06-03 | Use GitHub as the source of truth for lab documentation                         | Provides version control, portability and professional documentation practices                   | Accepted |
| 2026-06-03 | Use VS Code as the primary editor                                               | Supports Markdown, Git integration, scripting and future infrastructure-as-code work             | Accepted |
| 2026-06-03 | Use Git for version control                                                     | Encourages professional workflow habits and preserves documentation history                      | Accepted |
| 2026-06-03 | Require evidence-based architecture decisions                                   | Hardware and platforms must be validated before receiving permanent roles                        | Accepted |
| 2026-06-04 | Designate the recovered Dell OptiPlex 7010 SFF as the primary Proxmox candidate | Hardware validation confirmed suitability for virtualization workloads                           | Accepted |
| 2026-06-05 | Transition from hardware validation to Proxmox deployment                       | Core hardware platform successfully validated                                                    | Accepted |
| 2026-06-06 | Deploy Proxmox VE on `cmr-srv-01`                                               | Provides virtualization, workload separation and future scalability                              | Accepted |
| 2026-06-06 | Use Proxmox as the primary infrastructure platform                              | Legacy controller hardware no longer aligned with long-term goals                                | Accepted |
| 2026-06-07 | Host UniFi Network Application on VM110                                         | Separates network management from workstation platforms                                          | Accepted |
| 2026-06-07 | Use CPU type `host` for VM110                                                   | Required to resolve MongoDB compatibility issues                                                 | Accepted |
| 2026-06-07 | Create VM120 as the dedicated Docker services platform                          | Provides workload separation and operational clarity                                             | Accepted |
| 2026-06-07 | Use Homepage as the operations dashboard                                        | Provides centralized visibility of infrastructure and services                                   | Accepted |
| 2026-06-07 | Use Uptime Kuma for initial monitoring                                          | Lightweight monitoring provided immediate operational visibility                                 | Accepted |
| 2026-06-07 | Deploy Nginx Proxy Manager                                                      | Simplifies internal service routing and reverse proxy management                                 | Accepted |
| 2026-06-07 | Keep CMR Enterprise infrastructure separate from homelab infrastructure         | Reduces operational risk and prevents dependency between environments                            | Accepted |
| 2026-06-07 | Use Tailscale as the preferred remote access platform                           | Secure access without exposing services to the public internet                                   | Accepted |
| 2026-06-07 | Defer OPNsense implementation                                                   | Service stability and documentation were higher priorities than network redesign                 | Accepted |
| 2026-06-10 | Establish VM100 as the management and automation platform                       | Creates a dedicated control plane for management functions                                       | Accepted |
| 2026-06-10 | Keep VM110 dedicated to UniFi services                                          | Protects network management stability                                                            | Accepted |
| 2026-06-10 | Use VM120 as the application services platform                                  | Separates user services from management and network control functions                            | Accepted |
| 2026-06-10 | Use Docker Compose as the source of truth for container deployment              | Reduces configuration drift and improves recoverability                                          | Accepted |
| 2026-06-10 | Configure weekly Proxmox backups                                                | Establishes baseline recovery capability                                                         | Accepted |
| 2026-06-11 | Deploy AdGuard Home on VM100                                                    | Centralizes DNS management and service discovery                                                 | Accepted |
| 2026-06-11 | Adopt `cmrlab.internal` as the internal namespace                               | Avoids conflicts associated with `.local` and multicast DNS                                      | Accepted |
| 2026-06-11 | Use Nginx Proxy Manager as the standard internal service access layer           | Simplifies service discovery and improves usability                                              | Accepted |
| 2026-06-11 | Create post-deployment recovery snapshots                                       | Establishes rollback points before future infrastructure changes                                 | Accepted |
| 2026-06-11 | Prioritize operational maturity before service expansion                        | Stability, documentation and recoverability provide more value than additional services          | Accepted |
| 2026-06-11 | Treat the lab as an enterprise infrastructure simulation platform               | Aligns the project with professional development, governance and operational learning objectives | Accepted |
| 2026-06-11 | Treat documentation as a deliverable rather than a by-product                   | Documentation quality directly supports maintainability, recovery and portfolio value            | Accepted |

---

# Key Architectural Themes

The following themes have consistently influenced decision-making throughout the project:

* Stability before complexity
* Documentation before expansion
* Recovery before experimentation
* Separation of responsibilities
* Evidence-based decisions
* Operational maturity before feature growth
* Infrastructure that can be rebuilt and understood

---

# Current Decision Status

All major architectural decisions listed in this register remain active and continue to guide the development of CMR Lab.

Future decisions should be recorded whenever they materially affect:

* Architecture
* Security
* Operations
* Service ownership
* Governance
* Infrastructure direction

---

# Review History

| Date       | Reviewer       | Notes                                                          |
| ---------- | -------------- | -------------------------------------------------------------- |
| 2026-06-03 | Charles Rattan | Initial decision register created                              |
| 2026-06-11 | Charles Rattan | Refactored into an Architecture Decision Record style register |
