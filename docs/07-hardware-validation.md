# Hardware Validation

## Purpose

This is a **historical account** of the hardware-recovery and validation work that began the CMR Lab rebuild in June 2026. It should not be used as a present-day equipment inventory; consult the [Asset Register](02-asset-register.md) for current roles.

## Approach

The rebuild began with a practical question: what could be built reliably from equipment already available?

Candidate equipment was evaluated for basic operation, CPU and memory identification, storage condition, boot behaviour, networking and suitability for long-running virtualisation. Hardware with limited value as a complete system could still serve as a source of replacement parts.

## Core compute system

The Dell OptiPlex 7010 SFF was selected as the original primary virtualisation host.

| Aspect | Recorded result |
| --- | --- |
| Processor | Intel Core i7-3770, eight logical processors |
| Memory at initial build | 20 GB DDR3 |
| Primary storage | 500 GB SSD |
| Secondary storage | 1 TB HDD |
| POST and BIOS access | Passed |
| Storage identification and diagnostic checks | Passed in the original validation |
| Headless operation | Demonstrated |
| Proxmox VE installation and restart | Demonstrated |
| Overall decision | Suitable as the initial core hypervisor |

Successful hardware checks supported the original selection; they are **not** a perpetual guarantee of component health.

## Building a wired foundation

The original network depended heavily on wireless connectivity and multipurpose devices. The project added a tested wired cable run and used available switching equipment during early implementation. UniFi equipment, a legacy Cloud Key and a candidate gateway were also evaluated as part of the rebuild.

These early tests should not be confused with the later production network design or subsequent gateway experiments.

## Validation beyond the first host

Later in 2026, two Lenovo ThinkPads were reused as additional Proxmox nodes. This required assessing the relationship between limited hardware resources, network connectivity and suitable workload placement. The result was a three-node cluster in which the nodes perform different jobs.

A separate Dell OptiPlex Micro workstation subsequently supported Hyper-V experiments using otherwise available compute capacity.

## August: ThinkPad virtualisation validation

| Machine | Hardware | Observations | Outcome |
| --- | --- | --- | --- |
| SOC1 | Lenovo ThinkPad T440p | Proxmox installation, host management and cluster participation verified; later reboot confirmed VM130 and VM140 auto-start | Operations/monitoring node |
| SOC2 | Lenovo ThinkPad T450 | Initial Proxmox installation required a firmware setting adjustment relating to VT-d; August rebuild followed by cluster rejoin | Security-monitoring node |

After the initial August cluster creation, SOC2 was rebuilt rather than restoring old cluster-managed files wholesale. On **15 August 2026**, the three-node Proxmox cluster was confirmed quorate again. This was an operational validation of restored membership, not a test of shared-storage high availability.

Both laptops were initially considered for dedicated offensive and defensive work. Workload assignments later followed available memory, storage and household-service requirements instead of their original names.

## September: SOC1 Ethernet link validation

The T440p's built-in Intel Ethernet connection repeatedly negotiated at approximately **10 Mb/s** despite the wider environment using Gigabit switching and cabling. Investigation separated the link-negotiation problem from the guest workload.

An external USB Ethernet adapter using a Realtek RTL8153-family controller and Linux `r8152` driver negotiated **1,000 Mb/s**. After its interface was associated with the Proxmox bridge, the node remained accessible and the Gigabit link was confirmed.

A reproducible diagnosis would compare `ethtool` link negotiation, `ip -br link` interface state and host/VM connectivity **before and after** the change. The result validates the workaround; it does not establish whether the root cause was the laptop's socket, internal controller or their electrical path.

## Lessons

- Record hardware capability before assigning workloads.
- Confirm storage and filesystem behaviour rather than relying on nominal capacity.
- Treat link speed and stability as observed values.
- Revisit hardware assumptions when the project expands.
- Balance replacement cost against the time and complexity of maintaining older systems.
- Preserve old validation records as history without presenting them as current health certificates.

## Related records

- [Baseline Inventory](00-baseline-inventory.md)
- [Asset Register](02-asset-register.md)
- [Architecture](03-architecture.md)
- [Incidents](11-incidents.md)
