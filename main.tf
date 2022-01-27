provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "weather_api" {
  name     = "aztf"
  location = "eastus"
}

resource "azurerm_container_group" "weatherapi_group" {
  name                = "weatherapi"
  location            = azurerm_resource_group.weather_api.location
  resource_group_name = azurerm_resource_group.weather_api.name

  ip_address_type = "public"
  dns_name_label  = "tkeweatherapi"
  os_type         = "Linux"

  container {
    name   = "weatherapi"
    image = "09035077346/weatherapi:1.0.0"
    cpu    = 1
    memory = 1

    ports {
      port     = 80
      protocol = "TCP"
    }
  }




}