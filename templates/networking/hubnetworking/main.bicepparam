using './main.bicep'

// General Parameters
param parLocations = [
  'germanywestcentral'
  'austriaeast'
]
param parGlobalResourceLock = {
  name: 'GlobalResourceLock'
  kind: 'None'
  notes: 'This lock was created by the ALZ Bicep Accelerator.'
}
param parTags = {}
param parEnableTelemetry = false

// Resource Group Parameters
param parHubNetworkingResourceGroupNamePrefix = 'rg-alz-conn'
param parDnsResourceGroupNamePrefix = 'rg-alz-dns'
param parDnsPrivateResolverResourceGroupNamePrefix = 'rg-alz-dnspr'

// Hub Networking Parameters
param hubNetworks = [
  {
    name: 'vnet-alz-${parLocations[0]}'
    location: parLocations[0]
    addressPrefixes: [
      '172.17.0.0/22'
    ]
    deployPeering: true
    dnsServers: []
    peeringSettings: [
      {
        remoteVirtualNetworkName: 'vnet-alz-${parLocations[1]}'
        allowForwardedTraffic: true
        allowGatewayTransit: false
        allowVirtualNetworkAccess: true
        useRemoteGateways: false
      }
    ]
    subnets: [
      {
        name: 'AzureBastionSubnet'
        addressPrefix: '172.17.0.64/26'
      }
      {
        name: 'GatewaySubnet'
        addressPrefix: '172.17.0.128/27'
      }
      {
        name: 'AzureFirewallSubnet'
        addressPrefix: '172.17.0.0/26'
      }
      {
        name: 'AzureFirewallManagementSubnet'
        addressPrefix: '172.17.0.192/26'
      }
      {
        name: 'DNSPrivateResolverInboundSubnet'
        addressPrefix: '172.17.0.160/28'
        delegation: 'Microsoft.Network/dnsResolvers'
      }
      {
        name: 'DNSPrivateResolverOutboundSubnet'
        addressPrefix: '172.17.0.176/28'
        delegation: 'Microsoft.Network/dnsResolvers'
      }
    ]
    azureFirewallSettings: {
      deployAzureFirewall: true
      azureFirewallName: 'afw-alz-${parLocations[0]}'
      azureSkuTier: 'Basic'
      publicIPAddressObject: {
        name: 'pip-afw-alz-${parLocations[0]}'
      }
      managementIPAddressObject: {
        name: 'pip-afw-mgmt-alz-${parLocations[0]}'
      }
    }
    bastionHostSettings: {
      deployBastion: true
      bastionHostSettingsName: 'bas-alz-${parLocations[0]}'
      skuName: 'Developer'
    }
    vpnGatewaySettings: {
      deployVpnGateway: false
      name: 'vgw-alz-${parLocations[0]}'
      skuName: 'VpnGw1AZ'
      vpnMode: 'activeActiveBgp'
      vpnType: 'RouteBased'
      asn: 65515
    }
    expressRouteGatewaySettings: {
      deployExpressRouteGateway: falase
      name: 'ergw-alz-${parLocations[0]}'
    }
    privateDnsSettings: {
      deployPrivateDnsZones: true
      deployDnsPrivateResolver: true
      privateDnsResolverName: 'dnspr-alz-${parLocations[0]}'
      privateDnsZones: []
    }
    ddosProtectionPlanSettings: {
      deployDdosProtectionPlan: false
      name: 'ddos-alz-${parLocations[0]}'
    }
  }
  {
    name: 'vnet-alz-${parLocations[1]}'
    location: parLocations[1]
    addressPrefixes: [
      '172.18.0.0/22'
    ]
    deployPeering: true
    dnsServers: []
    peeringSettings: [
      {
        remoteVirtualNetworkName: 'vnet-alz-${parLocations[0]}'
        allowForwardedTraffic: true
        allowGatewayTransit: false
        allowVirtualNetworkAccess: true
        useRemoteGateways: false
      }
    ]
    subnets: [
      {
        name: 'AzureBastionSubnet'
        addressPrefix: '172.18.0.64/26'
      }
      {
        name: 'GatewaySubnet'
        addressPrefix: '172.18.0.128/27'
      }
      {
        name: 'AzureFirewallSubnet'
        addressPrefix: '172.18.0.0/26'
      }
      {
        name: 'AzureFirewallManagementSubnet'
        addressPrefix: '172.18.0.192/26'
      }
      {
        name: 'DNSPrivateResolverInboundSubnet'
        addressPrefix: '172.18.0.160/28'
        delegation: 'Microsoft.Network/dnsResolvers'
      }
      {
        name: 'DNSPrivateResolverOutboundSubnet'
        addressPrefix: '172.18.0.176/28'
        delegation: 'Microsoft.Network/dnsResolvers'
      }
    ]
    azureFirewallSettings: {
      deployAzureFirewall: false
      azureFirewallName: 'afw-alz-${parLocations[1]}'
      azureSkuTier: 'Basic'
      publicIPAddressObject: {
        name: 'pip-afw-alz-${parLocations[1]}'
      }
      managementIPAddressObject: {
        name: 'pip-afw-mgmt-alz-${parLocations[1]}'
      }
    }
    bastionHostSettings: {
      deployBastion: false
      bastionHostSettingsName: 'bas-alz-${parLocations[1]}'
      skuName: 'Developer'
    }
    vpnGatewaySettings: {
      deployVpnGateway: false
      name: 'vgw-alz-${parLocations[1]}'
      skuName: 'VpnGw1AZ'
      vpnMode: 'activeActiveBgp'
      vpnType: 'RouteBased'
      asn: 65515
    }
    expressRouteGatewaySettings: {
      deployExpressRouteGateway: false
      name: 'ergw-alz-${parLocations[1]}'
    }
    privateDnsSettings: {
      deployPrivateDnsZones: false
      deployDnsPrivateResolver: false
      privateDnsResolverName: 'dnspr-alz-${parLocations[1]}'
      privateDnsZones: [
        'privatelink.{regionName}.azurecontainerapps.io'
        'privatelink.{regionName}.kusto.windows.net'
        'privatelink.{regionName}.azmk8s.io'
        'privatelink.{regionName}.prometheus.monitor.azure.com'
        'privatelink.{regionCode}.backup.windowsazure.com'
      ]
    }
    ddosProtectionPlanSettings: {
      deployDdosProtectionPlan: false
    }
  }
]
