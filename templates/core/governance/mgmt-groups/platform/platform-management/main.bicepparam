using './main.bicep'

// General Parameters
param parLocations = [
  'germanywestcentral'
  ''
]
param parEnableTelemetry = true

param platformManagementConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: 'rhmanagement'
  managementGroupParentId: 'rhplatform'
  managementGroupIntermediateRootName: 'rhalz'
  managementGroupDisplayName: 'rh-Management'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: ['64d8cceb-3611-43e5-a168-23dbb65690e6']
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

// Only specify the parameters you want to override - others will use defaults from JSON files
param parPolicyAssignmentParameterOverrides = {
  // No policy assignments in platform-management currently
}
