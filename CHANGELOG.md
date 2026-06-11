# CMR Lab 2026 Changelog

This document records significant infrastructure, operational, architectural and documentation changes made within CMR Lab.

Entries are recorded chronologically and are intended to provide a historical record of the evolution of the environment.

Superseded decisions and intermediate implementation steps may remain documented here even if later replaced by newer approaches.


## 2026-06-11 - Documentation Refactor and Operations Phase Alignment

### Added

- Added `09-operations-runbook.md`.
- Added `10-lab-evolution.md`.
- Expanded repository governance documentation.
- Documented operational procedures for routine administration.
- Documented historical evolution of the lab from informal home technology environment to enterprise-style infrastructure simulation platform.

### Changed

- Refactored repository documentation to distinguish between:

  - Historical information
  - Current operational state
  - Future plans
- Updated lab charter to reflect the Operations and Governance phase.
- Updated architecture documentation to separate original, current and target architectures.
- Updated maturity assessment to reflect current operational reality.
- Updated roadmap to focus on operational maturity before service expansion.
- Updated decision log to function as an Architecture Decision Record (ADR) register.
- Updated services documentation to function as an operational service catalog.
- Updated hardware validation documentation into a historical validation record.

### Project Impact

- Repository transitioned from homelab build documentation to infrastructure operations documentation.
- Documentation now reflects the current mission of the lab.
- Repository structure aligned with portfolio and operational objectives.

### Current Phase

Operations and Governance


## 2026-06-11 - Internal DNS and Service Discovery Baseline

### Added
- Installed AdGuard Home on VM100 `ubuntu-mgmt-01`.
- Migrated DNS port 53 from `systemd-resolved` stub listener to AdGuard Home.
- Configured Quad9 DNS-over-HTTPS upstream: `https://dns10.quad9.net/dns-query`.
- Created internal DNS namespace: `cmrlab.internal`.
- Added DNS rewrites for core lab services.
- Integrated Nginx Proxy Manager with the new `.internal` namespace.
- Updated Homepage allowed hosts to include `dashboard.cmrlab.internal`.
- Validated internal service access from Windows workstation.
- Created Proxmox snapshots for VM100 and VM120 after successful DNS and proxy validation.

### Validated URLs
- `http://dashboard.cmrlab.internal`
- `http://vault.cmrlab.internal`
- `http://kuma.cmrlab.internal`
- `https://portainer.cmrlab.internal`
- `http://adguard.cmrlab.internal`
- `https://unifi.cmrlab.internal:8443`
- `https://proxmox.cmrlab.internal:8006`

### Known Issues
- HTTPS certificates are not yet implemented for internal services.
- Vaultwarden currently works over HTTP through NPM.
- `update-all.yml` sudo/become issue remains unresolved.

## 2026-06-10 - Management, Docker, Backup, and Automation Baseline

### Ansible Health Check

Implemented health-check.yml on VM100.

Current checks:
- Connectivity
- Hostname
- IP Address
- Uptime
- Disk Usage
- Memory Usage
- Reboot Requirement
- UniFi Service Status
- Docker Service Status

Location:
scripts/ansible/health-check.yml

### Added
- Established VM100 `ubuntu-mgmt-01` as the CMR Lab Management & Automation Platform.
- Installed and validated Tailscale, Git, Ansible, and QEMU Guest Agent on VM100.
- Configured passwordless SSH from VM100 to VM110 and VM120.
- Created Ansible inventory for management, network, and services VMs.
- Validated Ansible connectivity across VM100, VM110, and VM120.
- Consolidated Docker services on VM120 under `/home/charles/docker/docker-compose.yml`.
- Confirmed Homepage, Portainer, Uptime Kuma, Vaultwarden, and Nginx Proxy Manager as active Docker services.
- Created Docker backup archive `docker-backup-20260610.tar.gz`.
- Validated Proxmox backup of VM120 to `hdd-storage`.
- Configured weekly scheduled Proxmox backups for VM110 and VM120.

### Changed
- Reclassified VM100 from general infrastructure VM to management and automation control plane.
- Confirmed VM110 is reserved for UniFi Network Application only.
- Confirmed VM120 is the Docker services platform for hosted applications.

### Known Issues
- Vaultwarden works but still requires HTTPS resolution.
- Internal DNS remains incomplete; AdGuard Home is planned for VM100.
- Ansible update playbook exists but is not fully operational across all VMs due to differing sudo credentials.

### VM120 Docker Services Platform

