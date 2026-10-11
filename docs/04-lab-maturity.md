# CMR Lab Maturity Assessment

## Purpose

Maturity is the extent to which a capability can be operated, explained, verified and improved—not merely whether its software is installed. This assessment is a qualitative snapshot of the CMR Lab project as documented in **October 2026**.

The original June 2026 assessment used a five-point scoring scale. Those numbers remain part of the repository's history, but repeating or incrementing them without a consistent test rubric would imply a precision that the evidence does not support.

## Evidence model

| Evidence level | Meaning |
| --- | --- |
| Introduced | The technology or procedure was deployed or first configured |
| Observed | Its behaviour was inspected through logs, metrics, a client or a test |
| Validated for a defined task | A specified operation produced the expected result |
| Repeatable | The method and expected results are documented well enough to repeat |
| Recovery validated | A defined restoration or failure exercise was performed and assessed |

These levels describe evidence about **specific activities**, not a universal grade attached to an entire technology.

## Capability assessment

| Capability | Demonstrated evidence | Further learning direction |
| --- | --- | --- |
| Hardware and virtualisation | Three-node Proxmox VE environment and separate Hyper-V experiment range established | Capacity interpretation, host lifecycle and reproducible builds |
| Network operations | Managed switching and wireless services administered; gateway trials evaluated | Controlled change evaluation and measured networking improvements |
| Internal DNS | Primary/secondary resolver architecture and failover behaviour tested | Maintain repeatable resolver verification |
| Remote connectivity | Dedicated Raspberry Pi utility with Tailscale-based access | Document validation methods for authorised remote workflows |
| Application hosting | Multiple Docker Compose projects and household services deployed; selected workflows tested | Extend application-level functional checks and operations guidance |
| Observability | Prometheus/Grafana, Uptime Kuma, cAdvisor and network-device metrics introduced | Improve dashboard usefulness and correlate different evidence sources |
| Security monitoring | Wazuh telemetry observed from an independent Hyper-V cyber-range | Conduct and document complete experiment cycles |
| Automation | Ansible health-check examples and Ubuntu baseline script created | Validate and refine automation for defined, non-disruptive tasks |
| Documentation | Current-state inventory, architecture, service descriptions and chronology maintained in Git | Keep evidence linked to decisions and reviewed changes |
| Recovery engineering | Scheduled backup practices and configuration archives established | Design and document reproducible restoration exercises |

The table deliberately does not translate an installed component into a blanket claim of resilience, detection coverage or end-to-end validation.

## Dated supporting evidence

| Period | Verified example | Scope of the finding |
| --- | --- | --- |
| 15 August | Three Proxmox nodes with quorum following SOC2 recovery | Cluster membership; not guest high availability |
| 14–18 August | AdGuard primary/secondary internal DNS parity and scheduled synchronisation | Resolution behaviour; not universal service failover |
| 16–18 August | Nine monitored hosts, successful Prometheus scrapes and initial Grafana dashboards | Metrics pipeline; monitoring design still developing |
| 29–30 August | SOC1 reboot followed by running monitoring and Home Assistant VMs | Demonstrated startup in one exercise; not a full restoration test |
| September | SOC1 external link verified at 1 Gb/s after onboard 10 Mb/s negotiation | Validated workaround; root cause not fully diagnosed |
| 19–26 September | Windows domain, client firewall observations and Wazuh authentication alerts | Selected test/telemetry evidence; full defensive cycle outstanding |

The assessment avoids assigning a numerical score to a technology simply because it was installed. Each evidence entry supports only the activity actually observed.

## Learning priorities

The next maturity improvements should be practical and measurable:

1. Choose specific operating questions that monitoring panels should answer.
2. Turn one cyber-range scenario into an evidence-based test, observation and retest report.
3. Define bounded recovery exercises and record expected versus observed behaviour.
4. Maintain consistent deployment and change records.
5. Refine automation only after the manual procedure is understood.

## Assessment history

| Period | Approach |
| --- | --- |
| June 2026 | Initial five-point scoring exercise and operations-phase orientation |
| October 2026 | Evidence-oriented qualitative review reflecting the expanded infrastructure |

Future assessments may reintroduce numerical scoring if criteria, measurement sources and repeatability requirements are defined in advance.

See the [Roadmap](05-roadmap.md) and [Lab Evolution](09-lab-evolution.md).
