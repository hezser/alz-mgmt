using './main-rbac.bicep'

param parCorpManagementGroupName = 'rhcorp'
param parConnectivityManagementGroupName = 'rhconnectivity'
param parManagementGroupExcludedPolicyAssignments = [
  'Enable-DDoS-VNET'
]
param parEnableTelemetry = false
