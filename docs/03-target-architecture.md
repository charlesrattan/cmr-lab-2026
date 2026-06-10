# CMR Lab 2026 - Target Architecture

## Confirmed Architecture Direction

The CMR Lab rebuild will move away from the current unstable and Wi-Fi-dependent setup toward a more structured, wired and documented infrastructure.

### Current State

- ISP router provides internet access.
- Linksys router currently handles the main home/lab network.
- Ubuntu server currently runs on an old MacBook.
- Important devices are still dependent on Wi-Fi.
- Several unused hardware assets are available but not yet fully tested.

## Current Implemented Architecture

As of 2026-06-10, CMR Lab has an operational Proxmox, UniFi, Docker, backup, and management baseline.

```text
ISP Router
    |
Linksys EA4500
    |
Lab Switch
    |
Dell OptiPlex 7010 SFF - cmr-srv-01
    |
Proxmox VE
    |
    |-- VM100 - ubuntu-mgmt-01
    |       |-- Tailscale
    |       |-- Git
    |       |-- Ansible
    |       |-- Future DNS / monitoring
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

### Target State

- Replace the Linksys router with the UniFi Security Gateway.
- Use the UniFi Cloud Key to manage UniFi devices.
- Continue using the UniFi AC Pro access point for wireless access.
- Recover one Dell OptiPlex 7010 to become the primary lab server.
- Move core services away from the MacBook and onto the OptiPlex server.
- Wire important infrastructure devices where possible instead of relying on Wi-Fi.

| Device Type          | Naming Format | Example      |
| -------------------- | ------------- | ------------ |
| Gateway              | cmr-gw-##     | cmr-gw-01    |
| Access Point         | cmr-ap-##     | cmr-ap-01    |
| Server               | cmr-srv-##    | cmr-srv-01   |
| Admin Workstation    | cmr-admin-##  | cmr-admin-01 |
| Security Workstation | cmr-kali-##   | cmr-kali-01  |
| Raspberry Pi         | cmr-pi-##     | cmr-pi-01    |


### Target Network Layout

```text
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

Status: Draft