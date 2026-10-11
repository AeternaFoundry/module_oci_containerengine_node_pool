output "containerengine_node_pools_id" {
  description = "Map of id values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no id are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "containerengine_node_pools_cluster_id" {
  description = "Map of cluster_id values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no cluster_id are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.cluster_id if v.cluster_id != null && length(v.cluster_id) > 0 }
}
output "containerengine_node_pools_compartment_id" {
  description = "Map of compartment_id values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no compartment_id are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "containerengine_node_pools_defined_tags" {
  description = "Map of defined_tags values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no defined_tags are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "containerengine_node_pools_freeform_tags" {
  description = "Map of freeform_tags values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "containerengine_node_pools_initial_node_labels" {
  description = "Map of initial_node_labels values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no initial_node_labels are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.initial_node_labels if v.initial_node_labels != null && length(v.initial_node_labels) > 0 }
}
output "containerengine_node_pools_kubernetes_version" {
  description = "Map of kubernetes_version values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no kubernetes_version are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.kubernetes_version if v.kubernetes_version != null && length(v.kubernetes_version) > 0 }
}
output "containerengine_node_pools_lifecycle_details" {
  description = "Map of lifecycle_details values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "containerengine_node_pools_name" {
  description = "Map of name values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no name are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "containerengine_node_pools_network_launch_type" {
  description = "Map of network_launch_type values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no network_launch_type are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.network_launch_type if v.network_launch_type != null && length(v.network_launch_type) > 0 }
}
output "containerengine_node_pools_node_config_details" {
  description = "Map of node_config_details values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_config_details are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => one(v.node_config_details) if v.node_config_details != null && length(v.node_config_details) > 0 }
}
output "containerengine_node_pools_node_eviction_node_pool_settings" {
  description = "Map of node_eviction_node_pool_settings values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_eviction_node_pool_settings are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => one(v.node_eviction_node_pool_settings) if v.node_eviction_node_pool_settings != null && length(v.node_eviction_node_pool_settings) > 0 }
}
output "containerengine_node_pools_node_image_id" {
  description = "Map of node_image_id values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_image_id are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.node_image_id if v.node_image_id != null && length(v.node_image_id) > 0 }
}
output "containerengine_node_pools_node_image_name" {
  description = "Map of node_image_name values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_image_name are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.node_image_name if v.node_image_name != null && length(v.node_image_name) > 0 }
}
output "containerengine_node_pools_node_metadata" {
  description = "Map of node_metadata values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_metadata are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.node_metadata if v.node_metadata != null && length(v.node_metadata) > 0 }
}
output "containerengine_node_pools_node_pool_cycling_details" {
  description = "Map of node_pool_cycling_details values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_pool_cycling_details are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => one(v.node_pool_cycling_details) if v.node_pool_cycling_details != null && length(v.node_pool_cycling_details) > 0 }
}
output "containerengine_node_pools_node_shape" {
  description = "Map of node_shape values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_shape are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.node_shape if v.node_shape != null && length(v.node_shape) > 0 }
}
output "containerengine_node_pools_node_shape_config" {
  description = "Map of node_shape_config values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_shape_config are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => one(v.node_shape_config) if v.node_shape_config != null && length(v.node_shape_config) > 0 }
}
output "containerengine_node_pools_node_source" {
  description = "Map of node_source values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_source are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.node_source if v.node_source != null && length(v.node_source) > 0 }
}
output "containerengine_node_pools_node_source_details" {
  description = "Map of node_source_details values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no node_source_details are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => one(v.node_source_details) if v.node_source_details != null && length(v.node_source_details) > 0 }
}
output "containerengine_node_pools_nodes" {
  description = "Map of nodes values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no nodes are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.nodes if v.nodes != null && length(v.nodes) > 0 }
}
output "containerengine_node_pools_primary_vnic" {
  description = "Map of primary_vnic values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no primary_vnic are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => one(v.primary_vnic) if v.primary_vnic != null && length(v.primary_vnic) > 0 }
}
output "containerengine_node_pools_quantity_per_subnet" {
  description = "Map of quantity_per_subnet values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no quantity_per_subnet are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.quantity_per_subnet if v.quantity_per_subnet != null }
}
output "containerengine_node_pools_secondary_vnics" {
  description = "Map of secondary_vnics values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no secondary_vnics are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.secondary_vnics if v.secondary_vnics != null && length(v.secondary_vnics) > 0 }
}
output "containerengine_node_pools_ssh_public_key" {
  description = "Map of ssh_public_key values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no ssh_public_key are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.ssh_public_key if v.ssh_public_key != null && length(v.ssh_public_key) > 0 }
}
output "containerengine_node_pools_state" {
  description = "Map of state values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no state are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.state if v.state != null && length(v.state) > 0 }
}
output "containerengine_node_pools_subnet_ids" {
  description = "Map of subnet_ids values across all containerengine_node_pools, keyed the same as var.containerengine_node_pools except keys with no subnet_ids are omitted"
  value       = { for k, v in oci_containerengine_node_pool.containerengine_node_pools : k => v.subnet_ids if v.subnet_ids != null && length(v.subnet_ids) > 0 }
}

