# CMR Lab Evolution

## From useful equipment to an intentional laboratory

CMR Lab did not begin with a clean architectural blueprint or a rack of newly purchased servers. It grew from household technology, spare computers, a wireless network and curiosity about what could be achieved with equipment already on hand.

The defining change in 2026 was not a particular installation. It was a change of method: **inventory what exists, test its capabilities, assign clear responsibilities, observe the results and retain the reasoning behind decisions**.

This is a historical record. For what is currently deployed, consult the [Asset Register](02-asset-register.md) and [Architecture](03-architecture.md). The dates below are drawn from project records and conversations; approximate periods are labelled accordingly.

## June 2026 — Rebuilding the foundation

### 3–5 June: Inventory before procurement

The first task was to understand a mixed environment that included a Linksys router, UniFi wireless access point, a MacBook previously used for Ubuntu services, Raspberry Pis and several older computers. Working devices and spare equipment were recorded separately.

Available Dell OptiPlex computers were inspected. The OptiPlex 7010 SFF became the selected virtualisation host after hardware and storage checks. Existing cabling and switches were used to move the lab towards wired connectivity.

**Lesson:** An inventory is only useful when it informs a decision. Repurposed equipment can deliver genuine capability, but its constraints must shape the design.

### 6–7 June: Proxmox and a dedicated network controller

Proxmox VE was installed on the selected OptiPlex. Ubuntu virtual machines began taking responsibilities that had previously been mixed across physical machines. The UniFi Network Application was moved into a dedicated VM and the access point was adopted into the new controller.

An initial MongoDB startup failure proved to be related to virtual CPU compatibility, not simply to the application installation. A corrected CPU presentation resolved the observed issue.

**Lesson:** Virtualisation adds flexibility, but it also introduces details that must be understood and tested.

### 7–10 June: Containerised applications and management

A separate application VM provided Docker hosting for Homepage, Portainer, Uptime Kuma, Nginx Proxy Manager and Vaultwarden. Docker Compose became the preferred way to describe related services. A management VM was established for utilities and initial Ansible health checks.

Not every maintenance task became automated. The first Ansible scripts demonstrated useful observations while more ambitious privileged-update routines remained work in progress.

**Lesson:** A running service and an operational process are different achievements.

### 11–12 June: Names, remote access and certificates

AdGuard Home introduced consistent internal name resolution, while the reverse proxy offered simpler entry points to selected services. Tailscale provided authorised remote connectivity. An internal certificate authority enabled HTTPS for applications requiring secure contexts, including Vaultwarden.

At this stage DNS and remote-access functions were closely associated with the management VM. Their later relocation demonstrates how architecture changes as dependencies become clearer.

**Lesson:** DNS, service access and certificates are related disciplines; reliable behaviour requires understanding their interaction.

### 14 June: Media deployment and an infrastructure incident

Jellyfin and supporting media applications were added and an early request-to-download path was demonstrated. During the same period, the lab experienced a broader connectivity outage. Investigation found repeated network-adapter watchdog errors on the Proxmox host. Restoring the host clarified that the incident had been misleadingly associated with recently deployed media services.

The media VM also underwent a storage adjustment after a capacity-related application problem.

**Lesson:** Temporal coincidence is not root-cause evidence. Examine infrastructure dependencies before blaming the newest application. See [Incidents](11-incidents.md).

## July 2026 — Documentation as an operational tool

By late July the lab's information was spread across build conversations and a public repository that already lagged behind the implementation. A local MkDocs workspace was created to support a usable internal handbook. Its purpose was different from that of GitHub: internal procedures could remain detailed, while public records required deliberate review.

**Lesson:** Technical documentation has different audiences. A rebuild guide and an externally shared engineering portfolio need not expose the same operational details.

## Early August 2026 — Building the Proxmox cluster

### 3–4 August: Two laptops become virtualisation nodes

The Lenovo ThinkPad T440p (`lenovo-soc-01`) and T450 (`lenovo-soc-02`) were evaluated as additional Proxmox hosts. The T450 installation encountered an obstacle associated with the firmware's VT-d setting; disabling VT-d allowed the installation to proceed. By 3 August, the nodes had been brought to a consistent Proxmox 9.2.x baseline, with host naming, network reachability, remote administration and laptop sleep behaviour checked.

The new `cmrlab` cluster was formed across the core OptiPlex and the two laptops. Proxmox clustering linked management and membership; it did **not** magically make all storage shared or establish automatic guest failover.

### 14–15 August: SOC2 rebuild and deliberate rejoin

The T450 underwent a reinstall/recovery exercise. Before rebuilding it, important node configuration was recorded and an off-host copy of recovery information confirmed. The recovery deliberately avoided blindly replacing the cluster-managed configuration directory with files from an earlier installation. After reinstalling and reconnecting the node, `pvecm status` confirmed **three nodes with quorum** on 15 August.

These events illustrated the difference between restoring access to one machine and restoring its correct place in a distributed management system.

### 29–30 August: Stable workload assignments

By 29 August, SOC1 was hosting VM130 (`monitoring-01`) and VM140 (`home-assistant-01`) with automatic guest startup configured. A subsequent SOC1 reboot confirmed that cluster quorum was maintained and both VMs returned to a running state. SOC2 was prepared for the separate Wazuh security-monitoring role rather than hosting the entire security testing range.

The original shorthand names **SOC1** and **SOC2** therefore became hardware identifiers, not strict descriptions of every running workload.

**Lesson:** A cluster's most valuable learning opportunities include compatibility, workload placement, recovery and verification—not simply its node count.

## August 2026 — Network utility separation

### Primary and secondary DNS

