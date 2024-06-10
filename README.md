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

<!-- ## Major Steps -->

<!-- One diagram from mine and user major steps -->

## List of Commands to Run

```bash
# Clone the repository
git clone https://github.com/awhittle2/Minecraft-2.0.git
cd Minecraft-Server/

# Enter your AWS account details
```
What you'll need:
- Your AWS Access Key ID
- Your AWS Secret Access Key
- Your AWS Session Token

Where to go to find it:
1. Start your Learner Lab
2. Click `AWS Details`
3. Click `AWS CLI: Show`

```bash
# Replace the underscores with your AWS credentials
export AWS_ACCESS_KEY_ID=___
export AWS_SECRET_ACCESS_KEY=___
export AWS_SESSION_TOKEN=___

# Make sure that main.tf is there
ls

# Initialize the terraform prjoect
terraform init

# Apply the changes
terraform apply

# Wait about 5 minutes for it to create the instance and run the set-up script

# Then, connect to the Minecraft Server using the IP address that prints out
# If you do not know how, please refer to the last section of this README file

# Lastly, to test if it auto-starts on reboot, replace the underscores with the instance ID that also gets printed out, and press enter
aws ec2 reboot-instances --instance-ids i-___
```

## How to Connect to Minecraft Server

1. Test the server using Nmap
```
nmap -sV -Pn -p T:25565 <instance_public_ip>
```