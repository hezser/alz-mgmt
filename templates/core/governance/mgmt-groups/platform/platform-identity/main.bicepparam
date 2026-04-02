using './main.bicep'

// General Parameters
param parLocations = [
  'germanywestcentral'
  'austriaeast'
]
param parEnableTelemetry = false

param platformIdentityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'rhidentity'
  managementGroupParentId: 'rhplatform'
  managementGroupIntermediateRootName: 'rhalz'
  managementGroupDisplayName: 'rh-Identity'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['b29d4652-d9d0-4739-8ffe-b9b8084e3c4f']
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
    // No policy assignments in platform-identity currently
}
