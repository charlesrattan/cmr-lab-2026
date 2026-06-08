## Current Lab Maturity Assessment

| Area | Current Score | Target Score | Notes |
|---|---:|---:|---|
| Documentation | 3/5 | 5/5 | Repository structure exists and is improving |
| Asset Inventory | 3/5 | 5/5 | Known assets listed, but OptiPlex inspection still pending |
| Server Infrastructure | 3/5 | 4/5 | Proxmox host operational with VM100, VM110, and VM120 |
| Network Infrastructure | 2/5 | 4/5 | Linksys remains gateway; UniFi AP and controller are operational |
| Wired Connectivity | 1/5 | 4/5 | Important devices should be wired where possible |
| Naming Standards | 1/5 | 5/5 | Draft naming convention started |
| Monitoring | 2/5 | 4/5 | Uptime Kuma deployed for service monitoring; deeper metrics still pending |
| Security Controls | 1/5 | 4/5 | Basic network exists, but segmentation and visibility are limited |
| Backup and Recovery | 1/5 | 4/5 | VM snapshots and UniFi backup started; broader backup strategy still pending |

## Immediate Maturity Focus

The current maturity focus is service stabilization.

Priority order:

1. Stabilize VM120 Docker services.
2. Convert Docker service deployment from `docker run` commands to Docker Compose.
3. Deploy Tailscale and enable MagicDNS.
4. Make Vaultwarden production-ready with HTTPS.
5. Implement a backup strategy for Proxmox VMs and Docker service data.
6. Continue service migration from the MacBook server.
7. Plan OPNsense after the service layer is stable.