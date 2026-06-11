# CMR Lab 2026 - Architecture

## Purpose

This document separates the original architecture direction, the current implemented architecture and the future target architecture.

The goal is to preserve the evolution of CMR Lab while making the current operating state clear.

## Original Architecture Direction

The original rebuild direction was to move away from an unstable, Wi-Fi-dependent setup toward a more structured and documented home lab.

At that stage, the lab included:

- ISP router
- Linksys router
- UniFi AC Pro access point
- Ubuntu server running on an old MacBook
- Several unused or partially tested devices
- Limited documentation
- No centralized DNS
- No clear workload separation

This original direction remains important because it shows the starting point of the project.

## Current Implemented Architecture

As of June 2026, CMR Lab has an operational Proxmox, Docker, automation, monitoring, reverse proxy and internal DNS baseline.

ISP Router
    |
Linksys EA4500
    |
Lab Network
    |
Dell OptiPlex 7010 SFF - cmr-srv-01
    |
Proxmox VE
    |
    |-- VM100 - ubuntu-mgmt-01
    |       |-- Tailscale
    |       |-- Git
    |       |-- Ansible
    |       |-- AdGuard Home
    |
    |-- VM110 - unifi-controller-01
    |       |-- UniFi Network Application
    |
    |-- VM120 - docker-services-01
            |-- Docker Compose
            |-- Homepage
            |-- Portainer
            |-- Uptime Kuma
            |-- Vaultwarden
            |-- Nginx Proxy Manager

## Future Target Architecture

The future architecture should focus on operational maturity before additional service expansion.

### Near-Term Priorities

- Complete documentation refactor
- Create operations runbook
- Resolve Ansible privileged update workflow
- Define HTTPS strategy for internal services
- Validate backup and restore procedures
- Decide whether AdGuard becomes the default DNS server for the full home network

### Future Services

Future services may include:

- Jellyfin
- Home Assistant
- Grafana
- Prometheus
- Wazuh
- Local AI experimentation

These should only be added after the current platform is documented, recoverable and stable.


### Target Network Layout


ISP Router
    |
UniFi Security Gateway
    |
Switch
    |
    +-- UniFi AC Pro
    +-- OptiPlex Server
    +-- Admin PC
    +-- Future Lab Devices

## Vision

Create a documented, secure, and scalable home laboratory supporting:

- Family services
- ICT learning
- Cybersecurity testing
- AI experimentation
- Systems administration
- Network engineering
- Portfolio development

## Future Core Infrastructure

### Networking

- OPNsense Firewall
- Managed Switch
- UniFi Wireless

### Compute

- Primary Proxmox Server
- Utility Nodes
- Security Testing Platform

### Services

- Jellyfin
- Ollama
- Grafana
- Homebridge
- Monitoring
- VPN

### Security

- Network Segmentation
- Firewall Rules
- MFA
- Backups
- Vulnerability Management

## Internal DNS Architecture

CMR Lab now uses AdGuard Home on VM100 `ubuntu-mgmt-01` as the internal DNS platform.

| Component | Value |
|---|---|
| DNS Server | AdGuard Home |
| Host | VM100 `ubuntu-mgmt-01` |
| IP Address | `10.146.91.99` |
| Upstream DNS | Quad9 DNS-over-HTTPS |
| Upstream URL | `https://dns10.quad9.net/dns-query` |
| Internal Namespace | `cmrlab.internal` |

The previous `.local` naming approach is being retired because `.local` is reserved for multicast DNS and can conflict with Apple, Linux, Home Assistant, and service discovery systems.

### DNS Service Catalog

| Name | Target |
|---|---|
| `proxmox.cmrlab.internal` | `10.146.91.13` |
| `unifi.cmrlab.internal` | `10.146.91.172` |
| `dashboard.cmrlab.internal` | `10.146.91.230` |
| `vault.cmrlab.internal` | `10.146.91.230` |
| `kuma.cmrlab.internal` | `10.146.91.230` |
| `portainer.cmrlab.internal` | `10.146.91.230` |
| `adguard.cmrlab.internal` | `10.146.91.99` |

Status: Draft