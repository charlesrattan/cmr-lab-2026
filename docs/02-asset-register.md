# CMR Lab Asset Register

## Status

Active

## Purpose

This document is the authoritative inventory of all hardware, virtual machines, network infrastructure and utility devices that form part of CMR Lab 2026.

Historical inventories and project evolution are documented elsewhere. This document reflects the current state of the environment.

**Version:** 2.0
**Last Updated:** June 2026
**Owner:** Charles Rattan

---

# 1. Network Infrastructure

| Asset ID      | Device                | Model          | IP Address    | Status | Purpose                            |
| ------------- | --------------------- | -------------- | ------------- | ------ | ---------------------------------- |
| CMR-LAB-GW-01 | Router                | Linksys EA4500 | 10.146.91.89  | Active | Internet gateway, DHCP and routing |
| CMR-LAB-AP-01 | Wireless Access Point | UniFi AC Pro   | 10.146.91.153 | Active | Primary wireless network           |

---

# 2. Physical Compute Assets

## CMR-LAB-CTRL-01

| Attribute        | Value                                        |
| ---------------- | -------------------------------------------- |
| Device           | Dell OptiPlex Micro                          |
| Hostname         | DESKTOP-K9O7VKE                              |
| Operating System | Windows 11 Pro 25H2                          |
| CPU              | Intel Core i5-8500T                          |
| RAM              | 32 GB                                        |
| Status           | Active                                       |
| Role             | Primary management workstation and family PC |

---

## CMR-LAB-SRV-01

| Attribute        | Value                       |
| ---------------- | --------------------------- |
| Device           | Dell OptiPlex 7010 SFF      |
| Hostname         | cmr-srv-01                  |
| IP Address       | 10.146.91.13                |
| Operating System | Proxmox VE                  |
| CPU              | Intel Core i7-3770          |
| Logical CPUs     | 8                           |
| RAM              | 20 GB                       |
| Storage          | 500 GB SSD + 1 TB HDD       |
| Status           | Operational                 |
| Role             | Primary virtualization host |

### Hosted Virtual Machines

| VM ID | Name                | Purpose                        |
| ----- | ------------------- | ------------------------------ |
| 100   | ubuntu-mgmt-01      | Management, DNS and automation |
| 110   | unifi-controller-01 | UniFi Network Controller       |
| 120   | docker-services-01  | Docker services platform       |

---

## CMR-LAB-SEC-01

| Attribute        | Value                     |
| ---------------- | ------------------------- |
| Device           | Lenovo ThinkPad T440p     |
| Hostname         | kali                      |
| Operating System | Kali Linux                |
| Status           | Active                    |
| Role             | Security testing platform |

---

## CMR-LAB-UTIL-01

| Attribute        | Value                         |
| ---------------- | ----------------------------- |
| Device           | Lenovo ThinkPad               |
| Operating System | Windows                       |
| Status           | Active                        |
| Role             | Utility and spare workstation |

---

# 3. Virtual Infrastructure

## VM100 - ubuntu-mgmt-01

| Attribute  | Value                          |
| ---------- | ------------------------------ |
| VM ID      | 100                            |
| IP Address | 10.146.91.99                   |
| OS         | Ubuntu Server                  |
| Role       | Management, DNS and automation |
| Status     | Operational                    |

### Hosted Services

| Service      | Purpose                                    |
| ------------ | ------------------------------------------ |
| AdGuard Home | Internal DNS and service discovery         |
| Ansible      | Automation and health checks               |
| Tailscale    | Secure remote access                       |
| Git          | Documentation and configuration management |

---

## VM110 - unifi-controller-01

| Attribute  | Value                    |
| ---------- | ------------------------ |
| VM ID      | 110                      |
| IP Address | 10.146.91.172            |
| OS         | Ubuntu Server            |
| Role       | UniFi Network Controller |
| Status     | Operational              |

### Hosted Services

| Service                   | Purpose                     |
| ------------------------- | --------------------------- |
| UniFi Network Application | Wireless network management |

---

## VM120 - docker-services-01

| Attribute  | Value                    |
| ---------- | ------------------------ |
| VM ID      | 120                      |
| IP Address | 10.146.91.230            |
| OS         | Ubuntu Server            |
| Role       | Docker services platform |
| Status     | Operational              |

### Hosted Services

| Service             | Purpose                           |
| ------------------- | --------------------------------- |
| Docker Engine       | Container runtime                 |
| Portainer           | Container management              |
| Homepage            | Service dashboard                 |
| Uptime Kuma         | Monitoring                        |
| Vaultwarden         | Password management               |
| Nginx Proxy Manager | Reverse proxy and service routing |

---

# 4. Utility Infrastructure

## CMR-LAB-PI-01

| Attribute | Value                    |
| --------- | ------------------------ |
| Device    | Raspberry Pi 3           |
| Hostname  | Homebridge               |
| Status    | Active                   |
| Role      | Home automation platform |

### Hosted Services

* Homebridge

---

## CMR-LAB-PI-02

| Attribute | Value              |
| --------- | ------------------ |
| Device    | Raspberry Pi 3     |
| Status    | Offline            |
| Role      | Spare utility node |

---

# 5. Spare and Offline Infrastructure

| Asset ID       | Device                 | Status    | Intended Role                          |
| -------------- | ---------------------- | --------- | -------------------------------------- |
| CMR-LAB-USG-01 | UniFi Security Gateway | Offline   | Future firewall and gateway evaluation |
| CMR-LAB-CK-01  | UniFi Cloud Key        | Offline   | Legacy UniFi controller platform       |
| CMR-LAB-SW-01  | TP-Link TL-SF1008P     | Available | Utility PoE switch                     |

---

# 6. Asset Summary

## Active Infrastructure

| Category                | Count              |
| ----------------------- | ------------------ |
| Network Devices         | 2                  |
| Physical Compute Assets | 4                  |
| Virtual Machines        | 3                  |
| Raspberry Pi Devices    | 1 Active / 1 Spare |

## Operational Service Platforms

| Platform | Purpose                        |
| -------- | ------------------------------ |
| VM100    | Management, DNS and automation |
| VM110    | Network management             |
| VM120    | Application services           |

---

# 7. Review History

| Date       | Reviewer       | Notes                                                               |
| ---------- | -------------- | ------------------------------------------------------------------- |
| 2026-06-03 | Charles Rattan | Initial asset register created                                      |
| 2026-06-11 | Charles Rattan | Refactored to align with current architecture and operational state |
