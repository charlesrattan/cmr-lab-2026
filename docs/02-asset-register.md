# CMR Lab Asset Register

## Status

Draft

## Purpose

This document serves as the authoritative inventory of all hardware, network infrastructure, compute resources, and utility devices that form part of CMR Lab 2026.

**Version:** 1.0
**Last Updated:** June 2026
**Owner:** Charles Rattan

---

# 1. Network Infrastructure

| Asset ID      | Device                | Model          | IP Address    | Status | Purpose                         |
| ------------- | --------------------- | -------------- | ------------- | ------ | ------------------------------- |
| CMR-LAB-GW-01 | Router                | Linksys EA4500 | 10.146.91.89  | Active | Internet Gateway, DHCP, Routing |
| CMR-LAB-AP-01 | Wireless Access Point | UniFi AC Pro   | 10.146.91.153 | Active | Primary Wireless Network        |

---

# 2. Compute Infrastructure

## CMR-LAB-CTRL-01

| Attribute        | Value                                      |
| ---------------- | ------------------------------------------ |
| Device           | Dell OptiPlex Micro                        |
| Hostname         | DESKTOP-K9O7VKE                            |
| IP Address       | 10.146.91.161                              |
| Operating System | Windows 11 Pro 25H2                        |
| CPU              | Intel Core i5-8500T                        |
| RAM              | 32 GB                                      |
| Storage          | ~704 GB SSD                                |
| Status           | Active                                     |
| Role             | Primary Management Workstation / Family PC |

---

## CMR-LAB-SRV-01

| Attribute        | Value                     |
| ---------------- | ------------------------- |
| Device           | MacBook Pro 2015          |
| Hostname         | cmrlab                    |
| IP Address       | 10.146.91.44              |
| Operating System | Ubuntu Server 24.04.2 LTS |
| CPU              | Intel Core i5-5257U       |
| RAM              | 8 GB DDR3                 |
| Storage          | 121 GB Internal SSD       |
| Media Storage    | 1 TB External Drive       |
| Status           | Active                    |
| Role             | Primary Server            |

## CMR-LAB-SRV-02

| Attribute | Value |
| --------- | ----- |
| Device | Dell OptiPlex 7010 SFF |
| CPU | Intel Core i7-3770 @ 3.40 GHz |
| RAM | 4 GB DDR3 currently installed |
| DIMM Slots | 4 |
| Storage | 500 GB SSD detected, 500 GB HDD installed |
| Status | Validated |
| Intended Role | Primary Proxmox candidate |
| Notes | Recovered using parts from remaining OptiPlex units. POST successful, BIOS accessible, Dell diagnostics passed. Requires RAM upgrade before Proxmox deployment. |

### Hosted Services

* Jellyfin
* Ollama
* Grafana
* cAdvisor
* Node Exporter
* Cockpit
* Docker

---

## CMR-LAB-SEC-01

| Attribute        | Value                     |
| ---------------- | ------------------------- |
| Device           | Lenovo ThinkPad T440p     |
| Hostname         | kali                      |
| IP Address       | 10.146.91.242             |
| Operating System | Kali Linux Rolling        |
| CPU              | Intel Core i5-4200M       |
| RAM              | 8 GB                      |
| Storage          | 500 GB SSD                |
| Status           | Active                    |
| Role             | Security Testing Platform |

---

## CMR-LAB-UTIL-01

| Attribute        | Value                       |
| ---------------- | --------------------------- |
| Device           | Lenovo ThinkPad             |
| Hostname         | DESKTOP-LN4P1TS             |
| IP Address       | 10.146.91.92                |
| Operating System | Windows                     |
| Status           | Active                      |
| Role             | Utility / Spare Workstation |

---

# 3. Utility Nodes

## CMR-LAB-PI-01

| Attribute  | Value                    |
| ---------- | ------------------------ |
| Device     | Raspberry Pi 3           |
| Hostname   | Homebridge               |
| IP Address | 10.146.91.181            |
| Status     | Active                   |
| Role       | Home Automation Platform |

