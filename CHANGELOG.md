# CMR Lab Changelog

Significant changes are recorded newest first. Earlier entries remain historical evidence, not instructions for the current configuration. Date ranges are used where the exact completion day is not recorded.

## 2026-10-11 — Public documentation enrichment and runbook retirement

- Incorporated verified August–September build details into existing architecture, validation, decision, observability, incident and cyber-range records.
- Retired the privacy-reduced public operations runbook; sensitive operating procedures remain in the separate private handbook.
- Updated document links and retained a public, non-sensitive engineering history without creating additional documentation categories.

## 2026-10-11 — Documentation reconciliation and publication controls

- Reconciled the public Asset Register, Architecture, Services Platform and README with observed deployments.
- Renamed the architecture document to describe the implemented rather than a target design.
- Added a dated June–October evolution narrative and updated roadmap, decision records and incident summaries.
- Reviewed public documentation for operational details better held in restricted internal records.
- Separated the external engineering reference from the existing local MkDocs operational workspace.

## 2026-10 — Verified service and recovery inventory

- Verified the current Proxmox workload distribution and the active Docker application set.
- Confirmed ongoing network-utility configuration archives produced through an automated schedule.
- Reviewed backup practices and distinguished archive creation from restoration evidence.
- Continued to treat unfinished monitoring and cyber-range exercises as ongoing work rather than completed demonstrations.

## 2026-09-26 — Controlled cyber-range gateway

- Added a dual-homed Linux gateway design to the separate Hyper-V range.
- Kept connectivity between the experiment network and supporting services deliberately scoped; no household-network penetration path is implied.

## 2026-09-25 — Wazuh telemetry validation

- Confirmed Wazuh ingestion from the Kali testing machine.
- Failed local authentication attempts produced rules 5557 and 5503; the associated classification included MITRE T1110.001.
- Captured an observed event path, not evidence of exploitation or complete detection coverage.

## 2026-09-19 to 2026-09-24 — Hyper-V domain and endpoint

- Confirmed Windows domain controller promotion and lab DNS operation on 19 September.
- By 24 September, connectivity and port enumeration showed the controller presenting normal domain services, while the Windows client filtered a baseline TCP scan.
- Subsequent experiments added a controlled gateway and monitoring integration.

## 2026-09-12 to 2026-09-16 — Networking investigations

- USG WAN automatic addressing behaved inconsistently; static addressing temporarily restored service before a separate apparent hardware/power failure ended the trial on 14 September.
- SOC1's internal wired link negotiated at approximately 10 Mb/s. An RTL8153-family USB interface with the Linux r8152 driver restored a validated 1 Gb/s link.

## 2026-09 — Security monitoring, home automation and cyber-range

- Continued Home Assistant on SOC1 and established Wazuh event collection on SOC2; their workload placement followed available capacity and household requirements.
- Built a separate Hyper-V experiment range with Windows domain services, a Windows client, Kali and a controlled gateway; initial endpoint telemetry was observed.
- Validated the external Ethernet adapter after SOC1's link-negotiation problem.
- Ended exploratory gateway tests without replacing the active household router.

## 2026-08-29 to 2026-08-30 — SOC1 startup validation

- Verified VM130 (`monitoring-01`) and VM140 (`home-assistant-01`) on SOC1 with VM autostart enabled.
- Verified Proxmox node reboot, continuing cluster quorum and running guests.

## 2026-08-16 to 2026-08-18 — Monitoring deployment

- Prometheus, Node Exporter and Grafana active on VM130 by 16 August.
- Nine hosts monitored across the core host, SOC nodes, infrastructure VMs and Raspberry Pi utilities.
- Initial dashboards investigated cluster health, virtual machines, storage and backup coverage.
- AdGuard configuration synchronisation between primary and secondary resolvers configured for periodic execution.

## 2026-08-14 to 2026-08-15 — DNS parity and node recovery

- Secondary AdGuard returned successful public and internal DNS responses and matched primary resolver answers on internal tests.
- Backed up SOC2 node configuration, reinstalled the node and verified a three-node quorate cluster on 15 August.

## 2026-08-03 to 2026-08-04 — Proxmox cluster formation

- Built the Lenovo T440p/T450 Proxmox nodes; T450 installation required changing a VT-d firmware setting.
- Established the three-node cluster, checked host-level networking and administration and performed storage/SMART checks.

## 2026-08 — Dedicated network utilities

- Established primary AdGuard DNS on a Raspberry Pi alongside the management VM's secondary resolver.
- Implemented configuration synchronisation and observed DNS failover behaviour.
- Moved the principal Tailscale network utility function to a dedicated Raspberry Pi.
- Continued development of multi-node infrastructure and monitoring.

## 2026-07 — Internal documentation workspace

