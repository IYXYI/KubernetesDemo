resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.project}-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.project}-dns"

  kubernetes_version = null
  sku_tier           = "Free"

  default_node_pool {
    name                 = "system"
    node_count           = var.node_count
    vm_size              = var.vm_size
    type                 = "VirtualMachineScaleSets"
    orchestrator_version = null
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  role_based_access_control_enabled = true
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
output "rg_name" {
  value = azurerm_resource_group.rg.name
}
