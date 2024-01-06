# Project Infrastructure automation using Vagrant, Ansible and Terraform

## 1. Installation Script: repos.sh

This script automates the installation of essential tools and dependencies required for setting up virtualization and provisioning tools on an Ubuntu 22.04 system.

### Usage

To use this script, follow these steps:

1. Clone this repository to your local machine:

    ```bash
    git clone <repository-url>
    ```

2. Change to the project directory:

    ```bash
    cd <repository-directory>
    ```

3. Execute the installation script:

    ```bash
    sudo bash repos.sh
    ```
### Script Details

The installation script performs the following tasks:

- Installs VirtualBox, Ansible, and Python3-pip.
- Installs gnupg, software-properties-common, and curl.
- Adds the HashiCorp GPG key and repository to Ubuntu.
- Installs Vagrant version 2.3.4 to prevent compatibility issues with Ansible on Ubuntu 22.04.3 LTS.
- Holds the Vagrant version to prevent automatic updates.
- Enables Nested Virtualization for a VM named "YOUR-VM-Name" .

### Note

Make sure to review and adjust the script according to your specific requirements before running it.

## 2. Vagrantfile with loop

```ruby
# Vagrantfile

This Vagrantfile is designed to set up multiple Ubuntu 22.04 virtual machines using VirtualBox. Each machine is configured with a private network, forwarded ports for access, and provisions with Ansible using the playbook.yaml file.

## Configuration Details

### Common VM Configuration

- Base Box: `generic/ubuntu2204`
- Private Network: DHCP

### Number of Virtual Machines

The Vagrantfile creates a specified number of virtual machines. Adjust the `num_vm` variable to create the desired number.

### VM-specific Configuration

Each virtual machine is configured with the following settings:

- Box: `generic/ubuntu2204`
- Forwarded Port: Maps guest port 80 to host ports starting from 8080
- Hostname: Formatted as "vm{i}"
- Provider (VirtualBox):
  - Name: Formatted as "vm{i}"
  - Memory: 2048 MB
  - CPUs: 2

## Usage

1. Customize the Vagrantfile if needed, adjusting the number of virtual machines or other configurations.

2. Start the virtual machines:

    ```bash
    vagrant up
    ```

3. Access each virtual machine through the command:
    ```bash
    vagrant ssh
    ```
      

### Ansible Provisioning

Ansible is used for provisioning each virtual machine, and the playbook.yaml file is specified for configuration.
# Ansible Playbook: Setup Terraform and Docker on Ubuntu 22.04

This Ansible playbook automates the setup of Terraform and Docker on a new Ubuntu 22.04 system. It also initializes a Terraform project and applies the configuration.

## Usage

To use this playbook, follow these steps:

### Prerequisites

- Ansible installed on the machine running the playbook
- A target Ubuntu 22.04 machine accessible via SSH

## Playbook Details

The Ansible playbook performs the following tasks:

1. Updates the APT package cache.
2. Adds the HashiCorp GPG key.
3. Adds the HashiCorp repository to Ubuntu.
4. Installs required software including Docker, GnuPG, Software Properties Common, Curl, and Terraform.
5. Reloads the Docker daemon.
6. Ensures that the "vagrant" user is in the "docker" group.
7. Adjusts Docker daemon socket permissions if needed.
8. Creates a directory for the Terraform project.
9. Copies the `main.tf` Terraform file to the VM.
10. Initializes the Terraform project with `terraform init`.
11. Applies the Terraform configuration with `terraform apply -auto-approve`.

 ssh 
   ```
# Terraform Docker Configuration

This Terraform configuration defines Docker resources for running a container with the image "dhouhaaoui/mycv:latest."

## Getting Started

To use this Terraform setup, follow these steps:

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- Docker installed on the target machine

3. Edit the `main.tf` file if needed, adjusting the Docker image, container name, and port configurations.

4. Initialize the Terraform configuration:

    ```bash
    terraform init
    ```

5. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

## Configuration Details

### main.tf

The `main.tf` file contains the Terraform configuration for Docker resources, including the Docker provider, Docker image, and Docker container.

#### Docker Provider

- Uses the `kreuzwerker/docker` provider version 3.0.2.

#### Docker Image

- Name: "dockerhub-username/docker_image:latest"
- Keep Locally: false

#### Docker Container

- Image: Uses the Docker image specified in the `docker_image` resource.
- Ports: Configures dynamic ports, mapping internal port 80 to external ports starting from 8080.

## Cleanup

To remove the Docker resources created by Terraform, run:

```bash
terraform destroy

## Author

Aouididi Dhouha

## License

This project is licensed under the [MIT License](LICENSE).
