provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

data "azurerm_kubernetes_cluster" "example" {
  name                = azurerm_kubernetes_cluster.example.name
  resource_group_name = "${var.prefix}-k8s-resources"
}

resource "local_file" "foo" {
  content  = azurerm_kubernetes_cluster.example.kube_config_raw
  filename = "${path.module}/kubeconfig"
}

