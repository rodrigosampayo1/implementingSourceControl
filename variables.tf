variable "resource_group_name" {
    description = "Name of resource group"
    type = string
    default = "myTFResourceGroup"
}
#Si no se le pasa ningun valor, usa la variable default

variable "azure_region" {
    description = "Name of region"
    type = string
    default = "westus2"
}

#variable "support_users" {
#
#}

variable "budget_name"{
    description = "Name of resource group budget"
    default = "newBudget"
    type = string
}