variable "rbin_rules" {
  description = <<EOT
Map of rbin_rules, attributes below
Required:
    - resource_type
    - retention_period (block):
        - retention_period_unit (required)
        - retention_period_value (required)
Optional:
    - description
    - region
    - tags
    - tags_all
    - exclude_resource_tags (block):
        - resource_tag_key (required)
        - resource_tag_value (optional)
    - lock_configuration (block):
        - unlock_delay (required, block):
            - unlock_delay_unit (required)
            - unlock_delay_value (required)
    - resource_tags (block):
        - resource_tag_key (required)
        - resource_tag_value (optional)
EOT

  type = map(object({
    resource_type = string
    description   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    retention_period = object({
      retention_period_unit  = string
      retention_period_value = number
    })
    exclude_resource_tags = optional(list(object({
      resource_tag_key   = string
      resource_tag_value = optional(string)
    })))
    lock_configuration = optional(object({
      unlock_delay = object({
        unlock_delay_unit  = string
        unlock_delay_value = number
      })
    }))
    resource_tags = optional(list(object({
      resource_tag_key   = string
      resource_tag_value = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.rbin_rules : (
        v.exclude_resource_tags == null || (length(v.exclude_resource_tags) <= 5)
      )
    ])
    error_message = "Each exclude_resource_tags list must contain at most 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.rbin_rules : (
        v.resource_tags == null || (length(v.resource_tags) <= 50)
      )
    ])
    error_message = "Each resource_tags list must contain at most 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.rbin_rules : (
        v.exclude_resource_tags == null || alltrue([for item in v.exclude_resource_tags : (length(item.resource_tag_key) >= 0 && length(item.resource_tag_key) <= 127)])
      )
    ])
    error_message = "must be between 0 and 127 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.rbin_rules : (
        v.exclude_resource_tags == null || alltrue([for item in v.exclude_resource_tags : (item.resource_tag_value == null || (length(item.resource_tag_value) >= 0 && length(item.resource_tag_value) <= 256))])
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.rbin_rules : (
        v.lock_configuration == null || (v.lock_configuration.unlock_delay.unlock_delay_value >= 7 && v.lock_configuration.unlock_delay.unlock_delay_value <= 30)
      )
    ])
    error_message = "must be between 7 and 30"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

