locals {
  policies = jsondecode (file("policies/policies.json"))
}

resource "prismacloud_policy" "policy" {
  for_each = { for policy in local.policies : policy.name => policy }
    policy_type  = each.value.policy_type
    cloud_type   = each.value.cloud_type
    name         = each.value.name
    severity     = each.value.severity
    labels       = each.value.labels
    policy_subtypes  = each.value.policy_subtype
    description = "demo AXA - lombac"
    rule {
      name     = each.value.name
      rule_type = each.value.rule_type
      parameters = {
        savedSearch = false
        withIac     = false
      }
      criteria = each.value.RQL    
  }
}


