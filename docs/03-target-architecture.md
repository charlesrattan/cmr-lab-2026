# CMR Lab 2026 - Architecture

## Purpose

This document describes the architectural evolution, current implemented architecture and future architectural direction of CMR Lab.

The objective is to preserve the project's history while clearly documenting the environment that exists today.

## Architecture Principles

The architecture of CMR Lab is guided by the following principles:

* Stability before complexity
* Separation of responsibilities
* Documentation before expansion
* Recovery before experimentation
* Automation where it improves reliability
* Infrastructure that can be understood, maintained and rebuilt

---

# Original Architecture Direction

The original rebuild effort was intended to move away from an unstable, Wi-Fi-dependent environment toward a structured and documented infrastructure platform.

At the beginning of the project the environment consisted of:

* ISP router
* Linksys EA4500 router
* UniFi AC Pro access point
* Ubuntu Server running on a MacBook Pro
* Several unused or partially tested devices
* Limited documentation
* No centralized DNS
* No workload separation
* Minimal operational procedures

The initial goal was to establish a stable foundation before introducing additional services.

---

# Current Implemented Architecture

## Physical Infrastructure

```text
Internet
    |
ISP Router
    |
Linksys EA4500
    |
Lab Network
    |
+-- UniFi AC Pro
|
+-- Dell OptiPlex Micro
|
+-- Dell OptiPlex 7010 SFF
|
+-- Raspberry Pi 3
|
+-- Utility Devices
```

### Physical Systems

| System                 | Purpose                     |
| ---------------------- | --------------------------- |
| Linksys EA4500         | Gateway, routing and DHCP   |
| UniFi AC Pro           | Wireless networking         |
| Dell OptiPlex 7010 SFF | Proxmox virtualization host |
| Dell OptiPlex Micro    | Primary workstation         |
| Raspberry Pi 3         | Homebridge platform         |

---

## Virtual Infrastructure

```text
cmr-srv-01
|
+-- VM100 - ubuntu-mgmt-01
|
+-- VM110 - unifi-controller-01
|
+-- VM120 - docker-services-01
```

### VM Ownership Model

| VM    | Role                           |
| ----- | ------------------------------ |
| VM100 | Management, automation and DNS |
| VM110 | Network management             |
| VM120 | Application services           |

---

## Service Architecture

### VM100 - Management Platform

| Service      | Purpose                                    |
| ------------ | ------------------------------------------ |
| AdGuard Home | Internal DNS and service discovery         |
| Ansible      | Automation and health checks               |
| Git          | Documentation and configuration management |
| Tailscale    | Secure remote access                       |

---

### VM110 - Network Platform

| Service                   | Purpose                            |
| ------------------------- | ---------------------------------- |
| UniFi Network Application | Wireless infrastructure management |

---

### VM120 - Application Platform

| Service             | Purpose                           |
| ------------------- | --------------------------------- |
| Docker Engine       | Container runtime                 |
| Homepage            | Service dashboard                 |
| Portainer           | Container management              |
| Uptime Kuma         | Monitoring                        |
| Vaultwarden         | Password management               |
| Nginx Proxy Manager | Reverse proxy and service routing |

---

# Internal DNS Architecture

CMR Lab uses AdGuard Home on VM100 as the authoritative internal DNS platform.

### DNS Platform

| Component          | Value                  |
| ------------------ | ---------------------- |
| DNS Server         | AdGuard Home           |
| Host               | VM100 - ubuntu-mgmt-01 |
| IP Address         | 10.146.91.99           |
| Upstream DNS       | Quad9 DNS-over-HTTPS   |
| Internal Namespace | cmrlab.internal        |

The previous `.local` naming convention is being retired because `.local` is reserved for multicast DNS and may conflict with service discovery systems.

### Service Catalog

| Service      | DNS Name                  |
| ------------ | ------------------------- |
| Proxmox      | proxmox.cmrlab.internal   |
| UniFi        | unifi.cmrlab.internal     |
| Dashboard    | dashboard.cmrlab.internal |
| Vaultwarden  | vault.cmrlab.internal     |
| Uptime Kuma  | kuma.cmrlab.internal      |
| Portainer    | portainer.cmrlab.internal |
| AdGuard Home | adguard.cmrlab.internal   |

---

# Operational Architecture

The current architecture follows a layered model.

```text
Physical Infrastructure
        |
Virtualization Layer
        |
Management Layer
        |
Network Management Layer
        |
Application Services Layer
```

### Layer Responsibilities

| Layer                   | Responsibility                        |
| ----------------------- | ------------------------------------- |
| Physical Infrastructure | Hardware, networking and connectivity |
| Virtualization          | Proxmox platform                      |
| Management              | DNS, automation and remote access     |
| Network Management      | UniFi management                      |
| Application Services    | User-facing services                  |

---

# Future Architectural Direction

The next stage of development focuses on operational maturity rather than rapid service expansion.

## Near-Term Priorities

* Complete documentation refactor
* Expand the operations runbook
* Resolve Ansible privileged update workflow
* Implement HTTPS for internal services
* Validate backup and restore procedures
* Review home network DNS strategy

## Future Service Candidates

Potential future services include:

* Jellyfin
* Home Assistant
* Grafana
* Prometheus
* Wazuh
* Local AI experimentation

These services should only be introduced when the current platform remains documented, recoverable and stable.

---

## Current Architecture Status

Status: Operational

Current Phase: Operations and Governance

The platform has established a stable virtualization, automation, monitoring, DNS and service management baseline. Future development should prioritize operational maturity before introducing significant new complexity.
