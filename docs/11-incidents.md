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

## Incident-record method

Each future public account should capture the period, observable symptoms, scope of impact, evidence, recovery outcome and lessons learned. Avoid publishing live addressing, access paths, sensitive diagnostic outputs or unresolved weaknesses. Root causes should be labelled as confirmed only when evidence supports that conclusion.

For the wider timeline, see [Lab Evolution](10-lab-evolution.md).
