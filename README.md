# GCP Infrastructure Provisioning with Terraform

This Terraform configuration provisions the following resources on Google Cloud Platform (GCP):

- Cloud SQL (managed database)
- Cloud Run (containerized service)
- HTTP(S) Load Balancer
- VPC Network and Subnet
- Firewall Rules for HTTP/HTTPS traffic

### Prerequisites

Before you begin, ensure you have the following installed:

1. **Terraform** (v1.x or later) - [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. **Google Cloud SDK (gcloud)** - [Install Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
3. **Google Cloud Project** - You need an active GCP project with billing enabled.

## Setup Instructions

### 1. Clone the Repository

Clone the project repository to your local machine:

```bash
git clone https://github.com/your-repo/terraform-gcp-infra.git
cd terraform-gcp-infra
```

### 2. Authenticate with GCP
Log in to your Google Cloud account and authenticate with the gcloud CLI:

bash
Copy code
gcloud auth application-default login
Set your desired project:

bash
Copy code
gcloud config set project <YOUR_PROJECT_ID>
### 3. Define Variables
Option 1: Using a terraform.tfvars File
Create a terraform.tfvars file to store the variable values needed by Terraform.

Example terraform.tfvars:
```bash
hcl
Copy code
project_id        = "your-gcp-project-id"
region            = "us-central1"
cloud_run_image   = "gcr.io/your-project/your-app:latest"
ssl_certificate   = "path/to/cert.pem"
ssl_private_key   = "path/to/key.pem"
```
### Option 2: Pass Variables via Command Line
Alternatively, you can pass variables directly in the command line when applying Terraform (see below).

### 4. Initialize Terraform
Run the following command to initialize Terraform. This will download the necessary provider plugins and set up your environment:

```terraform init```

### 5. Preview the Changes (Optional)
To see what Terraform will provision without making any actual changes, run:

```terraform plan```

### 6. Apply the Terraform Configuration
To provision the infrastructure, run the following command:

If using terraform.tfvars:

```terraform apply```

If passing variables directly via command line:
bash
Copy code
terraform apply \
  -var="project_id=your-gcp-project-id" \
  -var="region=us-central1" \
  -var="cloud_run_image=gcr.io/your-project/your-app:latest" \
  -var="ssl_certificate=path/to/cert.pem" \
  -var="ssl_private_key=path/to/key.pem"
Terraform will prompt you to confirm. Type yes to proceed.

### 7. Verify the Deployment
Once the infrastructure is provisioned, Terraform will output details of the resources (e.g., Load Balancer IP, Cloud Run URL, etc.). You can also check the resources in your Google Cloud Console:

### 8. Clean Up (Optional)
To destroy all the resources created by Terraform, run:

bash
Copy code
terraform destroy
You will be prompted to confirm. Type yes to proceed.

### Notes
Make sure to enable the following APIs in your GCP project before running Terraform:

Cloud Run API (run.googleapis.com)
Cloud SQL Admin API (sqladmin.googleapis.com)
Compute Engine API (compute.googleapis.com)
If you're using a custom SSL certificate for the Load Balancer, ensure you have the ssl_certificate and ssl_private_key files available.

