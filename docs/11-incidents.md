# CMR Lab Incident and Troubleshooting History

## Purpose

This document preserves selected **resolved or historically bounded** incidents that provided meaningful engineering lessons. It records observations and conclusions without publishing current administrative endpoints, sensitive recovery procedures or live security weaknesses.

For active incident handling, access-control decisions and environment-specific recovery steps, use restricted operational documentation. The [Operations Runbook](09-operations-runbook.md) explains the public process framework.

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

A repurposed Proxmox laptop had unexpectedly poor Ethernet negotiation. Investigation compared link behaviour through the internal interface and an external network adapter. The external connection established a stable Gigabit link.

**Lessons:** Link negotiation must be measured rather than assumed from nominal port specifications. A low-cost adapter may be a practical workaround where replacing otherwise useful hardware is unnecessary.

## INC-2026-004 — Gateway evaluation interrupted

**Period:** September 2026  
**Classification:** Network equipment evaluation  
**Historical status:** Trial discontinued

An exploratory gateway deployment showed unstable behaviour and was removed from the production path. The existing router remained the household gateway.

**Lessons:** Maintain a rollback path for network changes, especially when the lab shares connectivity with everyday services. Treat trial equipment as experimental until operational behaviour is demonstrated over time.

## INC-2026-005 — SOC2 reinstall and cluster rejoin

**Period:** 14–15 August 2026  
**Classification:** Virtualisation host recovery and cluster membership  
**Historical status:** Reinstalled and verified quorate

The Lenovo T450 security node was rebuilt after prior configuration capture. Instead of copying cluster-managed state blindly, the reinstall restored normal operating access and then deliberately re-established cluster membership. By 15 August, the Proxmox cluster again reported all three nodes and quorum.

**Lessons:** Restoring a physical node and restoring distributed cluster membership are distinct tasks. An off-host configuration archive supports recovery planning, but a success claim must be based on validated cluster state.

## INC-2026-006 — UniFi gateway evaluation and failure

**Period:** 12–14 September 2026  
**Classification:** Routing equipment trial  
**Historical status:** Test discontinued; existing household gateway retained

The trialled USG intermittently failed to obtain or retain working WAN configuration through its expected automatic addressing. A static WAN configuration restored connectivity during investigation, but the configuration state observed afterward still indicated DHCP. On 14 September, the device later became unresponsive; port LEDs behaved abnormally and the normal top indicator was absent even after a power cycle.

The visible symptoms support concluding that the gateway was unsuitable for continued household use in that state. They do not prove which internal component failed.

**Lessons:** Keep a known-good rollback path for experiments affecting shared internet access. Separate a configuration defect from subsequent hardware symptoms, and do not infer component-level root cause without measurement.

## Incident-record method

Each future public account should capture the period, observable symptoms, scope of impact, evidence, recovery outcome and lessons learned. Avoid publishing live addressing, access paths, sensitive diagnostic outputs or unresolved weaknesses. Root causes should be labelled as confirmed only when evidence supports that conclusion.

For the wider timeline, see [Lab Evolution](10-lab-evolution.md).
