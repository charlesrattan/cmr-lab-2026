# CMR Lab Evolution

## Purpose

This document records the evolution of CMR Lab from an informal home technology environment into a structured enterprise-style infrastructure simulation platform.

The objective is to preserve not only what was built but also how the project evolved, why key decisions were made and what lessons were learned along the way.

This document provides the historical context behind the current architecture, operational model and project direction.

---

# The Starting Point

CMR Lab did not begin as a planned infrastructure project.

It began as a collection of useful technology deployed over time to solve practical problems, support family needs and explore new technologies.

The environment included:

* Linksys router
* UniFi access point
* Ubuntu Server running on a MacBook Pro
* Raspberry Pi devices
* Multiple laptops and desktops
* Various networking equipment

The environment was functional but largely undocumented and dependent on individual devices.

At this stage there was little separation between:

* Home use
* Learning
* Experimentation
* Infrastructure

---

# Phase 0 - Informal Home Technology Environment

### Characteristics

* Wi-Fi-dependent infrastructure
* Mixed hardware platforms
* Limited documentation
* Manual administration
* Services tied to individual machines
* No centralized DNS
* No formal backup strategy
* No defined architecture

### Key Lesson

Useful technology is not necessarily maintainable technology.

---

# Phase 1 - Hardware Recovery and Rebuild

The first major decision was to stop expanding the existing environment and instead understand what hardware already existed.

Rather than purchasing new equipment immediately, available hardware was inspected, tested and documented.

The Dell OptiPlex 7010 SFF emerged as the strongest platform and ultimately became the foundation of the rebuilt lab.

### Key Outcomes

* Hardware inventory established
* Hardware validation process created
* Dell OptiPlex 7010 SFF selected
* Wired infrastructure became a priority
* GitHub adopted as the documentation platform

### Why It Mattered

This phase established the principle that infrastructure decisions should be evidence-based rather than assumption-based.

### Key Lesson

Validation should come before architecture.

---

# Phase 2 - Virtualization Foundation

The next major transition was moving away from individual physical systems toward a virtualized platform.

Proxmox was selected as the primary infrastructure platform and deployed on the validated OptiPlex server.

### Key Outcomes

* `cmr-srv-01` deployed
* Proxmox established as the core platform
* VM100 created for management and automation
* VM110 created for network management
* VM120 created for application services
* Backup capability introduced

### Why It Mattered

Workloads became separated by responsibility rather than by physical device.

This was the point where the environment began to resemble enterprise infrastructure rather than a traditional homelab.

### Key Lesson

Separation of responsibilities improves reliability and maintainability.

---

# Phase 3 - Services Platform

With the virtualization platform established, attention shifted to application services.

VM120 became the dedicated Docker services platform.

### Key Outcomes

* Docker Compose adopted
* Homepage deployed
* Portainer deployed
* Uptime Kuma deployed
* Vaultwarden deployed
* Nginx Proxy Manager deployed

### Why It Mattered

Services became portable, reproducible and easier to manage.

Docker Compose also introduced infrastructure patterns commonly used in professional environments.

### Key Lesson

Standardization simplifies operations.

---

# Phase 4 - Automation and Operations

As the number of systems increased, manual administration became less desirable.

VM100 was established as the management and automation platform.

### Key Outcomes

* Ansible deployed
* Passwordless SSH implemented
* Health-check automation introduced
* Service validation routines established

### Why It Mattered

The project began shifting from infrastructure deployment toward infrastructure operations.

### Open Issue

The `update-all.yml` workflow still requires refinement to fully support privileged operations.

### Key Lesson

Operating infrastructure is often more challenging than deploying it.

---

# Phase 5 - Internal DNS and Service Discovery

As services expanded, remembering IP addresses and ports became increasingly impractical.

Centralized DNS became necessary.

### Key Outcomes

* AdGuard Home deployed
* Internal DNS platform established
* `cmrlab.internal` adopted
* DNS rewrites implemented
* Internal service names standardized
* Nginx Proxy Manager integrated with DNS naming

### Why It Mattered

Service discovery became independent of IP addressing.

The environment became easier to understand and operate.

### Key Lesson

Naming is infrastructure.

---

# Major Inflection Points

Several decisions fundamentally changed the direction of the project.

| Decision                           | Impact                                         |
| ---------------------------------- | ---------------------------------------------- |
| Adoption of GitHub documentation   | Created a permanent project record             |
| Selection of the OptiPlex 7010     | Established a stable infrastructure foundation |
| Deployment of Proxmox              | Enabled workload separation and scalability    |
| Creation of VM100, VM110 and VM120 | Introduced clear service ownership             |
| Adoption of Docker Compose         | Improved repeatability and recoverability      |
| Deployment of AdGuard Home         | Introduced centralized service discovery       |
| Adoption of `cmrlab.internal`      | Established a consistent naming strategy       |
| Operations before expansion        | Shifted focus from building to operating       |

---

# Current Phase - Operations and Governance

CMR Lab has now entered an Operations and Governance phase.

The objective is no longer rapid service deployment.

The objective is to understand, document, secure, monitor, automate and operate the environment in a professional manner.

### Current Focus

* Documentation quality
* Operational procedures
* Backup validation
* Recovery planning
* Service reliability
* Automation maturity
* Controlled service expansion

### Why It Matters

This phase aligns the project more closely with real-world infrastructure operations and professional ICT practices.

---

# Evolution of the Mission

The mission of the project has evolved significantly.

| Stage                | Primary Goal                 |
| -------------------- | ---------------------------- |
| Initial Environment  | Make technology useful       |
| Rebuild Phase        | Stabilize infrastructure     |
| Virtualization Phase | Modernize the platform       |
| Services Phase       | Deliver practical services   |
| Automation Phase     | Reduce manual administration |
| DNS Phase            | Simplify service discovery   |
| Current Phase        | Improve operational maturity |

The project has evolved from a homelab into an enterprise infrastructure simulation platform.

---

# Current Mission

CMR Lab is an enterprise infrastructure simulation platform used to develop practical skills in:

* Systems administration
* Networking
* Cybersecurity
* Automation
* Documentation
* Governance
* Operations

The environment also supports selected personal and family services where those services contribute to reliability, usefulness and practical learning.

---

# Lessons Learned

Several recurring themes emerged throughout the project:

* Stability should come before complexity.
* Documentation should distinguish between historical plans and current state.
* Infrastructure decisions should be evidence-based.
* Service names should be managed through DNS rather than bookmarks or hosts files.
* Snapshots should be taken before significant changes.
* Recoverability is more important than feature count.
* Operational discipline creates long-term value.
* A homelab becomes more useful when operated like a real environment.

---

# Looking Ahead

The next stage of the project is not defined by additional services.

It is defined by improving maturity.

Future growth should focus on:

* Better operations
* Better automation
* Better recovery procedures
* Better documentation
* Better security

The goal is not to build the largest homelab possible.

The goal is to build an environment that is understandable, maintainable, recoverable and professionally operated.

---

# Review History

| Date       | Reviewer       | Notes                                      |
| ---------- | -------------- | ------------------------------------------ |
| 2026-06-11 | Charles Rattan | Initial evolution document created         |
| 2026-06-11 | Charles Rattan | Expanded into historical project narrative |
