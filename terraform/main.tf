
# A pool for all cluster volumes
resource "libvirt_pool" "cluster" {
  name = "cluster"
  type = "dir"
  path ="/var/lib/libvirt/images/"
}

resource "libvirt_volume" "base_image" {
  
}