# Lessons Learned

Building this project provided practical experience with several core Azure services and highlighted how different components interact in a real environment.

## Network Security Design

Configuring **Network Security Groups (NSGs)** demonstrated how important it is to restrict inbound traffic.  
Allow rules were created only for required ports such as HTTP, HTTPS, and administrative access from trusted IP ranges.

## Monitoring and Observability

Setting up **Azure Monitor and Log Analytics** showed how centralized logging and alerting help administrators identify issues quickly.

Even in small environments, monitoring plays a critical role in maintaining system reliability.

## Role-Based Access Control (RBAC)

Implementing RBAC for the Web VM reinforced the **principle of least privilege**.  
Access was scoped specifically to the required resource rather than granting broader permissions.

## Infrastructure as Code

Using **Bicep** to define infrastructure highlighted the benefits of reproducible deployments and version-controlled infrastructure.

Infrastructure as Code allows environments to be recreated quickly and consistently.

## Documentation

Creating architecture diagrams, runbooks, and documentation helped reinforce the importance of clear operational guidance for administrators and team members.
