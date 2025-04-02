##########################

# OIDC

variable "prefix" {
  type        = string
  default     = "tfaz-dev"
  description = "Prefix for the display names."
}

variable "application_display_name" {
  type        = string
  description = "Display name of the Azure AD application."
}

variable "fic_display_name_env" {
  type        = string
  default     = "github-actions-fic-env"
  description = "Display name prefix for environment federated identity credentials."
}

variable "fic_display_name_branch" {
  type        = string
  default     = "github-actions-fic-branch"
  description = "Display name prefix for branch federated identity credentials."
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
  type        = list(string)
  default     = ["main"]
  description = "List of GitHub branches to create federated identity credentials for."
  validation {
    condition = contains([
      "main"
    ], lower(var.gh_branches))
    error_message = "Choose correct branch"
  }
}

variable "gh_env" {
  type        = list(string)
  default     = ["dev", "prod", "qa"]
  description = "List of GitHub environments to create federated identity credentials for."
}

variable "audiences" {
  type = string
}

variable "issuer" {
  type = string
}

variable "subject" {
  type = string
}
