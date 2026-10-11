# CMR Lab Asset Register

## Overview

CMR Lab is a self-hosted engineering environment built around repurposed computers, managed networking equipment and virtualised workloads. Its infrastructure supports practical work in systems administration, networking, observability, home automation and cybersecurity.

The lab uses two complementary virtualisation environments: a three-node Proxmox VE cluster for infrastructure and service workloads, and a separate Hyper-V environment for controlled cybersecurity experiments.

This register describes the equipment and deployed workloads that define the current lab. The [baseline inventory](00-baseline-inventory.md) documents the starting hardware, while the [architecture](03-architecture.md) explains how the design has evolved.

## Network infrastructure

| Equipment | Model or platform | Function |
| --- | --- | --- |
| Network gateway | Linksys EA4500 | Household routing and DHCP |
| Wireless access point | UniFi AC Pro | Wireless connectivity, managed through the UniFi Network Application |
| Managed switch | Netgear GS516TP | Gigabit Ethernet switching and network monitoring integration |
| Primary DNS host | Raspberry Pi 3 | Internal DNS resolution and filtering with AdGuard Home |
| Remote-access host | Raspberry Pi 3 | Tailscale-based access to authorised lab resources |

The DNS design also uses a secondary resolver hosted on the virtualisation platform. The remote-access service runs independently of the primary virtualisation host, keeping the remote management path separate from that host's availability.

## Physical compute systems

| System | Hardware | Platform | Primary responsibility |
| --- | --- | --- | --- |
| Core virtualisation host | Dell OptiPlex 7010 SFF | Proxmox VE | Infrastructure management, network management and containerised applications |
| Operations node | Lenovo ThinkPad T440p | Proxmox VE | Monitoring and home automation |
| Security monitoring node | Lenovo ThinkPad T450 | Proxmox VE | Centralised security event collection and analysis |
| Engineering workstation | Dell OptiPlex 3070 Micro, Intel Core i5-8500T, 32 GB RAM | Windows 11 and Hyper-V | Day-to-day administration and a separate cybersecurity test environment |

The three Proxmox systems operate as a cluster, although workloads are assigned according to the resources available on each machine. The Hyper-V cyber-range was placed on the workstation to make practical use of spare capacity rather than overload the original security-focused laptops.

## Virtual infrastructure

### Proxmox workloads

| Workload | Primary role | Implementation |
| --- | --- | --- |
| Management VM | Infrastructure utilities, automation and secondary DNS | Deployed |
| Network controller VM | UniFi Network Application | Actively manages the wireless access point |
| Docker services VM | Containerised applications and internal services | Operational |
| Monitoring VM | Prometheus, Grafana and supporting monitoring components | Metrics collection and dashboards implemented |
| Home automation VM | Home Assistant | In daily household use |
| Security monitoring VM | Wazuh | Security telemetry collection and analysis |

### Hyper-V cyber-range

| Workload | Primary role |
| --- | --- |
| Windows domain controller | Active Directory, DNS and Windows security experimentation |
| Windows client | Domain-connected endpoint and security telemetry |
| Kali Linux | Authorised testing and experimentation |
| Restricted gateway | Controlled connectivity for the isolated test network |

The cyber-range infrastructure and initial monitoring integrations are established. Structured attack, observation, hardening and repeat-testing exercises are the next stage of the project.

## Verified Proxmox guest assignments

VM IDs identify virtual machines in Proxmox; they are not addresses. This is the functional distribution established through the 2026 build history.

| Proxmox host | VM ID | Workload | Responsibility |
| --- | ---: | --- | --- |
| Core OptiPlex | 100 | `ubuntu-mgmt-01` | Utilities, Ansible and secondary DNS |
| Core OptiPlex | 110 | `unifi-controller-01` | UniFi Network Application |
| Core OptiPlex | 120 | `docker-services-01` | Containerised application platform |
| Lenovo T440p / SOC1 | 130 | `monitoring-01` | Prometheus and Grafana |
| Lenovo T440p / SOC1 | 140 | `home-assistant-01` | Household automation |
| Lenovo T450 / SOC2 | 150 | `wazuh01` | Security events and analysis |

SOC1's VM130 and VM140 were observed running after a controlled node restart on 30 August. The node's network uplink was later changed to a validated external Gigabit adapter after the built-in interface negotiated at approximately 10 Mb/s.

## Application and services platform

The Docker environment hosts a range of self-hosted applications. Principal lab services are grouped below by purpose rather than by their administration endpoints.

| Category | Applications and technologies |
| --- | --- |
| Administration | Homepage, Portainer and Nginx Proxy Manager |
| Availability and metrics | Uptime Kuma and cAdvisor |
| Password management | Vaultwarden |
| Media and library services | Jellyfin, Calibre-Web, Jellyseerr, Sonarr, Radarr, Prowlarr and qBittorrent |
| Home and utility applications | Minecraft Bedrock server and Stirling PDF |
| Technical documentation | MkDocs with Material for MkDocs |

The monitoring environment is complemented by host metrics, Proxmox monitoring and SNMP-based network-device observations. Internal HTTPS is supported by a private certificate authority for selected services.

## Equipment lifecycle and development

The project has evolved from a single-host service environment into a small distributed laboratory. Equipment is reused or reassigned where it offers practical value, and proposals are kept distinct from deployed infrastructure.

A UniFi gateway is under consideration as a future replacement for the current router. The previously tested UniFi Security Gateway is not part of the active gateway architecture.

## Related documentation

- [Baseline Inventory](00-baseline-inventory.md) — equipment available at the start of the project
- [Architecture](03-architecture.md) — the design and responsibilities of the major platforms
- [Hardware Validation](07-hardware-validation.md) — original hardware evaluation and validation work
- [Services Platform](08-services-platform.md) — application and container deployment details
- [Lab Evolution](09-lab-evolution.md) — how the environment has developed
