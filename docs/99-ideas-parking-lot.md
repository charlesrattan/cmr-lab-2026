# Ideas and Deferred Experiments

This document is a space for possible future work, **not** a list of services already missing from the current environment. Implemented capabilities are documented in the [Asset Register](02-asset-register.md), [Architecture](03-architecture.md) and [Services Platform](08-services-platform.md).

## Possible future experiments

| Idea | Question worth exploring |
| --- | --- |
| Gateway refresh | Can a new gateway improve manageability without reducing household stability? |
| Segmented test networks | How can isolated environments be introduced and validated repeatably? |
| Local AI workloads | Which small models and hardware allocations would provide useful learning value? |
| Vulnerability assessment tools | How can evidence collection and remediation be practised safely in the designated lab range? |
| Security Onion | What can additional network-security telemetry contribute beyond the existing monitoring stack? |
| Kubernetes | Does orchestration add meaningful learning value at the current scale? |
| PBX/telephony experimentation | Can a dedicated, isolated service support practical voice-network learning? |
| Improved disaster recovery exercises | How can restoration tests become more measurable and reproducible? |
| Home Assistant dashboard | Would a dedicated household display add enough value to justify maintenance? |

## Ideas completed or incorporated elsewhere

A Proxmox cluster, Docker media services, AdGuard DNS, Home Assistant, Grafana/Prometheus, Wazuh and a Hyper-V cyber-range are already deployed. Their presence here in earlier revisions reflected **plans at that time**, not the present state.

The VM CPU compatibility lesson from the early UniFi controller deployment is retained in the [Decision Log](06-decision-log.md) rather than as an unresolved future idea.

Ideas become roadmap items only when there is a clear purpose, an appropriate test environment and measurable evidence of success.
