# CMR Lab Decision Log

## Purpose

This register records consequential engineering choices, their context and their outcomes. It captures **why** the lab changed. Current configuration belongs in the [Architecture](03-architecture.md), while the dated sequence belongs in [Lab Evolution](10-lab-evolution.md).

Dates reflect available project evidence; month-level entries avoid invented precision. A decision can be superseded without making its original reasoning irrelevant.

## Decision register

| Date or period | Decision | Reason | Outcome |
| --- | --- | --- | --- |
| 3 June 2026 | Adopt GitHub and Markdown documentation | Preserve decisions and enable reviewable changes | Established; public reference now separated from private operational detail |
| Early June 2026 | Validate existing hardware before buying replacements | Determine usable capacity from equipment on hand | Dell OptiPlex 7010 SFF selected as the core virtualisation system |
| 6 June 2026 | Deploy Proxmox VE on the OptiPlex | Separate services from the workstation and make VM administration repeatable | Implemented |
| 7 June 2026 | Move UniFi management into a dedicated VM | Reduce dependence on a general-purpose PC | Implemented; a CPU presentation adjustment resolved a MongoDB compatibility problem |
| June 2026 | Use a distinct Docker services VM | Separate household applications from infrastructure and wireless control | Implemented |
| 10 June 2026 | Adopt Docker Compose as the primary service definition model | Reduce configuration drift and simplify repeatable deployment | Implemented for principal application stacks |
| 10 June 2026 | Introduce Ansible health checks | Reduce repetitive manual observation | Initial health-check workflow built; later automation work remains incremental |
| June 2026 | Introduce scheduled virtual-machine backups | Begin formalising recovery practices | Backup scheduling introduced; recovery assurance is treated as a separate validation activity |
| 11 June 2026 | Adopt AdGuard Home and dedicated service naming | Replace fragile dependence on remembered addresses and ports | First implemented on the management VM |
| 12 June 2026 | Use Tailscale for authorised remote access | Access internal services without directly exposing them to the internet | Implemented; hosting arrangement subsequently changed |
| 12 June 2026 | Introduce private PKI and selected internal HTTPS | Support secure application contexts for internal services | Implemented for selected services |
| June 2026 | Prioritise operating and documenting deployed services over raw service count | Maintainability matters more than rapid expansion | Continuing principle |
| July 2026 | Build a separate internal MkDocs workspace | Keep operational notes useful and independently editable | Local working documentation established; public GitHub is a separately reviewed record |
| August 2026 | Move primary DNS to a Raspberry Pi and maintain a secondary resolver | Separate a core utility from the primary hypervisor | Implemented and resolver failover tested |
| August 2026 | Move Tailscale's network utility role onto a dedicated Raspberry Pi | Reduce reliance on the core VM for this access function | Implemented |
| August–September 2026 | Expand Proxmox with repurposed ThinkPads | Reuse available compute for different operational requirements | Three-node cluster implemented; placement follows practical capacity |
| September 2026 | Assign observability, home automation and Wazuh to appropriate Proxmox nodes | Balance service continuity and resource limitations | Implemented; original dedicated SOC-node concept adapted |
| September 2026 | Build an independent Hyper-V cyber-range on the Windows workstation | Use spare capacity for attacker, victim and defender experiments | Domain, test endpoint, Kali and controlled gateway established; initial security telemetry captured |
| September 2026 | Retain the existing gateway after exploratory replacement testing | Prioritise stable household networking | Legacy gateway remains active; replacement is a future evaluation |
| October 2026 | Reconcile the public repository against actual deployments | June documentation no longer represented the entire environment | Current-state documents refreshed; history and operational detail assigned separate responsibilities |

## Expanded engineering decisions: August–September

### Expand with two repurposed laptops instead of replacing the core host

**Context:** The initial single-host design had little space for simultaneous household workloads, security tools and observation systems. Two ThinkPads were available.

**Choice:** Add the T440p and T450 as additional Proxmox nodes, after checking installation compatibility, networking and cluster readiness.

**Alternatives considered:** Continue on one machine or dedicate the laptops solely to separate non-clustered security experiments. The latter would have simplified separation but reduced the opportunity to operate a clustered platform and constrained capacity.

**Outcome:** A three-node cluster was verified quorate after the SOC2 reinstall/rejoin in August. This provided distinct places for monitoring, automation and Wazuh, but did not imply shared storage or automated recovery of guests.

### Place day-to-day services ahead of the original red/blue node labels

**Context:** SOC1 and SOC2 were originally conceived as red/blue security nodes. Monitoring, home automation and Wazuh each had practical resource needs.

**Choice:** Place Prometheus/Grafana and Home Assistant on SOC1, Wazuh on SOC2 and the attacker/victim range on an independent Hyper-V workstation.

**Outcome:** Household and experimental responsibilities became clearer. Keeping the original SOC hostnames is a historical naming choice, not evidence that both laptops host attack machines.

### Adopt a primary/secondary DNS design without assuming full high availability

**Context:** Early lab DNS depended on a virtual machine sharing the core Proxmox host with other infrastructure.

**Choice:** Use a Raspberry Pi for primary AdGuard Home and retain a secondary resolver on the management VM; configure synchronisation and test equivalent resolution behaviour.

**Outcome:** Both resolvers returned consistent internal results during August testing; failover was subsequently exercised. Resolver redundancy does not mean that all lab applications fail over.

### Retain the Linksys gateway after USG instability

**Context:** September gateway tests revealed intermittent WAN configuration issues followed by an apparent hardware/power failure.

**Choice:** Restore and retain the previously working Linksys gateway rather than commit the household network to unstable trial equipment.

**Outcome:** Gateway replacement remains a future evaluation, and the observed failure is preserved in [Incidents](11-incidents.md).

### Use a tested external NIC on SOC1 rather than accept a degraded link

**Context:** The built-in Ethernet negotiated at approximately 10 Mb/s, limiting practical monitoring and virtualisation usefulness.

**Choice:** Validate an external USB Gigabit adapter and use it as the bridge's physical uplink.

**Outcome:** Link negotiation reached 1 Gb/s through the Realtek `r8152` path. This was a pragmatic repair, not proof of the exact fault inside the original jack or controller.

## Technical lessons that affected decisions

### Application compatibility

During the UniFi controller migration, MongoDB failed to start with an illegal-instruction condition under the initial virtual CPU presentation. Adjusting the virtual CPU setting resolved the observed compatibility issue. The lesson is to validate the instruction set exposed to a virtual machine rather than treating application failure as necessarily a package fault.

### Resource-aware architecture

The original security-node concept was attractive on paper, but the additional workloads exceeded what the available laptops could comfortably provide. The design adapted: monitoring and home automation use one node, Wazuh another, and a separate Hyper-V host supports the experimental Windows/Linux range.

### Useful services are not disposable experiments

Home Assistant and network utilities support actual household usage. Their operational importance shaped where services were placed and how changes were approached.

## Decision-record practice

New entries should describe the context, options considered, selection, evidence and resulting change. Status should be reviewed when a decision is superseded. Sensitive addresses, authentication configuration, access-control rules and private recovery dependencies belong in restricted operational records, not this register.

## Related documentation

- [Architecture](03-architecture.md)
- [Roadmap](05-roadmap.md)
- [Lab Evolution](10-lab-evolution.md)
- [Incidents](11-incidents.md)
