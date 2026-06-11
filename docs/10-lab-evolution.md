# CMR Lab Evolution

## Purpose

This document records the evolution of CMR Lab from an informal home technology setup into a structured enterprise-style infrastructure simulation platform.

The purpose is to preserve the journey, including early assumptions, design changes, lessons learned and major milestones.

---

## Phase 0 - Starting Point

CMR Lab began as a practical home technology environment with several existing devices, including a Linksys router, UniFi access point, older laptops, Raspberry Pi devices and a MacBook Pro running Ubuntu Server.

At this stage, the lab was useful but informal. Services and devices existed, but there was limited standardization, limited documentation and no clear separation between experimentation, home use and professional learning.

### Characteristics

- Wi-Fi-dependent infrastructure
- Mixed hardware
- Limited documentation
- Manual administration
- Services tied to individual machines
- No centralized DNS
- No formal backup or recovery strategy

---

## Phase 1 - Hardware Recovery and Rebuild

The first major shift was the decision to rebuild the lab around available hardware rather than continue expanding the existing informal setup.

The Dell OptiPlex 7010 SFF was recovered, tested, upgraded, and selected as the primary server platform.

### Key Outcomes

- Dell OptiPlex 7010 SFF validated
- Proxmox selected as virtualization platform
- Lab moved away from the MacBook as primary server
- Wired connectivity became a priority
- GitHub adopted for documentation and change tracking

---

## Phase 2 - Virtualization Foundation

The lab moved from individual physical devices to a virtualized architecture using Proxmox.

### Key Outcomes

- `cmr-srv-01` deployed as the primary Proxmox host
- VM100 created for management and automation
- VM110 created for UniFi Network Application
- VM120 created for Docker services
- VM autostart configured
- Proxmox backups introduced

---

## Phase 3 - Core Services Platform

VM120 became the main services platform using Docker and Docker Compose.

### Key Outcomes

- Docker services consolidated under Docker Compose
- Homepage deployed as the lab dashboard
- Portainer deployed for Docker management
- Uptime Kuma deployed for monitoring
- Vaultwarden deployed for password management
- Nginx Proxy Manager deployed for reverse proxy learning and service routing

---

## Phase 4 - Automation and Operations

VM100 became the lab management and automation platform.

### Key Outcomes

- Ansible installed on VM100
- Passwordless SSH configured from VM100 to VM110 and VM120
- Ansible inventory created
- Health check playbook created and tested
- Basic service checks added for UniFi and Docker

### Open Issue

The `update-all.yml` playbook exists but privileged execution still requires further work due to sudo/become handling.

---

## Phase 5 - Internal DNS and Service Discovery

The lab moved from IP-based access and `.local` hostnames to centralized DNS using AdGuard Home.

### Key Outcomes

- AdGuard Home deployed on VM100
- `cmrlab.internal` adopted as the internal namespace
- `.local` naming retired due to mDNS conflicts
- DNS rewrites created for core lab services
- Nginx Proxy Manager updated for `.internal` service names
- Windows client validation completed

---

## Current Phase - Operations and Governance

CMR Lab is now entering an operations and governance phase.

The priority is no longer simply adding services. The priority is understanding, documenting, stabilizing, monitoring, backing up and operating the lab in a professional way.

### Current Focus

- Documentation cleanup
- Operations runbook creation
- Backup and restore validation
- Ansible update automation
- HTTPS strategy
- Controlled future service expansion

---

## Current Mission

CMR Lab is now an enterprise infrastructure simulation platform used to develop practical skills in systems administration, networking, cybersecurity, automation, documentation, governance and operations.

It also supports selected personal and family services where those services contribute to reliability, usefulness and practical learning.

---

## Lessons Learned

- Stability should come before complexity.
- Documentation must distinguish between historical plans and current state.
- Service names should be managed through DNS, not browser bookmarks or hosts files.
- Infrastructure changes should be snapshotted and documented.
- A homelab becomes more valuable when it is operated like a real environment.
