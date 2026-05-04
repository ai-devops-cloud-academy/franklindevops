terraform {
  backend "azurerm" {
    storage_account_name = "franklindemo"
    container_name       = "containerdemo"
    key                  = "demoytb/state.terraform.tfstate"
    resource_group_name  = "ai-rg"
  }
}
