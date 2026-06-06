# CMR Lab 2026 - Decision Log

## Purpose

This document records important decisions made during the CMR Lab 2026 rebuild.

---

## Decisions

| Date | Decision | Reason | Status |
|---|---|---|---|
| 2026-06-03 | Use GitHub as the source of truth for lab documentation | Provides version control, portability and professional documentation practice | Accepted |
| 2026-06-03 | Use VS Code as the primary editor | Supports Markdown, Git, scripting and future infrastructure-as-code work | Accepted |
| 2026-06-03 | Use Git for version control | Builds professional workflow habits and protects documentation history | Accepted |
| 2026-06-03 | Keep architecture decisions evidence-based | Hardware must be tested before being assigned permanent roles | Accepted |
| 2026-06-04 | Designate recovered Dell OptiPlex 7010 SFF as primary Proxmox candidate | POST, BIOS access, CPU, storage and diagnostics were successfully validated | Accepted |
| 2026-06-05 | Move CMR Lab from hardware validation to Proxmox readiness | Server build completed with 20 GB RAM, 500 GB SSD, 1 TB HDD and wired lab network established | Accepted |
| 2026-06-06 | Deploy Proxmox VE on `cmr-srv-01` | The OptiPlex 7010 SFF was validated, upgraded, connected to wired lab infrastructure and confirmed suitable as the primary hypervisor | Accepted |
| 2026-06-06 | Use Proxmox as primary infrastructure platform | Cloud Key Gen1 successfully recovered but considered legacy hardware with limited upgrade path | Accepted |
