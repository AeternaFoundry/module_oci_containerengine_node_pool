variable "containerengine_node_pools" {
  description = <<EOT
Map of containerengine_node_pools, attributes below
Required:
    - cluster_id
    - compartment_id
    - name
    - node_shape
Optional:
    - defined_tags
    - freeform_tags
    - kubernetes_version
    - network_launch_type
    - node_image_id
    - node_image_name
    - node_metadata
    - quantity_per_subnet
    - ssh_public_key
    - subnet_ids
    - initial_node_labels (block):
        - key (optional)
        - value (optional)
    - node_config_details (block):
        - compute_cluster_id (optional)
        - defined_tags (optional)
        - freeform_tags (optional)
        - is_pv_encryption_in_transit_enabled (optional)
        - kms_key_id (optional)
        - node_pool_pod_network_option_details (optional, block):
            - cni_type (required)
            - max_pods_per_node (optional)
            - pod_nsg_ids (optional)
            - pod_subnet_ids (optional)
        - nsg_ids (optional)
        - placement_configs (required, block):
            - availability_domain (required)
            - capacity_reservation_id (optional)
            - fault_domains (optional)
            - host_group_id (optional)
            - preemptible_node_config (optional, block):
                - preemption_action (required, block):
                    - is_preserve_boot_volume (optional)
                    - type (required)
            - subnet_id (required)
        - size (required)
    - node_eviction_node_pool_settings (block):
        - eviction_grace_duration (optional)
        - is_force_action_after_grace_duration (optional)
        - is_force_delete_after_grace_duration (optional)
    - node_pool_cycling_details (block):
        - cycle_modes (optional)
        - is_node_cycling_enabled (optional)
        - maximum_surge (optional)
        - maximum_unavailable (optional)
    - node_shape_config (block):
        - memory_in_gbs (optional)
        - ocpus (optional)
    - node_source_details (block):
        - boot_volume_size_in_gbs (optional)
        - image_id (required)
        - source_type (required)
    - primary_vnic (block):
        - security_attributes (optional)
    - secondary_vnics (block):
        - create_vnic_details (required, block):
            - application_resources (optional)
            - assign_ipv6ip (optional)
            - assign_public_ip (optional)
            - defined_tags (optional)
            - display_name (optional)
            - freeform_tags (optional)
            - ip_count (optional)
            - ipv6address_ipv6subnet_cidr_pair_details (optional, block):
                - ipv6address (optional)
                - ipv6subnet_cidr (optional)
            - nsg_ids (optional)
            - security_attributes (optional)
            - skip_source_dest_check (optional)
            - subnet_id (required)
        - display_name (optional)
        - nic_index (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    cluster_id          = string
    compartment_id      = string
    name                = string
    node_shape          = string
    defined_tags        = optional(map(string))
    freeform_tags       = optional(map(string))
    kubernetes_version  = optional(string)
    network_launch_type = optional(string)
    node_image_id       = optional(string)
    node_image_name     = optional(string)
    node_metadata       = optional(map(string))
    quantity_per_subnet = optional(number)
    ssh_public_key      = optional(string)
    subnet_ids          = optional(set(string))
    initial_node_labels = optional(list(object({
      key   = optional(string)
      value = optional(string)
    })))
    node_config_details = optional(object({
      compute_cluster_id                  = optional(string)
      defined_tags                        = optional(map(string))
      freeform_tags                       = optional(map(string))
      is_pv_encryption_in_transit_enabled = optional(bool)
      kms_key_id                          = optional(string)
      node_pool_pod_network_option_details = optional(object({
        cni_type          = string
        max_pods_per_node = optional(number)
        pod_nsg_ids       = optional(list(string))
        pod_subnet_ids    = optional(list(string))
      }))
      nsg_ids = optional(set(string))
      placement_configs = list(object({
        availability_domain     = string
        capacity_reservation_id = optional(string)
        fault_domains           = optional(list(string))
        host_group_id           = optional(string)
        preemptible_node_config = optional(object({
          preemption_action = object({
            is_preserve_boot_volume = optional(bool)
            type                    = string
          })
        }))
        subnet_id = string
      }))
      size = number
    }))
    node_eviction_node_pool_settings = optional(object({
      eviction_grace_duration              = optional(string)
      is_force_action_after_grace_duration = optional(bool)
      is_force_delete_after_grace_duration = optional(bool)
    }))
    node_pool_cycling_details = optional(object({
      cycle_modes             = optional(list(string))
      is_node_cycling_enabled = optional(bool)
      maximum_surge           = optional(string)
      maximum_unavailable     = optional(string)
    }))
    node_shape_config = optional(object({
      memory_in_gbs = optional(number)
      ocpus         = optional(number)
    }))
    node_source_details = optional(object({
      boot_volume_size_in_gbs = optional(string)
      image_id                = string
      source_type             = string
    }))
    primary_vnic = optional(object({
      security_attributes = optional(map(string))
    }))
    secondary_vnics = optional(list(object({
      create_vnic_details = object({
        application_resources = optional(list(string))
        assign_ipv6ip         = optional(bool)
        assign_public_ip      = optional(bool)
        defined_tags          = optional(map(string))
        display_name          = optional(string)
        freeform_tags         = optional(map(string))
        ip_count              = optional(number)
        ipv6address_ipv6subnet_cidr_pair_details = optional(list(object({
          ipv6address     = optional(string)
          ipv6subnet_cidr = optional(string)
        })))
        nsg_ids                = optional(set(string))
        security_attributes    = optional(map(string))
        skip_source_dest_check = optional(bool)
        subnet_id              = string
      })
      display_name = optional(string)
      nic_index    = optional(number)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.containerengine_node_pools : (
        v.node_config_details == null || (length(v.node_config_details.placement_configs) >= 1)
      )
    ])
    error_message = "Each placement_configs list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.containerengine_node_pools : (
        v.node_config_details == null || (alltrue([for item in v.node_config_details.placement_configs : (item.preemptible_node_config == null || (contains([for v in ["TERMINATE"] : lower(v)], lower(item.preemptible_node_config.preemption_action.type))))]))
      )
    ])
    error_message = "must be one of: \"TERMINATE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.containerengine_node_pools : (
        v.node_config_details == null || (v.node_config_details.node_pool_pod_network_option_details == null || (contains([for v in ["FLANNEL_OVERLAY", "OCI_VCN_IP_NATIVE"] : lower(v)], lower(v.node_config_details.node_pool_pod_network_option_details.cni_type))))
      )
    ])
    error_message = "must be one of: \"FLANNEL_OVERLAY\", \"OCI_VCN_IP_NATIVE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.containerengine_node_pools : (
        v.node_source_details == null || (contains([for v in ["IMAGE"] : lower(v)], lower(v.node_source_details.source_type)))
      )
    ])
    error_message = "must be one of: \"IMAGE\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

