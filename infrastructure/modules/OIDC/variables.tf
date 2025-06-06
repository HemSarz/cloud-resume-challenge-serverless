variable "prefix" {
  type        = string
  default     = "tfaz-dev"
  description = "Prefix for the display names."
}

variable "display_name" {
  description = "display name for the federated identity credential"
  type        = string
}
variable "gh_org_name" {
  type        = string
  description = "GitHub organization name."
}

variable "gh_repo_name" {
  type        = string
  description = "GitHub repository name."
}

variable "gh_branches" {
  type        = list(string)
  default     = ["main"]
  description = "List of GitHub branches to create federated identity credentials for."
}

/*
variable "gh_env" {
  type        = list(string)
  default     = ["dev", "prod", "qa"]
  description = "List of GitHub environments to create federated identity credentials for."
}
*/


variable "audiences" {
  type = list(string)
}

variable "issuer" {
  type = string
}

variable "subject" {
  type = string
}

variable "application_id" {
  type        = string
  description = "The id of the SPN"
}
