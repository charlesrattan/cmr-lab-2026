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

| Service                   | URL                                    |
| ------------------------- | -------------------------------------- |
| Proxmox                   | https://proxmox.cmrlab.internal:8006   |
| UniFi Network Application | https://unifi.cmrlab.internal:8443     |
| Homepage Dashboard        | http://dashboard.cmrlab.internal       |
| Vaultwarden               | https://vault.cmrlab.internal          |
| Uptime Kuma               | http://kuma.cmrlab.internal            |
| Portainer                 | https://portainer.cmrlab.internal:9443 |
| AdGuard Home              | http://adguard.cmrlab.internal         |
| Nginx Proxy Manager       | http://npm.cmrlab.internal:81          |

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

cmr-lab-2026/

---

# Automation Scripts

Operational automation is maintained under:

scripts/

Current structure:

scripts/
├── ansible/
│   ├── health-check.yml
│   └── update-all.yml
└── ubuntu-post-install.sh

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

cd ~/cmr-lab-2026/scripts/ansible
ansible-playbook health-check.yml

---

## update-all.yml

Purpose:

Routine maintenance and update automation.

Status:

Under development.

Known Issue:

Ansible sudo/become workflow requires refinement.

Execute:

cd ~/cmr-lab-2026/scripts/ansible
ansible-playbook update-all.yml

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

cd ~/cmr-lab-2026/scripts/ansible
ansible-playbook health-check.yml

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

docker ps

## Restart Containers

cd ~/docker
docker compose restart

---

## Recreate Containers

cd ~/docker
docker compose up -d

---

## View Logs

docker logs homepage
docker logs portainer
docker logs uptime-kuma
docker logs vaultwarden

---

# DNS Operations

# Remote Access Operations

## Verify Tailscale Status

sudo tailscale status

## Verify AdGuard Home

sudo systemctl status AdGuardHome

---

## Test DNS Resolution

nslookup dashboard.cmrlab.internal 10.146.91.99


## Expected result:

10.146.91.230


---

# UniFi Operations

## Verify Service

sudo systemctl status unifi

---

## Restart Service

sudo systemctl restart unifi

---

## Validate AP Status

Confirm:

* Controller online
* AP adopted
* Clients connected
* No uplink warnings

---

# Internal PKI Operations

## Root CA Location

/home/charles/ca

## critical Files

cmrlab-root-ca.crt
cmrlab-root-ca.key

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

| Issue                               | Status           |
| ----------------------------------- | ---------------- |
| update-all.yml sudo/become handling     | Pending      |
| Internal CA trust deployment to devices | In Progress  |
| Backup restoration validation           | Pending      |

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

## Incident Response Procedures

### Proxmox Host Unreachable

Use this procedure when Proxmox and all VMs appear unavailable.

#### Symptoms

* Proxmox IP does not respond.
* VM100, VM110 and VM120 do not respond.
* Internal DNS fails.
* Services using `.cmrlab.internal` are unavailable.
* Internet may appear broken if client DNS is set to AdGuard.

#### Initial Checks

From Windows workstation:

ping 10.146.91.13
ping 10.146.91.99
ping 10.146.91.172
ping 10.146.91.230

Check workstation network:

ipconfig /all
arp -a

Confirm:

* Workstation is on 10.146.91.0/24.
* Gateway 10.146.91.89 is reachable.
* UniFi AP 10.146.91.153 is reachable.

#### Console Checks

If Proxmox is unreachable but the LAN is healthy, connect monitor and keyboard to `cmr-srv-01`.

Look for:

NETDEV WATCHDOG
e1000e
transmit queue timed out


Check NIC and host state:

ip -br link
ip -s link show nic0
uptime
journalctl -k | grep -i e1000e | tail -50


#### Recovery

If host is responsive but network remains unavailable:

reboot


After reboot:

qm list

Confirm VM100, VM110 and VM120 are running.

#### Evidence Collection

After recovery:

journalctl -b -1 | grep -i "NETDEV WATCHDOG" | head -20
journalctl -b -1 | grep -i "NETDEV WATCHDOG" | tail -20
journalctl -b -1 | grep -i -E "shutdown|reboot|stopall|qmshutdown|qmstart|e1000e" | tail -100

---

### Tailscale Remote Access Failure

Use this procedure when Tailscale clients can reach Tailscale IPs but cannot reach internal LAN services or `.cmrlab.internal` names.

#### Known Working Test

From phone or remote client:

http://100.85.11.22:3000

This tests direct Tailscale access to VM120.

#### LAN Service Test

From phone or remote client:

http://dashboard.cmrlab.internal

This requires both DNS resolution and subnet routing.

#### VM100 Checks

On VM100:

sudo tailscale status
sysctl net.ipv4.ip_forward

If Tailscale reports:

Subnet routing is enabled, but IP forwarding is disabled

or if:

net.ipv4.ip_forward = 0

enable forwarding:

sudo sysctl -w net.ipv4.ip_forward=1

Make persistent:

echo "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-cmrlab-tailscale-router.conf
sudo sysctl --system

Validate:

sysctl net.ipv4.ip_forward
sudo tailscale status

#### Validation

From phone with Tailscale enabled:

http://dashboard.cmrlab.internal


Expected result:

Homepage loads.

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
