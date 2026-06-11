# CMR Lab 2026 Roadmap

## Project Goal

Redesign and rebuild the CMR home lab from the ground up using available hardware where practical, while creating professional documentation that can support learning, troubleshooting and portfolio development.

## Phase 1 - Hardware Recovery

### Primary Goal

Recover one Dell OptiPlex 7010 and prepare it to become the primary lab server.

## Immediate Priorities

- [x] Recover first OptiPlex
- [x] Confirm CPU
- [x] Confirm motherboard operation
- [x] Confirm SSD presence
- [x] Confirm BIOS access
- [x] Complete Dell diagnostics
- [x] Install additional 1 TB HDD
- [x] Install and confirm 20 GB RAM
- [x] Establish wired lab network using new CAT6 run
- [x] Connect main PC, server, Cloud Key, and USG to lab switch
- [x] Create Proxmox installer USB
- [x] Install Proxmox on 500 GB SSD
- [x] Configure Proxmox management access
- [x] Convert server to headless operation
- [x] Configure no-subscription update repository
- [x] Update and reboot Proxmox host
- [x] Configure 1 TB HDD as secondary Proxmox storage
- [x] Create first test VM
- [x] Document Proxmox baseline configuration
- [x] Create VM110 for UniFi Network Controller
- [x] Install UniFi Network Application on VM110
- [x] Migrate UniFi AP from Dell Micro controller to VM110
- [x] Enable VM auto-start after Proxmox reboot
- [ ] Plan migration from MacBook server
- [x] Implement backups
- [x] Deploy Docker services
- [x] Deploy Portainer on VM120
- [x] Deploy Homepage dashboard on VM120
- [x] Deploy Uptime Kuma on VM120
- [x] Deploy Nginx Proxy Manager on VM120
- [x] Deploy Vaultwarden container on VM120
- [ ] Implement HTTPS strategy for Vaultwarden
- [x] Deploy Tailscale on VM120
- [ ] Enable MagicDNS
- [x] Convert Docker services to Docker Compose
- [x] Establish VM100 as management and automation platform
- [x] Install Ansible on VM100
- [x] Configure passwordless SSH from VM100 to VM110 and VM120
- [x] Validate Ansible connectivity across lab VMs
- [x] Configure weekly Proxmox backups for VM110 and VM120
- [ ] Finalize Homepage dashboard
- [ ] Create UniFi controller backup from VM110
- [ ] Document WiFi configuration
- [ ] Test USG adoption in isolated mode
- [ ] Plan Dell Micro controller decommission cleanup
- [ ] Create Ansible health-check playbook
- [ ] Complete Ansible update playbook
- [ ] Resolve Ansible sudo/become issue in `update-all.yml`
- [x] Deploy AdGuard Home on VM100
- [x] Create internal DNS namespace
- [x] Migrate from `.local` to `.internal`
- [x] Integrate DNS rewrites with Nginx Proxy Manager
- [x] Validate core lab services using internal DNS names
- [x] Snapshot VM100 after AdGuard deployment
- [x] Snapshot VM120 after DNS/proxy integration
- [ ] Create restore procedure for DNS and Docker services
- [ ] Resolve Vaultwarden HTTPS
- [ ] Deploy Jellyfin on VM120
- [ ] Document backup restoration procedure

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