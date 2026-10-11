# CMR Lab Roadmap

## Purpose

The roadmap distinguishes milestones already demonstrated in CMR Lab from work under development and longer-term ambitions. The [Architecture](03-architecture.md) and [Asset Register](02-asset-register.md) describe the current implementation; [Lab Evolution](10-lab-evolution.md) provides the chronology.

The guiding objective is to develop practical infrastructure, security and operational judgement using equipment already available, without allowing experimentation to undermine services needed by the household.

## Milestones

| Period | Milestone | Evidence and outcome |
| --- | --- | --- |
| June 2026 | Inventory and hardware validation | Original equipment assessed and primary Proxmox host selected |
| June 2026 | Core virtualisation and services | Management, UniFi and Docker workloads separated into virtual machines |
| June 2026 | Internal service delivery | Dashboard, container management, service monitoring, password vault, reverse proxy and media applications deployed |
| June 2026 | Initial automation and remote access | Ansible health-check work, Tailscale connectivity, DNS naming and an internal certificate authority established |
| July 2026 | Operational documentation workspace | A separate, local MkDocs documentation environment created for working notes |
| August 2026 | Network utility separation | Primary and secondary AdGuard resolvers and dedicated Raspberry Pi remote-access utility established |
| 3–15 August 2026 | Expanded virtualisation | T440p/T450 joined the Proxmox cluster; the SOC2 reinstall/rejoin and three-node quorum were verified |
| 16–18 August 2026 | Initial observability | Prometheus, Node Exporter and Grafana were active, nine host targets were monitored and initial dashboard views developed |
| August–September 2026 | Household and security workloads | Home Assistant on SOC1 and Wazuh on SOC2 were established; integrations and alert interpretation developed |
| 19–26 September 2026 | Independent cyber-range | Hyper-V Windows domain, endpoint, Kali workstation and controlled gateway established; domain behaviour and Wazuh alerts observed |
| October 2026 | Documentation reconciliation | Asset Register, Architecture, Services Platform and README updated against verified evidence |

Milestone dates are based on project records and lab conversations; a month or range is used where the exact completion day was not established. Deployment means a system was established, not that every possible use case or recovery scenario was tested.

The August Proxmox expansion and monitoring milestones are recorded separately from the September Wazuh and cyber-range experiments. This prevents the broad implementation periods from obscuring the earlier monitoring work.

## Current direction: operate, observe and verify

| Workstream | Current direction |
| --- | --- |
| Infrastructure | Maintain the deployed Proxmox and Hyper-V environments and improve workload visibility |
| Network services | Preserve dependable household connectivity while evaluating future gateway options |
| Monitoring | Refine dashboards, metrics interpretation and event investigation |
| Cyber-range | Complete repeatable test → observe → harden → retest exercises and document evidence |
| Recovery | Maintain restricted operating procedures and increase evidence from non-destructive restoration exercises |
| Automation | Revisit existing Ansible examples and add tested maintenance workflows selectively |
| Documentation | Keep current-state references, chronological records and private operations material aligned |

## Longer-term exploration

Local AI experimentation, deeper network segmentation, improved resilience and new security tooling remain possible directions rather than committed deployments. Expansion is driven by learning or operational value, available resources and a clear method for measuring results.

## Success criteria

Progress is assessed through evidence: a reproducible procedure, an observation, a tested outcome, a documented decision or a measurable improvement. Simply installing more applications is not sufficient.

See the [Maturity Assessment](04-lab-maturity.md) for an evidence-based view of capabilities and the [Decision Log](06-decision-log.md) for the rationale behind major changes.
