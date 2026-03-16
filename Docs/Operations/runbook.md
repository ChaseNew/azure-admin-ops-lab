# Azure Virtual Machine Environment – Operations Runbook

## Overview

This runbook provides operational guidance for managing and troubleshooting the Azure virtual machine environment deployed in this project.

This environment demonstrates a secure Azure virtual network architecture with monitoring, network security controls, and role-based access management.

The environment includes:

- Resource Group
- Virtual Network with segmented subnets
- Web Virtual Machine
- Admin Virtual Machine
- Network Security Groups
- Azure Monitor
- Log Analytics Workspace
- Alert Rules
- Role-Based Access Control (RBAC)

This documentation is intended to help administrators operate and troubleshoot the environment.

---

# Accessing Virtual Machines

## Connecting to the Admin VM

The Admin VM is used for management and administrative tasks.

Steps:

1. Open the Azure Portal
2. Navigate to **Virtual Machines**
3. Select **admin-vm**
4. Click **Connect**
5. Use **RDP** to connect

Access to the Admin VM is restricted through the Network Security Group to trusted IP addresses.

---

## Connecting to the Web VM

The Web VM hosts the web-facing workload.

Steps:

1. Navigate to **Virtual Machines**
2. Select **web-vm**
3. Connect using **SSH** or **RDP** depending on configuration

Administrative access is restricted to trusted IP ranges through NSG rules.

---

# Monitoring

The environment uses **Azure Monitor and Log Analytics** to provide observability into system health and activity.

Configured monitoring components include:

- Log Analytics Workspace
- Azure Monitor
- Alert Rules
- VM Heartbeat monitoring

These services allow administrators to detect performance issues, connectivity problems, and system failures.

---

# Viewing Logs

Logs are collected in the **Log Analytics Workspace**.

Steps:

1. Open **Azure Portal**
2. Navigate to **Log Analytics Workspace**
3. Select **Logs**
4. Run queries to analyze system activity

Example query:

```
Heartbeat
| summarize count() by Computer
```

---

Purpose:

This query shows the number of heartbeat signals received from each monitored virtual machine.

Heartbeat logs confirm that the VM is active and communicating with Azure Monitor.

---

# Monitoring Alerts

Alert rules are configured to notify administrators when potential issues occur.

Example alert scenarios include:

- High CPU usage
- Virtual machine availability issues
- Missing VM heartbeat signals

To view alerts:

1. Open **Azure Monitor**
2. Select **Alerts**
3. Review active alerts or alert history

---

# Troubleshooting Connectivity

If a virtual machine cannot be reached:

1. Verify the VM is **running**
2. Check **Network Security Group rules**
3. Confirm the correct **public IP address**
4. Review **Log Analytics logs**
5. Check **Azure Monitor alerts**

Common causes include:

- NSG blocking inbound traffic
- VM stopped or deallocated
- Incorrect IP configuration

---

# Restarting a Virtual Machine

To restart a VM:

1. Navigate to **Virtual Machines**
2. Select the target VM
3. Click **Restart**

Restarting can resolve temporary connectivity or performance issues.

---

# Cost Management Note

The architecture was deployed and validated in Azure.  
Virtual machines may be **deallocated when not actively in use** to minimize cloud costs.

Monitoring components and alert configurations remain documented as part of the system design.

---
