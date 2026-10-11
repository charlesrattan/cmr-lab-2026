# CMR Lab Incident and Troubleshooting History

## Purpose

This document preserves selected **resolved or historically bounded** incidents that provided meaningful engineering lessons. It records observations and conclusions without publishing current administrative endpoints, sensitive recovery procedures or live security weaknesses.

Active incident handling, access-control decisions and environment-specific recovery steps belong in restricted operational documentation. The [Documentation Approach](11-documentation-approach.md) explains the publication boundary and evidence standards.

## INC-2026-001 — Core host connectivity interruption

**Date:** 14 June 2026  
**Classification:** Infrastructure connectivity  
**Historical status:** Service restored; observation retained

During an overnight outage, multiple internal applications became unreachable. The timing initially drew attention to recently introduced media services. Evidence collected from the primary Proxmox host instead showed repeated Linux network-driver watchdog timeouts.

A controlled restart restored host connectivity. Virtual-machine and application availability was then checked separately. The record supports a network-interface/driver problem as the immediate observed mechanism; it does not establish a definitive physical component diagnosis.

**Lessons:** Check common upstream dependencies before assigning blame to a recently deployed service. Retain timestamped system messages, validate the effect of recovery and review which workloads need independent start-up checks.

## INC-2026-002 — Media application storage constraint

**Date:** June 2026  
**Classification:** Capacity and application availability  
**Historical status:** Resolved in the original deployment

A media application could not start reliably when its underlying virtual-machine filesystem lacked adequate free capacity. Storage allocation was revised and the application returned to operation.

**Lessons:** Differentiate virtual disk size, guest filesystem size and application data capacity. Verify usable storage at each layer after an expansion. Capacity is an operating concern, not merely a provisioning decision.

## INC-2026-003 — Network link negotiation on a repurposed node

**Period:** September 2026  
**Classification:** Hardware interoperability  
**Historical status:** Alternative connection validated

SOC1, the Lenovo T440p, negotiated at approximately **10 Mb/s** using its built-in Intel Ethernet path. Interface and bridge behaviour were compared with an external USB Gigabit adapter using the Realtek RTL8153 family and Linux `r8152` driver. After the bridge was associated with the external interface, the host operated at a validated **1 Gb/s** negotiated link. The test supports the workaround, but not a conclusive physical diagnosis of the original NIC or connector.

**Lessons:** Link negotiation must be measured rather than assumed from nominal port specifications. A low-cost adapter may be a practical workaround where replacing otherwise useful hardware is unnecessary.

## INC-2026-004 — Gateway evaluation interrupted

**Period:** 12–14 September 2026  
**Classification:** Network gateway evaluation and suspected equipment failure  
**Historical status:** Trial discontinued; Linksys retained

The tested UniFi Security Gateway intermittently failed to establish a reliable WAN connection through automatic DHCP addressing. A manually entered static WAN configuration restored connectivity during investigation, but later configuration inspection still showed DHCP. This made configuration persistence a separate unresolved question.

On 14 September, the gateway appeared to suffer an additional device-level failure: an empty port flashed, other port indicators remained off and the usual top status light did not illuminate after a power cycle. The trial was discontinued and the previous household gateway remained in service.

**Finding:** Both WAN configuration problems and abnormal physical indicator behaviour were observed. The available evidence does not establish an exact failed hardware component.

**Lessons:** Maintain a known-working network rollback path, verify persisted configuration and separate a software/network explanation from later hardware symptoms.

## INC-2026-005 — SOC2 reinstall and cluster rejoin

**Period:** 14–15 August 2026  
**Classification:** Virtualisation host recovery and cluster membership  
**Historical status:** Reinstalled and verified quorate

The Lenovo T450 security node was rebuilt after prior configuration capture. Instead of copying cluster-managed state blindly, the reinstall restored normal operating access and then deliberately re-established cluster membership. By 15 August, the Proxmox cluster again reported all three nodes and quorum.

**Lessons:** Restoring a physical node and restoring distributed cluster membership are distinct tasks. An off-host configuration archive supports recovery planning, but a success claim must be based on validated cluster state.

## Incident-record method

Each future public account should capture the period, observable symptoms, scope of impact, evidence, recovery outcome and lessons learned. Avoid publishing live addressing, access paths, sensitive diagnostic outputs or unresolved weaknesses. Root causes should be labelled as confirmed only when evidence supports that conclusion.

For the wider timeline, see [Lab Evolution](09-lab-evolution.md).
