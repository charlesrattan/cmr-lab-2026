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
| 2026-06-07 | Host UniFi Network Controller on Proxmox VM110 | Cloud Key Gen1 was recovered but is legacy; Dell Micro should not remain responsible for network management | Accepted |
| 2026-06-07 | Use CPU type `host` for VM110 | MongoDB failed with illegal instruction under `x86-64-v2-AES`; passing host CPU features resolved the issue | Accepted |
| 2026-06-07 | Create VM120 as Docker services host | Separates daily-use applications from UniFi and core management services | Accepted |
| 2026-06-07 | Use Homepage as the CMR Lab operations dashboard | Provides a central landing page for infrastructure, services and documentation | Accepted |
| 2026-06-07 | Use Uptime Kuma for initial service monitoring | Lightweight monitoring provides immediate visibility into service availability | Accepted |
| 2026-06-07 | Deploy Nginx Proxy Manager for reverse proxy learning and future service routing | Provides a manageable reverse proxy layer for self-hosted services | Accepted |
| 2026-06-07 | Do not use the CMR Enterprise business domain for homelab services at this stage | Keeps business services separate from personal/lab infrastructure | Accepted |
| 2026-06-07 | Use Tailscale as the preferred remote access and naming strategy | Provides secure access, MagicDNS and avoids port forwarding or premature public DNS use | Accepted |
| 2026-06-07 | Defer OPNsense until the service layer is stable | Avoids adding routing, firewall, DNS, DHCP and VLAN complexity during Docker service stabilization | Accepted |
| 2026-06-10 | Establish VM100 as the management and automation platform | Provides a dedicated control plane for Tailscale, Git, Ansible, future DNS and monitoring | Accepted |
| 2026-06-10 | Keep VM110 dedicated to UniFi only | Protects the stability of the network controller by avoiding unrelated services | Accepted |
| 2026-06-10 | Use VM120 as the Docker services platform | Keeps application services separate from management and network control | Accepted |
| 2026-06-10 | Use Docker Compose as the source of truth for VM120 containers | Prevents manual container drift and makes backup/rebuild easier | Accepted |
| 2026-06-10 | Configure weekly Proxmox backups for VM110 and VM120 | Protects the current production controller and services platform | Accepted |
| 2026-06-11 | Deploy AdGuard Home on VM100 (`ubuntu-mgmt-01`) as the internal DNS platform. | Centralized DNS management, service discovery, DNS rewrites, and foundation for future network-wide DNS control. | AdGuard Home operational on `10.146.91.99`; DNS rewrites validated from Windows workstation. |
| 2026-06-11 | Adopt `cmrlab.internal` as the lab namespace. | `.local` is reserved for mDNS and may conflict with Apple, Linux, Home Assistant, and Avahi service discovery. | Core services migrated to `.internal` and validated successfully. |
| 2026-06-11 | Use Nginx Proxy Manager for internal service routing. | Simplifies access to services without remembering ports and creates a scalable internal service architecture. | Dashboard, Vaultwarden, Kuma, Portainer, and AdGuard accessible through internal DNS names. |
| 2026-06-11 | Create post-deployment recovery points. | Establish rollback points before future infrastructure changes. | Proxmox snapshots created: `post-adguard-deployment` (VM100) and `post-dns-proxy-integration` (VM120). |