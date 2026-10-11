resource "oci_containerengine_node_pool" "containerengine_node_pools" {
  for_each = var.containerengine_node_pools

  cluster_id          = each.value.cluster_id
  compartment_id      = each.value.compartment_id
  name                = each.value.name
  node_shape          = each.value.node_shape
  defined_tags        = each.value.defined_tags
  freeform_tags       = each.value.freeform_tags
  kubernetes_version  = each.value.kubernetes_version
  network_launch_type = each.value.network_launch_type
  node_image_id       = each.value.node_image_id
  node_image_name     = each.value.node_image_name
  node_metadata       = each.value.node_metadata
  quantity_per_subnet = each.value.quantity_per_subnet
  ssh_public_key      = each.value.ssh_public_key
  subnet_ids          = each.value.subnet_ids

  dynamic "initial_node_labels" {
    for_each = each.value.initial_node_labels != null ? each.value.initial_node_labels : []
    content {
      key   = initial_node_labels.value.key
      value = initial_node_labels.value.value
    }
  }

  dynamic "node_config_details" {
    for_each = each.value.node_config_details != null ? [each.value.node_config_details] : []
    content {
      compute_cluster_id                  = node_config_details.value.compute_cluster_id
      defined_tags                        = node_config_details.value.defined_tags
      freeform_tags                       = node_config_details.value.freeform_tags
      is_pv_encryption_in_transit_enabled = node_config_details.value.is_pv_encryption_in_transit_enabled
      kms_key_id                          = node_config_details.value.kms_key_id
      dynamic "node_pool_pod_network_option_details" {
        for_each = node_config_details.value.node_pool_pod_network_option_details != null ? [node_config_details.value.node_pool_pod_network_option_details] : []
        content {
          cni_type          = node_pool_pod_network_option_details.value.cni_type
          max_pods_per_node = node_pool_pod_network_option_details.value.max_pods_per_node
          pod_nsg_ids       = node_pool_pod_network_option_details.value.pod_nsg_ids
          pod_subnet_ids    = node_pool_pod_network_option_details.value.pod_subnet_ids
        }
      }
      nsg_ids = node_config_details.value.nsg_ids
      dynamic "placement_configs" {
        for_each = node_config_details.value.placement_configs
        content {
          availability_domain     = placement_configs.value.availability_domain
          capacity_reservation_id = placement_configs.value.capacity_reservation_id
          fault_domains           = placement_configs.value.fault_domains
          host_group_id           = placement_configs.value.host_group_id
          dynamic "preemptible_node_config" {
            for_each = placement_configs.value.preemptible_node_config != null ? [placement_configs.value.preemptible_node_config] : []
            content {
              preemption_action {
                is_preserve_boot_volume = preemptible_node_config.value.preemption_action.is_preserve_boot_volume
                type                    = preemptible_node_config.value.preemption_action.type
              }
            }
          }
          subnet_id = placement_configs.value.subnet_id
        }
      }
      size = node_config_details.value.size
    }
  }

  dynamic "node_eviction_node_pool_settings" {
    for_each = each.value.node_eviction_node_pool_settings != null ? [each.value.node_eviction_node_pool_settings] : []
    content {
      eviction_grace_duration              = node_eviction_node_pool_settings.value.eviction_grace_duration
      is_force_action_after_grace_duration = node_eviction_node_pool_settings.value.is_force_action_after_grace_duration
      is_force_delete_after_grace_duration = node_eviction_node_pool_settings.value.is_force_delete_after_grace_duration
    }
  }

  dynamic "node_pool_cycling_details" {
    for_each = each.value.node_pool_cycling_details != null ? [each.value.node_pool_cycling_details] : []
    content {
      cycle_modes             = node_pool_cycling_details.value.cycle_modes
      is_node_cycling_enabled = node_pool_cycling_details.value.is_node_cycling_enabled
      maximum_surge           = node_pool_cycling_details.value.maximum_surge
      maximum_unavailable     = node_pool_cycling_details.value.maximum_unavailable
    }
  }

  dynamic "node_shape_config" {
    for_each = each.value.node_shape_config != null ? [each.value.node_shape_config] : []
    content {
      memory_in_gbs = node_shape_config.value.memory_in_gbs
      ocpus         = node_shape_config.value.ocpus
    }
  }

  dynamic "node_source_details" {
    for_each = each.value.node_source_details != null ? [each.value.node_source_details] : []
    content {
      boot_volume_size_in_gbs = node_source_details.value.boot_volume_size_in_gbs
      image_id                = node_source_details.value.image_id
      source_type             = node_source_details.value.source_type
    }
  }

  dynamic "primary_vnic" {
    for_each = each.value.primary_vnic != null ? [each.value.primary_vnic] : []
    content {
      security_attributes = primary_vnic.value.security_attributes
    }
  }

  dynamic "secondary_vnics" {
    for_each = each.value.secondary_vnics != null ? each.value.secondary_vnics : []
    content {
      create_vnic_details {
        application_resources = secondary_vnics.value.create_vnic_details.application_resources
        assign_ipv6ip         = secondary_vnics.value.create_vnic_details.assign_ipv6ip
        assign_public_ip      = secondary_vnics.value.create_vnic_details.assign_public_ip
        defined_tags          = secondary_vnics.value.create_vnic_details.defined_tags
        display_name          = secondary_vnics.value.create_vnic_details.display_name
        freeform_tags         = secondary_vnics.value.create_vnic_details.freeform_tags
        ip_count              = secondary_vnics.value.create_vnic_details.ip_count
        dynamic "ipv6address_ipv6subnet_cidr_pair_details" {
          for_each = secondary_vnics.value.create_vnic_details.ipv6address_ipv6subnet_cidr_pair_details != null ? secondary_vnics.value.create_vnic_details.ipv6address_ipv6subnet_cidr_pair_details : []
          content {
            ipv6address     = ipv6address_ipv6subnet_cidr_pair_details.value.ipv6address
            ipv6subnet_cidr = ipv6address_ipv6subnet_cidr_pair_details.value.ipv6subnet_cidr
          }
        }
        nsg_ids                = secondary_vnics.value.create_vnic_details.nsg_ids
        security_attributes    = secondary_vnics.value.create_vnic_details.security_attributes
        skip_source_dest_check = secondary_vnics.value.create_vnic_details.skip_source_dest_check
        subnet_id              = secondary_vnics.value.create_vnic_details.subnet_id
      }
      display_name = secondary_vnics.value.display_name
      nic_index    = secondary_vnics.value.nic_index
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

