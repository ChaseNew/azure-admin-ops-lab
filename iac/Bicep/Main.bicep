targetScope = 'resourceGroup'

param location string = resourceGroup().location

param vnetName string = 'vnet-portfolio'
param webVmName string = 'web-vm'
param adminVmName string = 'admin-vm'

param adminUsername string
@secure()
param adminPassword string

// Log Analytics Workspace
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: 'log-workspace'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

// Network Security Groups
resource nsgWeb 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'nsg-web'
  location: location
}

resource nsgAdmin 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'nsg-admin'
  location: location
}

// Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.0.0/16'
      ]
    }
  }
}

// Web Subnet
resource webSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${vnet.name}/Subnet-Web'
  properties: {
    addressPrefix: '10.10.1.0/24'
    networkSecurityGroup: {
      id: nsgWeb.id
    }
  }
  dependsOn: [
    vnet
  ]
}

// Admin Subnet
resource adminSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${vnet.name}/Subnet-Admin'
  properties: {
    addressPrefix: '10.10.2.0/24'
    networkSecurityGroup: {
      id: nsgAdmin.id
    }
  }
  dependsOn: [
    vnet
  ]
}

// Public IPs
resource webPublicIP 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: 'web-ip'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource adminPublicIP 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: 'admin-ip'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

// Network Interfaces
resource webNic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: 'web-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: webSubnet.id
          }
          publicIPAddress: {
            id: webPublicIP.id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

resource adminNic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: 'admin-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: adminSubnet.id
          }
          publicIPAddress: {
            id: adminPublicIP.id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

// Web VM
resource webVm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: webVmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1s'
    }
    osProfile: {
      computerName: webVmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: webNic.id
        }
      ]
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
  }
}

// Admin VM
resource adminVm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: adminVmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1s'
    }
    osProfile: {
      computerName: adminVmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: adminNic.id
        }
      ]
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
  }
}
