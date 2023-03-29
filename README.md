# Terraform Configurations

## Installation
Refer to [Install Docker Engine](https://docs.docker.com/engine/install/) for instructions on how to install the Docker Engine for your target hardware.

### Clone Repository

```shell
$ git clone https://github.com/paytonward6/terraform
$ cd terraform
```

## Pihole (Docker)
### Usage

```shell
$ cd pihole
$ terraform apply -var path=$(pwd) -var timezone=America/Chicago
```
or you can manually change `default` under `variable path` in `main.tf` to the absolute path where `main.tf` is located (changing other variables can be done in a similar manner).

## Defaults
- `timezone=America/Chicago`