- Created VM120 `docker-services-01`.
- Assigned VM120 IP address `10.146.91.230`.
- Installed Docker Engine.
- Added user `charles` to the Docker group.
- Deployed Portainer CE for Docker management.
- Deployed Homepage as the CMR Lab operations dashboard.
- Resolved Homepage host validation using `HOMEPAGE_ALLOWED_HOSTS`.
- Deployed Uptime Kuma for service monitoring.
- Added initial service monitors for Homepage, Portainer, Proxmox and UniFi.
- Deployed Vaultwarden as a future password manager.
- Confirmed Vaultwarden container health.
- Identified Vaultwarden HTTPS requirement before production use.
- Deployed Nginx Proxy Manager.
- Created initial `.cmrlab.local` proxy host entries.
- Configured temporary Windows hosts file mappings for lab service names.
- Updated Homepage dashboard links and bookmarks.

### Current Working Access

- Homepage: `http://dashboard.cmrlab.local`
- Uptime Kuma: `http://kuma.cmrlab.local`
- Portainer: `https://10.146.91.230:9443`
- Nginx Proxy Manager: `http://10.146.91.230:81`

### Known Issues

- Portainer reverse proxy access is not finalized; direct access is currently used.
- Vaultwarden is installed but should not be used for real credentials until HTTPS is implemented.
- Docker services are currently deployed with `docker run`; Docker Compose conversion is planned.

## 2026-06-07

### UniFi Controller Migration

- Created VM110 `unifi-controller-01` using Ubuntu Server 24.04.
- Installed Java 21, MongoDB, and UniFi Network Application.
- Resolved MongoDB startup failure by changing VM110 CPU type from `x86-64-v2-AES` to `host`.
- Confirmed UniFi Network Application loaded successfully at `https://10.146.91.172:8443`.
- Recreated existing WiFi SSIDs on the new controller.
- Migrated UniFi AC Pro from the Dell Micro controller to VM110.
- Confirmed AP adoption into VM110.
- Enabled automatic startup for VM100 and VM110 after Proxmox host reboot.

### Operational Notes

- Old Dell Micro UniFi controller was removed after AP migration.
- VM110 is now the active UniFi Network Controller for CMR Lab.

## 2026-06-06

### Proxmox Deployment

- Installed Proxmox VE 9.2.2 on `cmr-srv-01`.
- Installed Proxmox on the PNY 500GB SATA SSD.
- Confirmed Proxmox web UI access at `https://10.146.91.13:8006`.
- Confirmed node hostname as `cmr-srv-01`.
- Confirmed 19.42 GiB memory detected by Proxmox.
- Confirmed Intel Core i7-3770 with 8 logical CPUs.
- Confirmed EFI boot mode.
- Converted server to headless operation.
- Configured no-subscription repositories.
- Enabled automatic recovery after power loss.

### Storage

- Confirmed PNY 500GB SATA SSD detected and passed SMART.
- Confirmed WDC WD1002FBYS 1TB HDD detected and passed SMART.
- Identified 1TB HDD still contains existing NTFS partition and will be repurposed later.
- Added 1TB HDD as hdd-storage.
- Configured secondary storage repository.
- Established SSD/HDD storage separation.

### Repository Configuration

- Disabled Proxmox enterprise repository.
- Added Proxmox no-subscription repository.
- Disabled Ceph enterprise repository.
- Successfully completed `apt update`.
- Completed update/reboot validation and confirmed Proxmox web UI returned successfully.

### Virtualization

- Uploaded Ubuntu Server ISO.
- Created VM100 (ubuntu-mgmt-01).
- Configured:
  - 2 vCPU
  - 4GB RAM
  - 50GB SSD-backed disk
- Installed Ubuntu Server.
- Installed OpenSSH Server.
- Installed and enabled QEMU Guest Agent.
- Created snapshot: Fresh Ubuntu Install.

### UniFi Infrastructure

- Recovered UniFi Cloud Key Gen1.
- Factory reset and upgraded Cloud Key firmware.
- Confirmed UniFi controller operational.
- Confirmed AP reachable at 10.146.91.153.
- Determined AP is adopted by existing controller on main workstation.
- Evaluated migration of network management to Proxmox-hosted controller.

### Project Impact

- `cmr-srv-01` is now operational as the primary CMR Lab hypervisor.
- CMR Lab 2026 has moved from hardware validation to virtualization platform setup.

## 2026-06-05

### Infrastructure

- Completed dedicated CAT6 cable run to bedroom lab area.
- Terminated and tested cable successfully.
- Brought TP-Link TL-SF1008P online as temporary lab utility switch.
- Connected Dell Micro main PC, UniFi Cloud Key, UniFi Security Gateway and Dell OptiPlex server to wired lab switch.

### Server Build

- Completed Dell OptiPlex 7010 SFF server build.
- Confirmed Intel Core i7-3770 processor.
- Confirmed 20 GB DDR3 RAM.
- Identified one faulty DIMM slot.
- Confirmed 500 GB SSD.
- Added 1 TB HDD.
- Designated system as primary Proxmox server candidate.

### Project Impact

- CMR Lab 2026 moved from hardware discovery into implementation readiness.
- Next major milestone is Proxmox installation.