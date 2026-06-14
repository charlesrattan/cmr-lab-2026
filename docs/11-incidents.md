# 11 - Incidents

This document records significant operational incidents, root cause investigations, corrective actions and lessons learned within CMR Lab.

---

# INC-2026-001 - Proxmox Host Network Interface Lockup

## Summary

During the early hours of 2026-06-14, multiple services within the lab became unavailable. Initial symptoms suggested DNS instability and media platform issues following deployment of the Jellyfin and Arr stack. Investigation determined that the root cause was a Proxmox host network interface failure affecting connectivity to all virtual machines.

## Impact

Affected Services:

* AdGuard Home
* Homepage
* Vaultwarden
* Jellyfin
* Sonarr
* Radarr
* Prowlarr
* Jellyseerr
* UniFi Controller
* Uptime Kuma

User Impact:

* Internal DNS unavailable
* Internal service URLs inaccessible
* Remote management unavailable
* Media platform unavailable

## Timeline

### 2026-06-14 00:45

First observed kernel error:

NETDEV WATCHDOG transmit queue timeout.

### 2026-06-14 04:41

Continuous watchdog events observed.

### 2026-06-14 Morning

Workstation lost internet access when configured to use AdGuard DNS.

Temporary restoration achieved by changing DNS from 10.146.91.99 to router DNS.

### 2026-06-14 09:34

Controlled reboot of Proxmox host initiated.

### 2026-06-14 09:35

Host connectivity restored.

### 2026-06-14 09:40

VM120 manually started after reboot.

## Root Cause

Proxmox host onboard network adapter:

Intel 82579LM Gigabit Network Connection

Driver:

e1000e

Observed Errors:

NETDEV WATCHDOG transmit queue timed out

The network interface entered a degraded state resulting in loss of network connectivity while the host remained operational.

## Resolution

* Rebooted Proxmox host.
* Validated VM recovery.
* Confirmed restoration of network connectivity.
* Confirmed restoration of DNS services.
* Implemented additional monitoring requirements.

## Corrective Actions

Planned:

* Add ICMP monitoring for Proxmox host and critical VMs.
* Monitor for recurrence of e1000e watchdog events.
* Evaluate dedicated PCIe Intel network adapter if issue recurs.

## Status

Closed - Monitoring
