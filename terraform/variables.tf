variable "subscription_id" {
  type        = string
  description = "ID d'abonnement Azure"
}

variable "project" {
  type        = string
  default     = "demo-k8s"
  description = "Préfixe de nommage"
}

variable "location" {
  type        = string
  default     = "westeurope"
}

variable "node_count" {
  type        = number
  default     = 2
}

variable "vm_size" {
  type        = string
  default     = "Standard_B4ms"
}
