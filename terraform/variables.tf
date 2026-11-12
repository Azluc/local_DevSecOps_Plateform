variable "name"{
    description = "nom de la VM "
    type = string
    default = "VM1"
}

variable "memory_mb" {
  description = "allocated RAM in MiB"
  type = number
  default = 512
}

variable "vCPU_count" {
  description = "allocatated vCPU"
  type = number
  default = 1
}

variable "image_path" {
    description = "path to cloud image"
    type = string
    default = "ubuntu-26.04-lts-cloudimg-amd.img"
}