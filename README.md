# Automated Minecraft Server Deployment on AWS

## Background

### What Will We Do?
- **Provision AWS infrastructure:** Using Terraform, we will create an EC2 instance, configure networking components like VPC and security groups, and ensure that all necessary AWS resources are correctly set up for running a Minecraft server.
- **Configure and manage the Minecraft server:** Once the infrastructure is ready, Ansible will be used to install the Minecraft server, configure its settings, and ensure it's ready for players to connect.

### How Will We Do it?
- **Using Terraform:** We'll write infrastructure-as-code scripts to define and deploy the cloud resources needed.
- **Using Ansible:** We'll write playbooks to automate the configuration of the Minecraft server, making it operational immediately upon deployment.

## Requirements

### Prerequisites
To successfully execute the scripts and deploy the Minecraft server, you will need:
- AWS Account
- Terraform installed on your machine ([Download Terraform](https://www.terraform.io/downloads.html))
- Ansible installed on your machine ([Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))
- AWS CLI installed and configured ([AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html))

### Credentials and Configuration
- **AWS Credentials:** Ensure that your AWS credentials are configured properly by running `aws configure`. This will set up your access key, secret key, and default region.
- **Environment Variables:** Set up the following environment variables for Ansible:
  - `export ANSIBLE_HOST_KEY_CHECKING=False`
  - `export AWS_ACCESS_KEY_ID=<your-access-key-id>`
  - `export AWS_SECRET_ACCESS_KEY=<your-secret-access-key>`

## Major Steps

<!-- One diagram from mine and user major steps -->

## List of Commands to Run

## How to Connect to Minecraft Server