variable "tfc_org" {
  description = "Organización de HCP Terraform"
  default     = "camus-labs-dev"
}

variable "github_org" {
  description = "Organización de GitHub"
  default     = "camus-terraform"
}

variable "org_slug" {
  description = "Prefijo para todos los recursos"
  default     = "camus"
}

variable "github_token" {
  description = "Token de GitHub que se le pasa al workspace camus-github"
  type        = string
  sensitive   = true
}