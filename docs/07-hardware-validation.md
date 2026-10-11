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
