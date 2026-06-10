## Current Lab Maturity Assessment

| Area | Current Score | Target Score | Notes |
|---|---:|---:|---|
| Documentation | 4/5 | 5/5 | Repository structure exists and current architecture is being documented |
| Asset Inventory | 3/5 | 5/5 | Known assets listed, but OptiPlex inspection still pending |
| Server Infrastructure | 4/5 | 4/5 | Proxmox host operational with VM100, VM110, and VM120 |
| Network Infrastructure | 2/5 | 4/5 | Linksys remains gateway; UniFi AP and controller are operational |
| Wired Connectivity | 1/5 | 4/5 | Important devices should be wired where possible |
| Naming Standards | 1/5 | 5/5 | Draft naming convention started |
| Monitoring | 2/5 | 4/5 | Uptime Kuma deployed for service monitoring; deeper metrics still pending |
| Security Controls | 1/5 | 4/5 | Basic network exists, but segmentation and visibility are limited |
| Backup and Recovery | 3/5 | 4/5 | Proxmox backup validated and weekly backups configured |

## Immediate Maturity Focus

The current maturity focus is service stabilization.

Priority order:

1. Complete Git documentation update.
2. Build Ansible health-check playbook.
3. Complete Ansible update playbook workflow.
4. Deploy AdGuard Home on VM100.
5. Resolve Vaultwarden HTTPS.
6. Deploy Jellyfin on VM120.
7. Document backup restoration process.