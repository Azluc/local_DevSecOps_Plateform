variable "vm_count" {
  description = "number of VMs"
  type = number
  default = 3
}

variable "vms" {
  description = "la description des 3 VMS"
  type = map(object({
    ram = number
    vcpu = number
    role = string
    disk_gb = number
  }))  
  default = {
    "hardening" = {
      ram = 2
      vcpu = 1
      role = "machine to harden"
      disk_gb = 10
    }
    "k3s" = {
      ram = 4
      vcpu = 1
      role = "Clusterq kubernetes"
      disk_gb = 20
    }
    "services" = {  
      ram = 3
      vcpu = 2
      role = "services"
      disk_gb = 15
      }
  }
}

variable "vm_memory"{
  description = "memory ram in MiB"
  type = number
  default = 2048
}

variable "image_name" {
    description = "path to cloud image"
    type = string
    default = "ubuntu-26.04-lts-cloudimg-amd.img"
}

variable "volume_name" {
  description = "name of the current volume"
  type = string
  default = "volume"
}

variable "image_path" {
  description = "ubuntu image cloud path"
  type = string
  default = "/var/lib/libvirt/images/base/ubuntu-26.04-lts-cloudimg-amd.img"
}

variable "pool_path"{
  description = "the path of the pool directory"
  type = string
  default = "vms"
}