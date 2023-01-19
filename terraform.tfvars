# Application Definition 
company     = "JMD-Urbanismo"
app_name    = "iac-poc-terraform-vm-ubuntu"
app_domain  = "hamoatech.com.br"
environment = "dev" # Dev, Test, Prod, etc

# GCP Settings
gcp_project   = "poc-gcp-terraform-372512"
gcp_region    = "southamerica-east1"
gcp_zone      = "southamerica-east1-a"
gcp_auth_file = "../auth/poc-gcp-terraform-372512-ceed0dca65a2.json"

# GCP Netwok
network-subnet-cidr = "10.10.10.0/24"

# Linux VM
linux_instance_type = "f1-micro"