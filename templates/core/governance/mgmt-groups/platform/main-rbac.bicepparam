using './main-rbac.bicep'

param parPlatformManagementGroupName = 'rhplatform'
param parConnectivityManagementGroupName = 'rhconnectivity'
param parManagementGroupExcludedPolicyAssignments = [
  'Enable-DDoS-VNET'
]
param parEnableTelemetry = false
