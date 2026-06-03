# CMR Lab 2026 Roadmap

## Project Goal

Redesign and rebuild the CMR home lab from the ground up using available hardware where practical, while creating professional documentation that can support learning, troubleshooting and portfolio development.

## Phase 1 - Hardware Recovery

### Primary Goal

Recover one Dell OptiPlex 7010 and prepare it to become the primary lab server.

### Tasks

- [ ] Inspect OptiPlex 7010 Unit 1
- [ ] Inspect OptiPlex 7010 Unit 2
- [ ] Inspect OptiPlex 7010 Unit 3
- [ ] Identify working power supply
- [ ] Identify working motherboard
- [ ] Identify best available CPU
- [ ] Identify total usable RAM
- [ ] Identify available storage
- [ ] Decide whether an SSD needs to be purchased
- [ ] Build one working OptiPlex from the best parts

### Success Criteria

- One OptiPlex powers on reliably
- BIOS is accessible
- CPU and RAM are confirmed
- Storage is available or purchase requirement is known
- Ethernet port works
- Machine is suitable to become `cmr-srv-01`

---

## Phase 2 - Network Foundation

### Primary Goal

Prepare the network to move from the Linksys router to UniFi-based infrastructure.

### Tasks

- [ ] Test UniFi Security Gateway
- [ ] Factory reset UniFi Security Gateway if needed
- [ ] Test UniFi Cloud Key
- [ ] Confirm UniFi AC Pro status
- [ ] Identify available switch options
- [ ] Decide which devices must be wired
- [ ] Draft IP addressing plan
- [ ] Finalise naming convention

### Success Criteria

- UniFi Security Gateway powers on
- Cloud Key is accessible
- UniFi AP can be adopted or managed
- Target topology is documented
- Critical wired devices are identified

---

## Phase 3 - Server Rebuild

### Primary Goal

Rebuild the server environment cleanly on the recovered OptiPlex.

### Tasks

- [ ] Decide between Proxmox and Ubuntu Server as the initial install
- [ ] Install selected operating system
- [ ] Assign hostname `cmr-srv-01`
- [ ] Configure static IP
- [ ] Install required updates
- [ ] Document base configuration
- [ ] Rebuild core services

### Initial Services

- Jellyfin
- Tailscale
- Docker or container platform
- Monitoring tool

### Success Criteria

- Server boots reliably
- Server is wired to the network
- Server can be accessed remotely
- Existing services can be migrated from the MacBook

---

## Phase 4 - Service Migration

### Primary Goal

Move important services away from the MacBook.

### Tasks

- [ ] Document current MacBook services
- [ ] Document current Jellyfin storage paths
- [ ] Rebuild Jellyfin on new server
- [ ] Rebuild Tailscale on new server
- [ ] Test remote access
- [ ] Confirm family media access
- [ ] Retire MacBook from primary server role

---

## Phase 5 - Improvement and Expansion

### Future Services

- Monitoring dashboard
- Home Assistant
- DNS filtering
- Backup system
- Security scanning
- Central logging
- Documentation portal

---

## Parking Lot

The following are not part of the current phase:

- Cisco RV042G
- Dual WAN
- Wazuh
- Security Onion
- Kubernetes
- Local AI
- PBX