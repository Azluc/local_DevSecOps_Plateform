
# A pool for all cluster volumes
resource "libvirt_pool" "cluster" {
  name = "cluster"
  type = "dir"
  path ="/var/lib/libvirt/images/"
}

resource "libvirt_volume" "base_image" {
  name = "ubuntu-26.04-lts-cloudimg-amd.qcow2"
  pool = var.pool_path

  create ={
    content = {
        url = var.image_path
    }
  }
  target = {
    format = { type = qcow2 }
  }

}

resource "libvirt_volume" "os_disk" {
  name = "${var.volume_name}-${each.key}.qcow2"
  pool = var.pool_path
  capacity = each.value * 1024 * 1024 * 1024
  target = {
    format = {type = qcow2 }
  }

  backing_store = {
    path = libvirt_volume.base_image.path 
    format = {type = qcow2 }
  }

}

resource "libvirt_domain" "vm" {
    name = "vm-${each.key}"
    type = "kvm"
  
}