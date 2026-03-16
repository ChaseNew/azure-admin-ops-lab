# Cost Management

This project was designed with cost optimization in mind while still demonstrating core Azure administrative capabilities.

## Cost Control Strategies

Several strategies were used to minimize cloud spending:

- Virtual machines were **stopped or deallocated when not in use** to prevent compute charges.
- Monitoring and alert configurations were created but the environment was not left running continuously.
- Resources were deployed in a **single resource group** to simplify management and cleanup.
- Testing was performed in short sessions rather than maintaining persistent workloads.

## Virtual Machine Costs

Virtual machines represent the largest cost component in most cloud environments.  
To control this:

- VMs were only started during testing.
- VMs were **deallocated after validation**.
- Public IP usage was minimized.

## Learning Outcome

This project reinforced the importance of cost awareness when designing cloud environments.  
Even small environments can generate unnecessary costs if resources are left running.

Understanding how to control and monitor cloud spending is a critical skill for cloud administrators.
