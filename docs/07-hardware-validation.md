# Hardware Validation

## Purpose

This document records the hardware validation activities performed during the CMR Lab rebuild.

Its purpose is to document how hardware was assessed, what decisions resulted from that assessment and which systems were ultimately selected for operational use.

This document serves as a historical validation record rather than a current inventory.

The current inventory of active infrastructure is maintained in:

```text
docs/02-asset-register.md
```

---

# Validation Objective

The objective of the hardware validation phase was to determine which available equipment could reliably support the long-term goals of CMR Lab.

The validation process focused on:

* Hardware functionality
* Stability
* Upgrade potential
* Suitability for virtualization
* Suitability for infrastructure workloads
* Availability of replacement parts

---

# Primary Hardware Evaluation

## Dell OptiPlex 7010 SFF

This platform became the primary infrastructure candidate following successful validation.

### Validation Results

| Check              | Result                           |
| ------------------ | -------------------------------- |
| POST               | Passed                           |
| BIOS Access        | Passed                           |
| CPU Detection      | Passed                           |
| Storage Detection  | Passed                           |
| Memory Detection   | Passed                           |
| Dell Diagnostics   | Passed                           |
| Hardware Stability | Passed                           |
| Final Outcome      | Selected as primary Proxmox host |

### Hardware Configuration

| Component         | Value                         |
| ----------------- | ----------------------------- |
| CPU               | Intel Core i7-3770 @ 3.40 GHz |
| RAM               | 20 GB DDR3                    |
| Primary Storage   | 500 GB SSD                    |
| Secondary Storage | 1 TB HDD                      |
| Boot Mode         | EFI                           |

### Notes

One DIMM slot appears to be faulty. The issue does not currently impact operational use and the platform remains stable.

---

# OptiPlex Recovery Outcome

Multiple OptiPlex units were inspected during the validation process.

### Outcome

| Device Group                     | Result                      |
| -------------------------------- | --------------------------- |
| Best-condition OptiPlex 7010 SFF | Selected for production use |
| Remaining OptiPlex units         | Converted to parts donors   |

This approach maximized usable hardware while minimizing additional expenditure.

---

# Wired Infrastructure Validation

The rebuild introduced a wired lab network to improve reliability and reduce dependence on wireless connectivity.

### Validation Results

| Device                          | Status                |
| ------------------------------- | --------------------- |
| Dell OptiPlex 7010 Proxmox Host | Connected             |
| Dell OptiPlex Micro Workstation | Connected             |
| TP-Link TL-SF1008P Switch       | Operational           |
| UniFi Security Gateway          | Connected for testing |
| UniFi Cloud Key Gen1            | Connected for testing |

### Outcome

The wired lab network was successfully established and became the foundation for subsequent virtualization and service deployment activities.

---

# Proxmox Validation

Following hardware validation, Proxmox VE was deployed and validated on the selected platform.

### Validation Results

| Check                    | Result     |
| ------------------------ | ---------- |
| Proxmox Installation     | Successful |
| Web Interface Access     | Successful |
| Hostname Configuration   | Successful |
| Repository Configuration | Successful |
| Updates Applied          | Successful |
| Reboot Validation        | Successful |
| Headless Operation       | Confirmed  |
| SSD Health               | Passed     |
| HDD Health               | Passed     |

### Platform Details

| Item          | Value              |
| ------------- | ------------------ |
| Hostname      | cmr-srv-01         |
| Platform      | Proxmox VE         |
| Management IP | 10.146.91.13       |
| CPU           | Intel Core i7-3770 |
| Logical CPUs  | 8                  |
| Memory        | 20 GB Installed    |

### Outcome

The platform was successfully validated as the primary virtualization host for CMR Lab.

---

# Validation Lessons Learned

The validation phase produced several important lessons:

* Existing hardware should be evaluated before replacement is considered.
* Documentation should begin before major implementation work.
* Hardware validation reduces architectural uncertainty.
* A small number of stable systems provides more value than a large number of partially functional systems.
* Recoverability and maintainability are more important than raw hardware quantity.

---

# Final Validation Outcome

| Area                              | Outcome     |
| --------------------------------- | ----------- |
| Hardware Recovery                 | Successful  |
| Wired Lab Deployment              | Successful  |
| Proxmox Deployment                | Successful  |
| Virtualization Readiness          | Achieved    |
| Foundation for Service Deployment | Established |

The hardware validation phase successfully transitioned CMR Lab from planning and inventory activities into infrastructure deployment and operational development.

---

# Review History

| Date       | Reviewer       | Notes                                        |
| ---------- | -------------- | -------------------------------------------- |
| 2026-06-03 | Charles Rattan | Initial validation record created            |
| 2026-06-11 | Charles Rattan | Refactored into historical validation record |
