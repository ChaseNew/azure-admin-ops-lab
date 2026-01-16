**Chase Newman's Azure Portfolio Project**
This project demonstrates hands-on experience gained while learning with Microsoft Azure. I designed and deployed a secure, well-structured cloud environment that showcases core Azure administrative and operational skills.

The architecture includes the creation and management of Resource Groups, Virtual Networks, subnets, Network Security Groups, public and private virtual machines, monitoring and alert rules, Log Analytics, and Role-Based Access Control (RBAC).

Throughout the project, I applied cloud best practices with a strong focus on cost optimization, security, compliance, monitoring, and the principle of least privilege. Design decisions were made to reflect real-world operational environments rather than simple lab configurations.

**Architecture Diagram:**


What This Project Demonstrates:
-VNet, subnets, NSGs
-VM deployment and access controls
-RBAC scoped to a single VM
-Azure Monitor + Log Analytics
-Alerts + basic incident response
-Backup + recovery

**Key Decisions**
Cost Optimization:
use of Standard NV4as V4 (allows hibernation)
VMs were hibernated when not in use to reduce compute charges while preserving VM state for faster resume.
VMs were stopped after testing to prevent any additional costs.

Security:
SSH is restricted to my IP,
separate SSH keys per tier,
least-privilege RBAC.

Operations:
Alerts are configured for CPU thresholds and heartbeat monitoring.
allow rules created to allow only nessesary ports and deny all else.

Deployment Steps:
Create RG
Create VNet/subnets
Create NSGs
Deploy VMs
Enable monitoring
Set alerts
Enable backups
Configure RBAC

Lessons Learned
Through this project, I learned how critical it is to properly configure and integrate Azure services to prevent gaps in security and access control. I gained a stronger understanding of how individual Azure components work together as part of a unified cloud environment rather than as standalone services.

I also learned how Azure’s native tooling can significantly reduce operational overhead by limiting the need for manual deployment, configuration, and ongoing management when cloud resources are designed and managed correctly.
