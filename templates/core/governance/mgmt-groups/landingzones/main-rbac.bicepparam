using './main-rbac.bicep'

param parLandingZonesManagementGroupName = 'rhlandingzones'
param parPlatformManagementGroupName = 'rhplatform'
param parConnectivityManagementGroupName = 'rhconnectivity'
param parManagementGroupExcludedPolicyAssignments = []
param parEnableTelemetry = false
