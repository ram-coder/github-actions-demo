variable "my_public_ip" {
  type        = string
  description = "Public IP to allow for RDP"
}

variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}
