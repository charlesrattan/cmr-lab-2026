# CMR Lab 2026 Roadmap

## Purpose

This roadmap documents the evolution of CMR Lab from an informal home technology environment to a structured enterprise-style infrastructure simulation platform.

It records completed milestones, defines the current phase of work and establishes future priorities.

The roadmap is intended to provide direction while ensuring that new services do not outpace documentation, operational maturity or recoverability.

---

# Strategic Goal

Create a stable, documented and maintainable infrastructure platform that develops practical skills in:

* Systems administration
* Networking
* Cybersecurity
* Automation
* Governance
* Documentation
* Operations

while supporting selected personal and family services where appropriate.

---

# Completed Milestones

| Phase   | Milestone                                                                      | Status   |
| ------- | ------------------------------------------------------------------------------ | -------- |
| Phase 0 | Baseline inventory and project initiation                                      | Complete |
| Phase 1 | Hardware recovery and OptiPlex validation                                      | Complete |
| Phase 2 | Proxmox deployment on `cmr-srv-01`                                             | Complete |
| Phase 3 | UniFi Controller migration to VM110                                            | Complete |
| Phase 4 | Docker services platform deployment on VM120                                   | Complete |
| Phase 5 | Homepage, Portainer, Uptime Kuma, Vaultwarden and Nginx Proxy Manager deployed | Complete |
| Phase 6 | VM100 established as management and automation platform                        | Complete |
| Phase 7 | AdGuard Home deployed and `cmrlab.internal` namespace implemented              | Complete |

---

# Current Phase

## Operations and Governance

The lab has successfully established a virtualization, automation, monitoring and service discovery baseline.

The current phase focuses on improving operational maturity.

The objective is to ensure the platform is:

* Understandable
* Maintainable
* Recoverable
* Documented
* Repeatable

before significant new services are introduced.

### Current Priorities

| Priority | Task                                                     | Status      |
| -------: | -------------------------------------------------------- | ----------- |
|        1 | Complete documentation refactor and repository alignment | In Progress |
|        2 | Expand and formalize operations runbook                  | In Progress |
|        3 | Resolve Ansible privileged update workflow               | Pending     |
|        4 | Define HTTPS strategy for internal services              | Pending     |
|        5 | Validate backup and restoration procedures               | Pending     |
|        6 | Review home network DNS strategy and AdGuard adoption    | Pending     |

### Success Criteria for Current Phase

The Operations and Governance phase will be considered complete when:

* Documentation accurately reflects the environment
* Operational procedures are documented
* Backup and restore processes are validated
* Routine maintenance tasks are automated where practical
* Internal services are consistently accessible
* Architectural decisions are properly documented

---

# Future Phase

## Service Expansion

Once the Operations and Governance phase is complete, the lab may expand in a controlled manner.

Potential future services include:

* Jellyfin
* Home Assistant
* Grafana
* Prometheus
* Wazuh
* Local AI experimentation

New services should only be introduced when they provide learning value, operational value or support the mission of the lab.

---

# Future Phase

## Infrastructure Maturity

Future infrastructure improvements may include:

* Gateway modernization
* Network segmentation
* VLAN implementation
* Managed switching
* Enhanced monitoring and observability
* Expanded backup capabilities
* Improved security controls

These improvements should focus on operational quality rather than complexity for its own sake.

---

# Long-Term Vision

By December 2026, CMR Lab should demonstrate:

* Stable virtualization infrastructure
* Centralized service discovery
* Reliable monitoring and alerting
* Documented operational procedures
* Validated backup and recovery workflows
* Practical automation
* Secure remote access
* Professional-quality documentation
* A clearly documented infrastructure journey suitable for portfolio presentation

---

# Roadmap Status

Current Phase: Operations and Governance

Overall Direction: Stabilize → Document → Automate → Expand

The lab has successfully transitioned from a rebuild project into an operational infrastructure platform. Future growth should be guided by maturity rather than service count.