DNS was further developed into a primary AdGuard service on a Raspberry Pi and a secondary resolver on a management VM. Configuration synchronisation and resolution testing were carried out; a resolver-failover exercise was also demonstrated.

This separated a core network utility from the main virtualisation host while retaining a second resolver.

### Dedicated remote-access utility

A second Raspberry Pi took on Tailscale network-access responsibilities. This revised an earlier design in which remote access depended on the management VM. It was a pragmatic separation of concerns, not a claim of automatic application high availability.

### Extending existing compute

Two repurposed ThinkPads were incorporated into the Proxmox environment. The new cluster made it possible to host more specialised workloads and learn cluster administration, although the laptops' available capacity constrained where those workloads could run.

**Lesson:** Independence, redundancy and automated failover are distinct architectural properties.

### 16–18 August: Observability becomes measurable

Prometheus, Node Exporter and Grafana were running on `monitoring-01`. On 16 August the monitoring inventory comprised **nine hosts**, spanning the core Proxmox machine, both Lenovo nodes, infrastructure VMs and two Raspberry Pi utilities. Prometheus targets and host measurements were checked; initial Grafana views addressed cluster state, virtual machines, storage and backup coverage. The distinction between a working metric pipeline and a mature dashboard remained important.

By 18 August, AdGuard configuration synchronisation had also been established from the Raspberry Pi primary to the management VM secondary on a recurring schedule. Resolver consistency and later failover observations were separate validation steps.

## September 2026 — Observability and an independent cyber-range

### Monitoring and security telemetry

The expanded Proxmox nodes came to host Prometheus/Grafana monitoring, Home Assistant and Wazuh. Managed-switch metrics and host monitoring broadened observability. Home Assistant became an everyday household service, integrated with existing smart-home systems.

The initial idea of dedicating entire laptops to offensive and defensive experimentation was revised. Monitoring and household services had real resource requirements that mattered more than the original labels attached to the machines.

### A separate Hyper-V experiment environment

The Windows engineering workstation had spare capacity and provided a more suitable place to build a contained cyber-range. Hyper-V hosted a Windows domain controller, a Windows client, Kali Linux and a controlled gateway. Wazuh began receiving relevant security events, including endpoint telemetry.

The goal is a documented cycle of **test → observe → document → harden → retest**. Establishing domain services and telemetry was the foundation for that cycle, not evidence of a completed attack-and-defence study.

### 18–26 September: Windows security experimentation

The Windows workstation's Hyper-V environment hosted a Kali Linux testing VM, a Windows domain controller, a Windows client and, later, a controlled gateway. Domain services and DNS were demonstrated on 19 September. On 24 September, network observations showed different exposure profiles: expected domain services on the controller versus filtered probes against the Windows client.

On 25 September, failed local authentication attempts on the Kali test system produced Wazuh alerts, including rule identifiers **5557** and **5503**. This was evidence of a specific log-collection and detection path; it was not a completed exploitation or defensive retest. The following day, a dual-homed Debian gateway configuration advanced controlled connectivity between the isolated range and authorised supporting systems.

### Networking experiments and maintenance

A candidate gateway was trialled during September but did not become the household's long-term router. The existing Linksys equipment remained in service. During 12–14 September, a tested UniFi Security Gateway experienced WAN address-management difficulties (temporarily mitigated using a static setting) before a later apparent hardware/power fault ended the trial. The subsequent recovery decision favoured household stability over continued gateway experimentation.

Another Proxmox node, SOC1, showed a negotiated link of approximately **10 Mb/s** through its built-in Intel Ethernet path. Testing an external Realtek-based USB Ethernet interface, supported by the Linux `r8152` driver, established a stable **1 Gb/s** link. The virtualisation bridge was moved to the validated interface, and the node's connectivity was confirmed. The lesson was about measured link behaviour, not merely replacing hardware until a problem disappeared.

**Lesson:** Functional household services set a useful boundary on experimentation. A technically interesting change must still be judged by its operational outcome.

## October 2026 — Reconciling evidence and the public record

By October the lab had outgrown the original June documentation. A review of VM placement, container inventory, DNS and remote access, monitoring, cyber-range systems and backups revealed where written claims were stale or overconfident.

The public documentation was reorganised around distinct questions:

| Record | Question answered |
| --- | --- |
| [Asset Register](02-asset-register.md) | What is deployed now? |
| [Architecture](03-architecture.md) | How do the deployed systems fit together? |
| [Services Platform](08-services-platform.md) | What applications are hosted and what do they do? |
| [Decision Log](06-decision-log.md) | Why were choices made? |
| [Roadmap](05-roadmap.md) | What is demonstrated and what remains ahead? |
| [Incidents](11-incidents.md) | What failed, what was observed and what was learned? |
| This document | How did the project reach its present form? |

Chronology is retained without confusing old plans with live configurations. Sensitive operational details are kept outside the public record. In October the generic public runbook was retired rather than continuing to maintain an incomplete set of sensitive operating procedures in a public repository.

## Themes that recur

- **Reuse before replacement.** Understand the strengths and limits of available hardware.
- **Separate responsibilities thoughtfully.** Distinct systems improve understanding but increase operational complexity.
- **Observe rather than assume.** A deployed component is not automatically an end-to-end validated workflow.
- **Adapt the architecture to evidence.** Resource limits and real household requirements are valid reasons to revise the design.
- **Maintain the historical record.** Superseded configurations remain useful as dated evidence, not as instructions for the present.
- **Build skills through complete cycles.** The value of the lab is in decisions, failures, investigation, improvement and reproduction.

## Looking ahead

CMR Lab continues to develop its monitoring, recovery validation, automation and cyber-range experiments. The objective is not the largest possible stack, but an environment that remains useful and whose engineering choices can be explained and demonstrated.
