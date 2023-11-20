
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
  }

resource "azurerm_kubernetes_cluster" "aks-rg" {
  name                = var.cluster_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = var.cluster_dns_prefix
  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_DS2_v2"
  }

identity {
  type = "SystemAssigned"
}
  tags = {
    environment = var.environment
  }
}
