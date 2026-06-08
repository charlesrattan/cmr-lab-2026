## Future Ideas

- Proxmox Cluster
- Local AI
- Jellyfin
- Home Automation
- SIEM
- PBX
- Cybersecurity Lab
- Next-Generation Firewall Platform
- OPNsense
- Wazuh
- Security Onion
- Kubernetes
- Local AI

## Deferred Infrastructure Ideas

- OPNsense firewall/router VM
- VLAN segmentation
- Local DNS server
- Grafana and Prometheus monitoring stack
- Wazuh SIEM
- OpenVAS or Greenbone vulnerability scanning
- Local AI experimentation
- Home Assistant
- Jellyfin migration

### VM110 MongoDB Issue

Problem:
MongoDB 8 failed with:
status=4/ILL (Illegal Instruction)

Cause:
VM CPU type was configured as x86-64-v2-AES which masked AVX CPU instructions.

Resolution:
Changed VM CPU type to:
host

Result:
MongoDB started successfully.

Lesson:
Use CPU Type = host for homelab workloads unless live migration compatibility is required.