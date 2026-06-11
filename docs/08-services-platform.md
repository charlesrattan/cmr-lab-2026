# Services Platform

## Purpose

This document records the application services platform running on VM120 `docker-services-01`.

The purpose of this platform is to provide:

* Service hosting
* Container management
* Service monitoring
* Internal service routing
* Password management
* Operational visibility

This document serves as the operational service catalog for CMR Lab.

---

# Platform Host

| Attribute        | Value                    |
| ---------------- | ------------------------ |
| VM ID            | 120                      |
| Name             | docker-services-01       |
| IP Address       | 10.146.91.230            |
| Host             | cmr-srv-01               |
| Operating System | Ubuntu Server            |
| Role             | Docker services platform |
| Status           | Operational              |

---

# Platform Responsibilities

VM120 is responsible for hosting user-facing and operational services.

The platform does not host:

* Infrastructure management
* DNS services
* Network management

These functions are delegated to dedicated platforms elsewhere in the environment.

---

# Installed Platform Components

| Component           | Purpose                            | Status      |
| ------------------- | ---------------------------------- | ----------- |
| Docker Engine       | Container runtime                  | Operational |
| Portainer CE        | Container management               | Operational |
| Homepage            | Operations dashboard               | Operational |
| Uptime Kuma         | Monitoring and availability checks | Operational |
| Nginx Proxy Manager | Reverse proxy and service routing  | Operational |
| Vaultwarden         | Password management                | Operational |

---

# Active Containers

| Container           | Image                        | Purpose              |
| ------------------- | ---------------------------- | -------------------- |
| portainer           | portainer/portainer-ce       | Container management |
| homepage            | ghcr.io/gethomepage/homepage | Operations dashboard |
| uptime-kuma         | louislam/uptime-kuma         | Monitoring           |
| vaultwarden         | vaultwarden/server           | Password management  |
| nginx-proxy-manager | jc21/nginx-proxy-manager     | Reverse proxy        |

---

# Service Access Catalog

| Service                   | URL                                    | Status      |
| ------------------------- | -------------------------------------- | ----------- |
| Homepage                  | `http://dashboard.cmrlab.internal`     | Operational |
| Uptime Kuma               | `http://kuma.cmrlab.internal`          | Operational |
| Portainer                 | `https://portainer.cmrlab.internal`    | Operational |
| Vaultwarden               | `http://vault.cmrlab.internal`         | Operational |
| Nginx Proxy Manager       | `http://10.146.91.230:81`              | Operational |
| AdGuard Home              | `http://adguard.cmrlab.internal`       | Operational |
| UniFi Network Application | `https://unifi.cmrlab.internal:8443`   | Operational |
| Proxmox                   | `https://proxmox.cmrlab.internal:8006` | Operational |

---

# Internal Service Discovery

CMR Lab uses the `cmrlab.internal` namespace for internal service discovery.

### Service Records

| Hostname                  | Destination               |
| ------------------------- | ------------------------- |
| dashboard.cmrlab.internal | Homepage                  |
| vault.cmrlab.internal     | Vaultwarden               |
| kuma.cmrlab.internal      | Uptime Kuma               |
| portainer.cmrlab.internal | Portainer                 |
| adguard.cmrlab.internal   | AdGuard Home              |
| unifi.cmrlab.internal     | UniFi Network Application |
| proxmox.cmrlab.internal   | Proxmox                   |

---

# Reverse Proxy Configuration

Nginx Proxy Manager provides the standard service access layer.

### Configured Hosts

| Hostname                  | Destination  | Status      |
| ------------------------- | ------------ | ----------- |
| dashboard.cmrlab.internal | Homepage     | Operational |
| vault.cmrlab.internal     | Vaultwarden  | Operational |
| kuma.cmrlab.internal      | Uptime Kuma  | Operational |
| portainer.cmrlab.internal | Portainer    | Operational |
| adguard.cmrlab.internal   | AdGuard Home | Operational |

---

# Service Dependencies

| Service                 | Depends On                         |
| ----------------------- | ---------------------------------- |
| Homepage                | Docker Engine                      |
| Portainer               | Docker Engine                      |
| Uptime Kuma             | Docker Engine                      |
| Vaultwarden             | Docker Engine, Nginx Proxy Manager |
| Nginx Proxy Manager     | Docker Engine                      |
| Internal Service Access | AdGuard Home, Nginx Proxy Manager  |

---

# Docker Compose Management

All services are managed through Docker Compose.

### Source of Truth

```text
/home/charles/docker/docker-compose.yml
```

Manual container creation should be avoided to prevent configuration drift.

---

# Known Issues

| Issue                                        | Status             |
| -------------------------------------------- | ------------------ |
| Vaultwarden HTTPS implementation             | Pending            |
| Ansible-based container lifecycle management | Future enhancement |

---

# Operational Notes

* Homepage requires `dashboard.cmrlab.internal` to be included in `HOMEPAGE_ALLOWED_HOSTS`.
* Portainer reverse proxy access requires HTTPS to port `9443`.
* Vaultwarden should not be used for production credentials until HTTPS is implemented.
* Service access should use DNS names rather than direct IP addresses wherever possible.

---

# Current Platform Status

Status: Operational

The platform provides a stable application hosting environment and serves as the primary service delivery layer within CMR Lab.

Future services should only be introduced after they are documented, recoverable and aligned with the objectives of the lab.

---

# Review History

| Date       | Reviewer       | Notes                                           |
| ---------- | -------------- | ----------------------------------------------- |
| 2026-06-07 | Charles Rattan | Initial services platform documentation created |
| 2026-06-11 | Charles Rattan | Refactored into operational service catalog     |
