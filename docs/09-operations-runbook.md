# CMR Lab Operations Runbook

## Scope

This is the **public, reusable operations framework** for CMR Lab. It describes safe observation, change preparation, incident diagnosis and evidence collection. Environment-specific administration commands, internal endpoints, access settings, certificate material and recovery secrets are maintained in a separate restricted operational handbook.

The [Architecture](03-architecture.md) shows the current system relationships; [Services Platform](08-services-platform.md) explains application responsibilities; [Incidents](11-incidents.md) preserves selected historical investigations.

## Routine observation

A short, consistent review is more valuable than repeatedly opening every dashboard without a question to answer.

| Area | Questions to investigate | Example evidence |
| --- | --- | --- |
| Physical and network | Are links negotiating as expected? Have devices restarted or lost connectivity? | Interface state and network-device metrics |
| Virtualisation | Are expected virtual machines running? Have allocations or host resources changed? | Proxmox resource views and VM status |
| Applications | Are containers running and do selected user workflows actually work? | Compose state, health checks and functional tests |
| Name resolution | Do internal services resolve using the intended resolver? | DNS query results captured privately |
| Monitoring | Are graphs current, meaningful and consistent with other observations? | Metrics timestamps and event correlation |
| Security experiments | Is telemetry arriving from the designated test systems? | Sanitised event counts and experiment notes |
| Recovery | Are current backup records and test evidence available for review? | Restricted backup and restoration records |

### Read-only inspection examples

These commands demonstrate general observation techniques. They require the appropriate tool and permissions and are not a substitute for an environment-specific procedure.

```bash
# On a Proxmox host: inspect configured virtual machines.
qm list

# On a Linux guest: observe host capacity and network state.
uptime
free -h
df -hT
ip -br link

# On a Docker host: view application state.
docker ps
docker compose ps

# Inspect recent service logs without changing configuration.
journalctl --since "1 hour ago" --no-pager
```

Command output can contain private hostnames, addresses, user identities and tokens. Review and redact evidence before publishing it.

## Change procedure

1. **State the objective.** Describe the problem or improvement in terms of observable behaviour.
2. **Identify the scope.** Distinguish household services, infrastructure utilities and disposable test systems.
3. **Record a baseline.** Capture relevant configuration references and measurements in private records.
4. **Assess dependencies.** Understand what will be affected if a host, resolver, switch or application becomes unavailable.
5. **Plan rollback.** A snapshot, configuration copy or other recovery measure should be chosen for the actual change, not assumed to work universally.
6. **Execute in a bounded window.** Avoid unrelated changes during diagnosis.
7. **Verify at multiple levels.** Test not only the process but the intended user function.
8. **Preserve evidence.** Update the decision, incident, change and current-state records as appropriate.

A Proxmox snapshot is not equivalent to an off-host backup or a tested restore. Different layers of the system may require different recovery methods.

## Diagnosing an incident

### Start with symptoms, not a presumed cause

Record the first observed failure, affected services, common dependencies, relevant timestamps and any recent changes.

A useful sequence is:

1. Confirm whether the issue affects one application, one guest, several guests or the wider network.
2. Compare basic link and host availability with service-level observations.
3. Check DNS and access-path behaviour separately from application health.
4. Inspect logs and metrics from the same time window.
5. Apply the smallest justified corrective action through the private operating procedure.
6. Confirm service restoration with an actual workflow.
7. Record what the evidence supports and what remains unknown.

Do not treat a recent application deployment as the cause of an infrastructure-wide outage without corroborating evidence. The [June 2026 incident](11-incidents.md) illustrates this distinction.

### Classify results precisely

- **Observed:** Logs or monitoring showed a condition.
- **Correlated:** Two events occurred together.
- **Identified mechanism:** Evidence explains how the failure occurred.
- **Confirmed root cause:** A finding is sufficiently tested and supported.
- **Resolved:** The intended function was restored and checked.
- **Preventive action:** A proposed control or procedure, not evidence that it is already effective.

## Recovery exercises

A backup schedule, completed archive, valid checksum and successful restoration are different observations. For a recovery exercise:

1. Define the system and data to restore.
2. State the expected restoration behaviour and acceptance criteria.
3. Choose an isolated or otherwise safe test setting.
4. Preserve the source evidence and necessary dependencies.
5. Perform the test using restricted environment-specific instructions.
6. Record actual results, limitations and improvements.

Do not conduct a destructive restore against everyday household services merely to satisfy a documentation milestone.

## Automation and scripts

The repository includes historical Ansible examples and an Ubuntu setup script under [scripts](../scripts/). They are learning artefacts and **are not represented as tested, universally safe production automation**. Read and adapt them before execution. In particular, an update playbook and an operating-system bootstrap script can make system changes.

The current running configuration and credentials are not supplied through this public repository.

## Documentation updates

When a system changes, revise only the records affected by that change:

- [Asset Register](02-asset-register.md) for the current equipment or workload inventory
- [Architecture](03-architecture.md) for platform relationships
- [Services Platform](08-services-platform.md) for applications and responsibilities
- [Decision Log](06-decision-log.md) for rationale
- [Lab Evolution](10-lab-evolution.md) or [Changelog](../CHANGELOG.md) for chronology
- [Incidents](11-incidents.md) for publishable learning from failures

For how supporting evidence is classified and published, see the [Documentation Approach](12-documentation-approach.md).
