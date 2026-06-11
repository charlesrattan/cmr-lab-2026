# CMR Lab Operations Runbook

## Purpose

This document provides the operational procedures used to maintain, monitor, troubleshoot and recover CMR Lab.

It serves as the primary day-to-day operations guide for the environment.

Architecture, design decisions, project history and future plans are documented separately.

---

# Environment Overview

## Core Infrastructure

| Platform                      | Purpose                        |
| ----------------------------- | ------------------------------ |
| Proxmox (`cmr-srv-01`)        | Virtualization platform        |
| VM100 (`ubuntu-mgmt-01`)      | Management, automation and DNS |
| VM110 (`unifi-controller-01`) | UniFi Network Controller       |
| VM120 (`docker-services-01`)  | Docker services platform       |

---

# Core Service Access

| Service                   | URL                                  |
| ------------------------- | ------------------------------------ |
| Proxmox                   | https://proxmox.cmrlab.internal:8006 |
| UniFi Network Application | https://unifi.cmrlab.internal:8443   |
| Homepage Dashboard        | http://dashboard.cmrlab.internal     |
| Vaultwarden               | http://vault.cmrlab.internal         |
| Uptime Kuma               | http://kuma.cmrlab.internal          |
| Portainer                 | https://portainer.cmrlab.internal    |
| AdGuard Home              | http://adguard.cmrlab.internal       |
| Nginx Proxy Manager       | http://10.146.91.230:81              |

---

# Repository Operations

The Git repository is considered part of the operational environment.

Repository responsibilities include:

* Documentation
* Architecture records
* Decision records
* Operational procedures
* Automation scripts

Repository location:

```text
cmr-lab-2026/
```

---

# Automation Scripts

Operational automation is maintained under:

```text
scripts/
```

Current structure:

```text
scripts/
├── ansible/
│   ├── health-check.yml
│   └── update-all.yml
└── ubuntu-post-install.sh
```

---

## health-check.yml

Purpose:

Infrastructure health validation.

Current checks:

* Reachability
* IP address reporting
* Uptime
* Disk usage
* Memory usage
* Reboot-required status
* UniFi service status
* Docker service status

Execute:

```bash
cd ~/cmr-lab-2026/scripts/ansible
ansible-playbook health-check.yml
```

---

## update-all.yml

Purpose:

Routine maintenance and update automation.

Status:

Under development.

Known Issue:

Ansible sudo/become workflow requires refinement.

Execute:

```bash
cd ~/cmr-lab-2026/scripts/ansible
ansible-playbook update-all.yml
```

---

## ubuntu-post-install.sh

Purpose:

Baseline Ubuntu configuration.

Intended use:

* New VM deployments
* Server rebuilds
* Disaster recovery scenarios

---

# Daily Operations

## Verify Service Availability

Review:

* Homepage
* Uptime Kuma
* AdGuard Home
* UniFi Dashboard

Confirm:

* No failed services
* No offline VMs
* No storage warnings
* No backup failures

---

## Run Health Check

From VM100:

```bash
cd ~/cmr-lab-2026/scripts/ansible
ansible-playbook health-check.yml
```

Review output for:

* Offline hosts
* Storage issues
* Memory pressure
* Reboot requirements
* Service failures

---

# Weekly Operations

## Verify Backups

In Proxmox:

1. Open Datacenter
2. Review backup jobs
3. Confirm successful completion
4. Investigate failures

---

## Review Storage

Review:

* Proxmox local storage
* HDD storage
* Docker storage utilization

---

## Review Infrastructure

Confirm:

* VM100 operational
* VM110 operational
* VM120 operational
* Tailscale connected
* DNS functioning correctly

---

# Docker Operations

## Check Containers

```bash
docker ps
```

---

## Restart Containers

```bash
cd ~/docker
docker compose restart
```

---

## Recreate Containers

```bash
cd ~/docker
docker compose up -d
```

---

## View Logs

```bash
docker logs homepage
docker logs portainer
docker logs uptime-kuma
docker logs vaultwarden
```

---

# DNS Operations

## Verify AdGuard Home

```bash
sudo systemctl status AdGuardHome
```

---

## Test DNS Resolution

```bash
nslookup dashboard.cmrlab.internal 10.146.91.99
```

Expected result:

```text
10.146.91.230
```

---

# UniFi Operations

## Verify Service

```bash
sudo systemctl status unifi
```

---

## Restart Service

```bash
sudo systemctl restart unifi
```

---

## Validate AP Status

Confirm:

* Controller online
* AP adopted
* Clients connected
* No uplink warnings

---

# Backup and Recovery

## Before Major Changes

Always:

1. Create Proxmox snapshot
2. Commit documentation changes
3. Verify backup status
4. Record major decisions

---

## Current Recovery Strategy

| Item                   | Method            |
| ---------------------- | ----------------- |
| Documentation          | GitHub            |
| VM Recovery            | Proxmox backups   |
| Configuration Recovery | Git repository    |
| Service Recovery       | Docker Compose    |
| Rollback               | Proxmox snapshots |

---

# Known Issues

| Issue                               | Status       |
| ----------------------------------- | ------------ |
| Vaultwarden HTTPS implementation    | Pending      |
| update-all.yml sudo/become handling | Pending      |
| Network-wide AdGuard deployment     | Under review |

---

# Operational Principles

* Stability before complexity
* Documentation before expansion
* Recovery before experimentation
* Snapshot before major changes
* Automate repetitive tasks
* Validate before implementing
* Record significant decisions

---

# Current Status

Current Phase:

Operations and Governance

Primary Objective:

Improve maintainability, recoverability, documentation quality and operational maturity before introducing additional services.

---

# Review History

| Date       | Reviewer       | Notes                                  |
| ---------- | -------------- | -------------------------------------- |
| 2026-06-11 | Charles Rattan | Operations runbook established         |
| 2026-06-11 | Charles Rattan | Integrated repository automation model |
