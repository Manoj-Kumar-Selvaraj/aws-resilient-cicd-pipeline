#!/bin/bash

echo "📁 Setting up AWS DevOps Terraform project structure..."

# Inside current folder: create terraform and src/app folders
mkdir -p terraform/modules
mkdir -p src/app

# Create top-level Terraform files
touch terraform/{main.tf,provider.tf,variables.tf,outputs.tf,terraform.tfvars,backend.tf}

# Create module folders and base files
for module in codepipeline codebuild codedeploy eventbridge stepfunctions sns sqs
do
    mkdir -p terraform/modules/$module
    touch terraform/modules/$module/{main.tf,variables.tf,outputs.tf}
done

echo "✅ Project structure created:"
tree -a -I '.git|.venv|__pycache__'
