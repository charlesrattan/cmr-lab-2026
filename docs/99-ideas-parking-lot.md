## Future Ideas

- Proxmox Cluster
- Local AI
- Jellyfin
- Home Automation
- SIEM
- Docker
- Tailscale
- Monitoring Dashboard
- PBX
- Cybersecurity Lab
- Next-Generation Firewall Platform

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