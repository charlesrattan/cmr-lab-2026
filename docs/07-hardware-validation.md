# Hardware Validation

## Objective

Determine which existing hardware is suitable for future use in CMR Lab 2026.

---

## Devices Pending Validation

### Dell OptiPlex Units

- [x] Unit 1 inspected
- [x] Unit 2 inspected
- [x] Unit 3 inspected

## Dell OptiPlex 7010 SFF Validation

| Check | Result |
|---|---|
| POST | Passed |
| BIOS Access | Passed |
| CPU Identified | Intel Core i7-3770 @ 3.40 GHz |
| DIMM Slots | 4 present |
| RAM | 4 GB DDR3 currently installed |
| SSD | 500 GB SSD detected |
| HDD | 500 GB HDD installed |
| Dell Diagnostics | Passed |
| Final Status | Validated as primary Proxmox candidate |

## Parts Donor Update

The remaining OptiPlex units were salvaged to get the validated unit operational. They should now be treated as parts donors rather than separate server candidates.

### UniFi Security Gateway

- [ ] Powers on
- [ ] Factory reset completed
- [ ] Accessible

### UniFi Cloud Key

- [ ] Powers on
- [ ] Accessible

### Cisco Switch
- [ ] Model identified
- [ ] Tested

## Server Build Completion

| Item | Result |
|---|---|
| Platform | Dell OptiPlex 7010 SFF |
| CPU | Intel Core i7-3770 @ 3.40 GHz |
| RAM | 20 GB DDR3 confirmed |
| RAM Notes | 2 x 8 GB + 1 x 4 GB installed; one DIMM slot appears faulty |
| Primary Storage | 500 GB SSD |
| Secondary Storage | 1 TB HDD |
| Network | Connected to wired lab switch |
| Final Build Status | Ready for Proxmox installation |

## Wired Lab Network Validation

| Device | Connection Status |
|---|---|
| Dell Micro Main PC | Connected |
| TP-Link TL-SF1008P | Online |
| UniFi Cloud Key Gen1 | Connected |
| UniFi Security Gateway | Connected for testing |
| Dell OptiPlex 7010 Server | Connected |