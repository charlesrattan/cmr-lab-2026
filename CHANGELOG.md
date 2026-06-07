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