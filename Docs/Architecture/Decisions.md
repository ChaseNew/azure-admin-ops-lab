# Architecture Decisions

## Project Overview
This project demonstrates a secure Azure virtual network environment with monitoring and role-based access control.

The environment includes:
- Resource Group
- Virtual Network
- Two Subnets
- Two Virtual Machines
- Network Security Groups
- Azure Monitor and Log Analytics
- Alert Rules
- RBAC configuration

---

## Virtual Network Segmentation

Two subnets were created:

- Web Subnet
- Admin Subnet

### Reason
Separating workloads into subnets improves network organization and allows security policies to be applied independently.

---

## Network Security Groups

Two NSGs were implemented:

- NSG-Web
- NSG-Admin

### Reason
Security rules differ between the web-facing system and the administrative system.

Example:

Rules configured:

- Allow HTTP (port 80) from the internet
- Allow HTTPS (port 443) from the internet
- Allow SSH (port 22) only from a specific trusted IP range
- Deny all other inbound traffic

Admin VM:
- Allow RDP only
- Restricted source access

### Reason
The Web VM is designed to host a public-facing service; HTTP and HTTPS access must be allowed.  
Administrative access is restricted to SSH from a trusted IP range to reduce exposure to unauthorized access attempts.

---

## Monitoring and Logging

Azure Monitor and Log Analytics were configured.

### Reason
Monitoring allows visibility into system health and security events.

Alert rules notify administrators when:
- CPU usage spikes
- VM health degrades
- Security events occur

---

## Role-Based Access Control

RBAC was applied to the Web VM.

### Reason
RBAC ensures that only authorized users can manage the resource while following the principle of least privilege.
