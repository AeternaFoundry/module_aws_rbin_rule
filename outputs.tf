output "rbin_rules_id" {
  description = "Map of id values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "rbin_rules_arn" {
  description = "Map of arn values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "rbin_rules_description" {
  description = "Map of description values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.description if v.description != null && length(v.description) > 0 }
}
output "rbin_rules_exclude_resource_tags" {
  description = "Map of exclude_resource_tags values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.exclude_resource_tags if v.exclude_resource_tags != null && length(v.exclude_resource_tags) > 0 }
}
output "rbin_rules_lock_configuration" {
  description = "Map of lock_configuration values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => one(v.lock_configuration) if v.lock_configuration != null && length(v.lock_configuration) > 0 }
}
output "rbin_rules_lock_end_time" {
  description = "Map of lock_end_time values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.lock_end_time if v.lock_end_time != null && length(v.lock_end_time) > 0 }
}
output "rbin_rules_lock_state" {
  description = "Map of lock_state values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.lock_state if v.lock_state != null && length(v.lock_state) > 0 }
}
output "rbin_rules_region" {
  description = "Map of region values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.region if v.region != null && length(v.region) > 0 }
}
output "rbin_rules_resource_tags" {
  description = "Map of resource_tags values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.resource_tags if v.resource_tags != null && length(v.resource_tags) > 0 }
}
output "rbin_rules_resource_type" {
  description = "Map of resource_type values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.resource_type if v.resource_type != null && length(v.resource_type) > 0 }
}
output "rbin_rules_retention_period" {
  description = "Map of retention_period values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => one(v.retention_period) if v.retention_period != null && length(v.retention_period) > 0 }
}
output "rbin_rules_status" {
  description = "Map of status values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.status if v.status != null && length(v.status) > 0 }
}
output "rbin_rules_tags" {
  description = "Map of tags values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "rbin_rules_tags_all" {
  description = "Map of tags_all values across all rbin_rules, keyed the same as var.rbin_rules"
  value       = { for k, v in aws_rbin_rule.rbin_rules : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

