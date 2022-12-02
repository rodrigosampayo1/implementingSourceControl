# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

#This only create a resource group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.azure_region
  tags = {
    CostCenter = "CDS Devops"
    DeletionDate = "Jan-2023"
    Stakeholders =  "TomLuxon"
  }

}

#Budget
resource "azurerm_consumption_budget_resource_group" "example" {
  name              = var.budget_name
  resource_group_id = azurerm_resource_group.rg.id

  amount     = 100
  time_grain = "Monthly"

  time_period {
    start_date = "2022-12-01T00:00:00Z"
    end_date   = "2022-12-30T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    threshold_type = "Actual"

    contact_emails = [
      "rodrigo.sampayo@kinandcarta.com",
    ]
  }

  notification {
    enabled   = false
    threshold = 100.0
    operator  = "GreaterThan"

    contact_emails = [
      "rodrigo.sampayo@kinandcarta.com",
    ]
  }
}
