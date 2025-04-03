output "branch_fic_ids" {
  value = { for k, v in azuread_application_federated_identity_credential.branches : k => v.id }
}

# output "env_fic_ids" {
#   value = { for k, v in azuread_application_federated_identity_credential.env : k => v.id }
# }