- Established a separate MkDocs Material workspace as a local engineering handbook.
- Retained the public GitHub repository as the version-controlled, reviewed engineering record.

## Earlier documented changes — June 2026

The following is the sanitised original June changelog. It preserves the sequence and implementation lessons while omitting live administrative addressing and environment-specific access paths.

## 2026-06-14 - Media Platform Validation and Incident Response

### Added

* Deployed Jellyfin media platform.
* Deployed qBittorrent, Sonarr, Radarr, Prowlarr and Jellyseerr.
* Integrated media services with Homepage.
* Added media services to Uptime Kuma monitoring.
* Added Nginx Proxy Manager proxy hosts for media services.
* Created dedicated media storage structure:

  * a media storage directory
  * a media storage directory
  * a media storage directory

### Changed

* Expanded VM120 root filesystem from approximately 18 GB to 37 GB.
* Applied bandwidth limits to qBittorrent to reduce household network impact.
* Validated Jellyseerr → Radarr → Prowlarr → qBittorrent workflow.

### Fixed

* Resolved Jellyfin startup failures caused by insufficient free space.
* Restored remote access functionality by correcting VM100 subnet router configuration.
* Enabled persistent IPv4 forwarding on ubuntu-mgmt-01.

### Incident Response

* Investigated overnight service disruptions affecting the entire lab.
* Identified Proxmox host network interface failure.
* Observed repeated Intel e1000e NETDEV WATCHDOG transmit queue timeout events.
* Confirmed outage was not caused by Jellyfin or Arr stack services.
* Restored connectivity through controlled Proxmox host reboot.

### Snapshots

Created:

* VM100 post_incident_2026_06_14
* VM110 post_incident_2026_06_14
* VM120 post_incident_2026_06_14

## 2026-06-12 - Stable Namespace, Internal PKI and Vaultwarden Production Use

### Added
- Enabled Tailscale subnet routing on VM100 `ubuntu-mgmt-01` for `the lab subnet`.
- Integrated AdGuard Home with Tailscale DNS clients.
- Standardized local and remote service access through `the former internal service namespace`.
- Enhanced Homepage with Docker integration and live container status.
- Added Homepage resource, search and datetime widgets.
- Created the CMR Lab internal Root Certificate Authority.
- Issued a TLS certificate for `the former internal service namespace`.
- Configured Vaultwarden HTTPS through Nginx Proxy Manager.
- Installed and validated Vaultwarden/Bitwarden clients on Chrome and iPhone.
- Imported passwords from Chrome Password Manager.
- Imported passwords from Apple Passwords.

### Changed
- Homepage service links were updated to use stable `the former internal service namespace` hostnames.
- Remote access now uses Tailscale subnet routing instead of service-specific Tailscale URLs.
- Vaultwarden moved from lab testing to active production use.

### Validated
- `the former internal service namespace` service access works locally and remotely.
- Vaultwarden HTTPS secure context warning is resolved.
- Chrome extension sync is working.
- iPhone Bitwarden app sync is working.
- Vaultwarden imports from Chrome and iPhone completed successfully.

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
- Created internal DNS namespace: `the former internal service namespace`.
- Added DNS rewrites for core lab services.
- Integrated Nginx Proxy Manager with the new `.internal` namespace.
- Updated Homepage allowed hosts to include `the former internal service namespace`.
- Validated internal service access from Windows workstation.
- Created Proxmox snapshots for VM100 and VM120 after successful DNS and proxy validation.

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
- Consolidated Docker services on VM120 under `a private Docker Compose manifest`.
- Confirmed Homepage, Portainer, Uptime Kuma, Vaultwarden, and Nginx Proxy Manager as active Docker services.
- Created Docker backup archive `docker-backup-20260610.tar.gz`.
- Validated Proxmox backup of VM120 to a local backup destination.
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
- Assigned VM120 IP address `the lab subnet`.
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
- Created initial `.the former internal service namespace` proxy host entries.
- Configured temporary Windows hosts file mappings for lab service names.
- Updated Homepage dashboard links and bookmarks.

### Known Issues

- Portainer reverse proxy access is not finalized; direct access is currently used.
- Vaultwarden is installed but should not be used for real credentials until HTTPS is implemented.
- Docker services are currently deployed with `docker run`; Docker Compose conversion is planned.

## 2026-06-07

### UniFi Controller Migration

- Created VM110 `unifi-controller-01` using Ubuntu Server 24.04.
- Installed Java 21, MongoDB, and UniFi Network Application.
- Resolved MongoDB startup failure by changing VM110 CPU type from `x86-64-v2-AES` to `host`.
- Confirmed UniFi Network Application loaded successfully at a historical internal service endpoint.
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
- Confirmed Proxmox web UI access at a historical internal service endpoint.
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
- Added 1TB HDD as a local backup destination.
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
- Confirmed AP reachable at the lab subnet.
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