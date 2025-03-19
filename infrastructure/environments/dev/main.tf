## ---------------------------------------------------
# Resource Group Dev
## ---------------------------------------------------

module "rg" {
  source   = "../../modules/infrares/rg"
  name     = "test"
  location = "norwayeast"
}

module "stg" {
  source = "../../modules/infrares/stg"

}