### Hosted Services

* Homebridge

---

## CMR-LAB-PI-02

| Attribute | Value              |
| --------- | ------------------ |
| Device    | Raspberry Pi 3     |
| Status    | Offline            |
| Role      | Spare Utility Node |

---

# 4. Offline / Spare Infrastructure

## CMR-LAB-USG-01

| Attribute | Value                   |
| --------- | ----------------------- |
| Device    | UniFi Security Gateway  |
| Status    | Offline                 |
| Role      | Spare Firewall / Router |

---

## CMR-LAB-CK-01

| Attribute | Value                  |
| --------- | ---------------------- |
| Device    | UniFi Cloud Key        |
| Status    | Offline                |
| Role      | Spare UniFi Controller |

---

## CMR-LAB-SW-01

| Attribute | Value |
| --------- | ----- |
| Device | TP-Link TL-SF1008P |
| Type | 8-Port PoE Switch |
| Speed | Fast Ethernet / 100 Mbps |
| Status | Offline / Available |
| Role | Utility PoE switch for testing and temporary deployments |
| Notes | Not suitable as the long-term core lab switch because it is not Gigabit and is unmanaged |
---

# 5. Current Logical Topology

Internet
│
└── Linksys EA4500
│
├── UniFi AC Pro
│
├── Dell OptiPlex Micro
│
├── Ubuntu Server (MacBook Pro)
│    ├── Jellyfin
│    ├── Ollama
│    ├── Grafana
│    ├── Cockpit
│    └── Docker
│
├── Raspberry Pi 3
│    └── Homebridge
│
├── ThinkPad T440p
│    └── Kali Linux
│
└── ThinkPad Windows

---

# 6. Future Hardware Roadmap

Priority 1

* UPS
* Rack/Cabinet
* Structured Cabling
* Managed Switch

Priority 2

* Primary Proxmox Server

Priority 3

* Storage Expansion

Priority 4

* Network Segmentation and Advanced Lab Services

---

# 7. Asset Summary

## Active Assets

* Linksys EA4500
* UniFi AC Pro
* Dell OptiPlex Micro
* MacBook Pro Ubuntu Server
* Lenovo ThinkPad T440p (Kali)
* Lenovo ThinkPad (Windows)
* Raspberry Pi 3 (Homebridge)

## Offline Assets

* Raspberry Pi 3
* UniFi Security Gateway
* UniFi Cloud Key
* Cisco 8-Port Switch

## Hardware Assets Requiring Inspection

| Asset | Current Status | Intended Role | Notes |
|---|---|---|---|
| Dell OptiPlex 7010 Unit 1 | Unknown / poor condition | Candidate server | Needs inspection |
| Dell OptiPlex 7010 Unit 2 | Unknown / poor condition | Parts donor or candidate server | Needs inspection |
| Dell OptiPlex 7010 Unit 3 | Unknown / poor condition | Parts donor or candidate server | Needs inspection |
| MacBook Ubuntu Server | Active but unreliable | Temporary server | No battery, MagSafe unreliable |
| UniFi Security Gateway | Offline | Target gateway | Needs testing |
| UniFi Cloud Key | Offline | UniFi controller | Needs testing |
| UniFi AC Pro | Available / in use | Wireless access point | To be managed through UniFi |
| Linksys Router | Active | Current router | To be replaced eventually |
| Cisco RV042G | Excluded | Not in current scope | Removed from rebuild plan |

## Hardware Validation Notes

- Remaining OptiPlex units were used as parts donors to recover the validated Dell OptiPlex 7010 SFF.
- There are no longer three separate OptiPlex server candidates.
- Current focus is to inventory recovered DDR3 RAM and confirm SSD health.

## Total Assets Managed

Active: 7

Offline/Spare: 4

Total: 11

## Last Review

| Date | Reviewer | Notes |
|--------|--------|--------|
| 2026-06-03 | Charles Rattan | Initial asset register created |
