##########################

# OIDC

# modules/azuread_github_federated_identity/variables.tf

variable "prefix" {
  type        = string
  default     = "dev-tfaz"
  description = "Prefix for the display names."
}
# variable "application_id" {
#   type        = string
#   description = "The id of the SPN"
# }


# variable "fic_display_name_env" {
#   type        = string
#   default     = "gha-fic-env"
#   description = "Display name prefix for environment federated identity credentials."
# }

# variable "fic_display_name_branch" {
#   type        = string
#   default     = "gha-fic-branch"
#   description = "Display name prefix for branch federated identity credentials."
# }

variable "display_name" {
  description = "display name for the federated identity credential"
  type        = string
  default     = "gha-fic-dev-tfaz"
}

variable "gh_org_name" {
  type        = string
  description = "GitHub organization name."
  default     = "hemsarz"
}

variable "gh_repo_name" {
  type        = string
  description = "GitHub repository name."
  default     = "cloud-resume-challenge-serverless"
}
variable "gh_branches" {
  description = "List of GitHub branches allowed for OIDC authentication"
  type        = list(string)
  default     = ["main", "dev", "feature-branch"]
}

variable "gh_env" {
  type        = list(string)
  default     = ["dev", "prod", "qa"]
  description = "List of GitHub environments to create federated identity credentials for."
}

# variable "audiences" {
#   type = string
# }

# variable "issuer" {
#   type = string
# }

# variable "subject" {
#   type = string
# }
