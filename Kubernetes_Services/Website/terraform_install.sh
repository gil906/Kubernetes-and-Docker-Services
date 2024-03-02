#!/bin/bash

# Install Terraform
TERRAFORM_VERSION="1.0.0"  # Replace with your desired version
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Authenticate to Azure
az login

# Set Azure subscription (if you have multiple subscriptions)
# Replace <subscription_id> with your Azure subscription ID
az account set --subscription <subscription_id>

# Initialize Terraform
terraform init
