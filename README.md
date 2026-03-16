# Azure Secure Virtual Network Lab

This project demonstrates hands-on experience building and documenting a secure cloud environment using Microsoft Azure. The goal of the project was to design and deploy a realistic Azure infrastructure while applying core cloud administration, networking, security, monitoring, and operational practices.

The environment was designed to resemble a small production-style deployment rather than a basic lab environment.

---

# Architecture Overview

The deployed architecture includes the following Azure components:

- Resource Group
- Virtual Network (VNet)
- Subnets
- Network Security Groups (NSGs)
- Web Virtual Machine
- Administrative Virtual Machine
- Public IP configuration
- Azure Monitor
- Log Analytics Workspace
- Alert Rules
- Role-Based Access Control (RBAC)

These components work together to demonstrate a secure and monitored Azure virtual machine environment.

---

# Architecture Diagram

![Architecture](architecture/Project-Diagram.png)

---

# What This Project Demonstrates

This project highlights several core Azure administration and cloud engineering skills:

- Virtual Network architecture and subnet segmentation
- Network Security Group configuration
- Virtual Machine deployment and access control
- Role-Based Access Control scoped to specific resources
- Azure Monitor and Log Analytics configuration
- Alert rule configuration for system monitoring
- Backup and recovery planning
- Basic operational troubleshooting and monitoring

---

# Key Design Decisions

## Cost Optimization

Cost awareness is an important part of cloud operations. The following steps were taken to minimize unnecessary cloud spending:

- Use of **Standard NV4as_v4** virtual machines which support hibernation
- Virtual machines were **hibernated when not in use** to reduce compute charges
- VMs were **deallocated after testing** to prevent additional costs

These practices demonstrate how cloud resources can be managed efficiently without impacting the overall design of the environment.

---

## Security

Security considerations were incorporated throughout the architecture:

- SSH access restricted to a trusted IP address
- Separate administrative access controls for each VM
- Network Security Groups configured with **deny-by-default inbound rules**
- Only required ports are allowed through NSG rules
- RBAC implemented using the **principle of least privilege**

These measures help reduce the attack surface and ensure administrative access is tightly controlled.

---

## Monitoring and Operations

Operational visibility was implemented using Azure monitoring services:

- **Azure Monitor** for platform monitoring
- **Log Analytics Workspace** for log collection and analysis
- Alert rules configured for:
  - CPU utilization thresholds
  - VM heartbeat monitoring
  - Availability monitoring

These alerts help administrators quickly detect performance or availability issues.

---

# Deployment Process

The environment was deployed using the following workflow:

1. Create Resource Group
2. Create Virtual Network and Subnets
3. Configure Network Security Groups
4. Deploy Virtual Machines
5. Enable monitoring with Azure Monitor and Log Analytics
6. Configure alert rules
7. Enable backup configuration
8. Configure RBAC access permissions

Infrastructure deployment is also represented using Infrastructure-as-Code with Bicep templates included in this repository.

---

# Lessons Learned

This project reinforced several important cloud engineering concepts.

First, it demonstrated how individual Azure services must be carefully integrated to avoid gaps in security, monitoring, or access control.

Second, it highlighted how proper architecture design can simplify ongoing operations by relying on Azure’s native automation and monitoring tools.

Finally, it emphasized the importance of cost management in cloud environments, particularly when working with virtual machines and persistent resources.

---

# Technologies Used

- Microsoft Azure
- Azure Virtual Machines
- Azure Virtual Network
- Azure Monitor
- Log Analytics
- Role-Based Access Control (RBAC)
- Bicep (Infrastructure as Code)



# Repository Structure
