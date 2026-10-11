# Documentation Approach

## Purpose

CMR Lab maintains different records for different questions. A current-state inventory cannot replace a chronology, and a public technical reference cannot safely contain every operational detail required to administer a live environment. The historical public runbook has been retired; full environment-specific procedures are kept outside this repository.

The goal is to preserve evidence and reproducibility while making the material understandable to readers outside the lab.

## What each document means

| Type | Purpose | Maintenance rule |
| --- | --- | --- |
| Current-state reference | Describe the implemented inventory, architecture and services | Update when the implementation changes |
| Historical record | Explain dated events, decisions, experiments and incidents | Preserve superseded approaches as history |
| Roadmap | Explain what has been demonstrated and what might come next | Keep deployed and proposed capabilities distinct |
| Restricted handbook | Retain commands, configuration, access methods and environment-specific procedures | Keep private and independently backed up |

## Evidence vocabulary

Use precise terms:

- **Planned:** proposed or scheduled, not implemented.
- **Deployed:** installed or configured.
- **Observed:** behaviour or output was captured.
- **Validated:** a specific intended workflow was tested and passed.
- **Repeatable:** a documented method can be followed again.
- **Recovery-tested:** restoration was performed and evaluated.

A successful installation is not an uptime guarantee. A working dashboard is not comprehensive monitoring. A checksum file is not a restoration test.

## Chronological accuracy

Use an exact date when a dated log or record supports it. Otherwise use a month or date range. Identify proposed work as proposed, and distinguish observations from interpretation. Where the original evidence is incomplete, omit invented detail.

The [Lab Evolution](10-lab-evolution.md), [Decision Log](06-decision-log.md), [Changelog](../CHANGELOG.md) and [Incidents](11-incidents.md) provide complementary historical views.

## Publication boundary

Public records can contain technologies, generic architectures, non-sensitive equipment models, selected commands and lessons that are reproducible in an independent environment.

Restricted records should hold live internal addressing, administrative service URLs, authentication details, tokens, private keys, access-policy specifics, personal data, complete backup destinations, sensitive topology and unresolved operational vulnerabilities.

Before publication, examine Markdown, diagrams, script samples, logs, screenshots, filenames and commit diffs. An earlier commit can remain accessible even when later revisions remove its contents. Publication therefore requires review **before** committing, not only before merging.

## Review workflow

1. Compare the proposed account with source evidence and the current lab state.
2. Identify whether the material is current, historical or planned.
3. Remove or generalise sensitive operational details without falsifying the engineering lesson.
4. Verify Markdown links and diagrams.
5. Review the proposed diff.
6. Publish an approved change and retain Git history.
7. Reconcile linked references if a document is renamed.

This process governs the *documentation*. It does not authorise changing the running lab to make prose easier to write.
