#########################
## GCP Linux VM - Main ##
#########################

# Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 4
}

# Create VM
resource "google_compute_instance" "vm_instance_poc_terraform" {
  name         = "${lower(var.company)}-${lower(var.app_name)}-${var.environment}-vm${random_id.instance_id.hex}"
  machine_type = var.linux_instance_type
  zone         = var.gcp_zone
  hostname     = "${var.app_name}-vm${random_id.instance_id.hex}.${var.app_domain}"
  tags         = ["ssh", "http"]

  boot_disk {
    initialize_params {
      image = var.ubuntu_2204_sku
    }
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
  }

    metadata = {
        ssh-keys = "${var.ssh_username}:${file(var.ssh_pub_key_path)}"
    }
    # doc https://medium.com/google-cloud/a-ci-cd-solution-in-under-10-minutes-featuring-terraform-ansible-and-drone-ci-on-gcp-16bba497c655

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.network_subnet.name
    access_config {}
  }
} 