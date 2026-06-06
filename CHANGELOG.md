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
- Configured BIOS power recovery for automatic restart after power restoration.

### Storage

- Confirmed PNY 500GB SATA SSD detected and passed SMART.
- Confirmed WDC WD1002FBYS 1TB HDD detected and passed SMART.
- Identified 1TB HDD still contains existing NTFS partition and will be repurposed later.

### Repository Configuration

- Disabled Proxmox enterprise repository.
- Added Proxmox no-subscription repository.
- Disabled Ceph enterprise repository.
- Successfully completed `apt update`.
- Completed update/reboot validation and confirmed Proxmox web UI returned successfully.

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