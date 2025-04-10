## cost-reports
### Overview

This repository contains tools for managing AWS cost reports. It includes two main components:

1. **Bash Scripts**: Automate tasks related to AWS cost reports.
2. **Terraform Modules**: Provision infrastructure for cost reporting.

### Prerequisities:  
Following permisions and policies are demanded:
* Admin policy Group
* Cost-Explorer policy Group
* Developer policy group

### Usage

#### Bash Scripts

1. Navigate to the `bash` folder:
    ```bash
    cd /home/labrat/lgrab/cloud-tools/aws/cost-reports/bash
    ```
2. Review the available scripts:
    ```bash
    ls
    ```
3. Execute a script:
    ```bash
    ./generate_daily_report.sh
    ```

#### Terraform Modules

1. Navigate to the `terraform` folder:
    ```bash
    cd /home/labrat/lgrab/cloud-tools/aws/cost-reports/terraform
    ```
2. Initialize Terraform:
    ```bash
    terraform init
    ```
3. Review the available modules and variables:
    ```bash
    terraform plan
    ```
4. Apply the configuration:
    ```bash
    terraform apply
    ```
    Confirm the changes when prompted.

### Notes

- Ensure you have the necessary AWS credentials configured.
- Install required tools: `bash`, `terraform`, and `aws-cli`.