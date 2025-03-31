# Cloud Resume Challenge - Serverless

This repository contains the infrastructure-as-code and configuration files to deploy a serverless cloud resume, fulfilling the requirements of the Cloud Resume Challenge.

## Overview

The Cloud Resume Challenge is a hands-on project designed to demonstrate proficiency in cloud technologies. This repository specifically focuses on deploying the resume using serverless architecture on Azure, leveraging Terraform for infrastructure provisioning and GitHub Actions for CI/CD.

## Architecture

The project utilizes the following Azure services:

* **Azure Functions:** Hosts the backend API to handle visitor counts.
* **Azure Storage (Static Website):** Serves the static HTML, CSS, and JavaScript files for the resume website.
* **Azure Cosmos DB:** Stores the visitor count data.
* **Azure AD (Federated Identity Credentials):** Enables secure authentication for GitHub Actions to deploy to Azure.

## Key Features

* **Serverless Deployment:** Leverages Azure Functions and static website hosting for cost-effective and scalable deployment.
* **Infrastructure as Code (IaC):** Uses Terraform to provision and manage Azure resources.
* **Continuous Integration/Continuous Deployment (CI/CD):** Implements GitHub Actions workflows for automated deployment.
* **Visitor Counter:** Implements a dynamic visitor counter using Azure Functions and Cosmos DB.
* **Security Best Practices:** Uses Federated Identity Credentials to secure Azure deployments from GitHub Actions.
* **Automated Code Quality and Security Checks:** Implements `tflint` and `checkov` checks in the Github actions workflow.

## Repository Structure

📦cloud-resume-challenge-serverless
 ┣ 📂docs
 ┃ ┣ 📜architecture.md
 ┃ ┗ 📜deployment.md
 ┣ 📂infrastructure
 ┃ ┣ 📂environments
 ┃ ┃ ┣ 📂dev
 ┃ ┃ ┃ ┣ 📜backend.tf
 ┃ ┃ ┃ ┣ 📜data.tf
 ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┣ 📜oidc_dev.tf
 ┃ ┃ ┃ ┣ 📜terraform-dev.tfvars
 ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┗ 📂prod
 ┃ ┃ ┃ ┣ 📜backend.tf
 ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┗ 📂modules
 ┃ ┃ ┣ 📂cosmosdb
 ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┣ 📂functions
 ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┣ 📂infrares
 ┃ ┃ ┃ ┣ 📂kv
 ┃ ┃ ┃ ┃ ┣ 📂secrets
 ┃ ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┣ 📂rg
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┗ 📂stg
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┣ 📂monitoring
 ┃ ┃ ┃ ┣ 📂azGrafana
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┗ 📂azPrometheus
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┣ 📂networking
 ┃ ┃ ┃ ┣ 📂nsg
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┣ 📂nsg_association
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┣ 📂privatedns
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┣ 📂privateendpoint
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┣ 📂subnet
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┃ ┗ 📂vnet
 ┃ ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┃ ┣ 📜outputs.tf
 ┃ ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┣ 📂OIDC
 ┃ ┃ ┃ ┣ 📜data.tf
 ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┗ 📜variables.tf
 ┃ ┃ ┗ 📂staticwebapp
 ┃ ┃ ┃ ┣ 📜main.tf
 ┃ ┃ ┃ ┣ 📜output.tf
 ┃ ┃ ┃ ┗ 📜variables.tf
 ┣ 📂scripts
 ┃ ┣ 📜cleanup.sh
 ┃ ┣ 📜move.ps1
 ┃ ┗ 📜setup.ps1
 ┣ 📂src
 ┃ ┣ 📂backend
 ┃ ┃ ┣ 📜.funcignore
 ┃ ┃ ┣ 📜.gitignore
 ┃ ┃ ┣ 📜.pre-commit-config.yaml
 ┃ ┃ ┣ 📜function_app.py
 ┃ ┃ ┣ 📜host.json
 ┃ ┃ ┣ 📜README.md
 ┃ ┃ ┗ 📜requirements.txt
 ┃ ┗ 📂frontend
 ┃ ┃ ┗ 📜index.html
 ┗ 📜.gitignore

## Prerequisites

* Azure subscription
* GitHub account
* Terraform CLI (optional for local testing)
* Azure CLI (optional for local testing)

## Deployment

The deployment is fully automated through the GitHub Actions workflow (`oidc.yml`). To deploy the resume:

1.  **Fork this repository.**
2.  **Configure Azure Credentials:**
    * Set up Azure AD Federated Identity Credentials (refer to the workflow file for required secrets).
    * Configure the required secrets in your GitHub repository's secrets settings.
3.  **Trigger the Workflow:**
    * Push changes to the `main` branch.
    * Manually trigger the `Deploy` workflow from the GitHub Actions tab.

## Terraform Configuration

The Terraform configuration in `infrastructure/environments/dev/oidc/` defines the necessary Azure resources. Ensure you have the correct Azure provider configuration and variables.

## CI/CD Workflow

The GitHub Actions workflow (`oidc.yml`) automates the following steps:

1.  **Checkout Repository:** Clones the repository.
2.  **Setup Terraform:** Installs Terraform.
3.  **Azure Login:** Authenticates with Azure using Federated Identity Credentials.
4.  **Terraform Formatting Check:** Checks the Terraform code formatting using `terraform fmt -check`.
5.  **Terraform Validation:** Validates the Terraform configuration using `terraform validate`.
6.  **TFLint:** Lints the Terraform code using `tflint`.
7.  **Checkov Security Scan:** Scans the Terraform code for security vulnerabilities using `checkov`.
8.  **Terraform Initialization:** Initializes the Terraform working directory.
9.  **Terraform Plan:** Generates a Terraform plan.
10. **Terraform Apply:** Applies the Terraform configuration to deploy the resources.

## License

This project is licensed under the [MIT License](LICENSE).

