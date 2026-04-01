using './main-rbac.bicep'

param parPlatformManagementGroupName = 'rhplatform'
param parConnectivityManagementGroupName = 'rhconnectivity'
param parManagementGroupExcludedPolicyAssignments = []
param parEnableTelemetry = true
