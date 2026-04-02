using './main.bicep'

// General Parameters
param parLocations = [
  'germanywestcentral'
]
param parEnableTelemetry = false

param landingZonesOnlineConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'rhonline'
  managementGroupParentId: 'rhlandingzones'
  managementGroupIntermediateRootName: 'rhalz'
  managementGroupDisplayName: 'rh-Online'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Currently no policy assignments for online landing zones
// When policies are added, specify parameter overrides here
param parPolicyAssignmentParameterOverrides = {
  // No policy assignments in platform-security currently
}
