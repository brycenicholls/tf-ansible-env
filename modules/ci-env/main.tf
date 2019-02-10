# Variables for openstack-ukcloud-dev

# Import the openstack datacenter inventory

output "keypair" {
  value = "bryce"
}

output "dc-dns-nameservers" {
  value = [ "1.1.1.1", "8.8.8.8" ]  # Defined as a list here but consumed as a scalar by caller
}

output "dc-ext-net-id" {
  value = "df08c5c8-1242-4c62-ae1a-b0db5ef49f74"
}

output "dc-ingress-1" {
  value = "212.159.77.225/32"
}

output "dc-ingress-2" {
  value = "37.26.92.0/24"
}
output "dc-ingress-3" {
  value = "37.26.88.0/24"
}
output "intra-tenant" {
  value = "10.1.2.0/24"
}
# ...

output "centos-latest" {
  value = "89fdd0fb-5963-46a2-8bd4-b2a38fdad271"
  #value = "073743b4-2eb1-479e-8a30-e480de174141"
  # or better get this out of OS directly
  # value = "${data.openstack_images_image_v2.xenial.id}"
}
output "centos-rabbit" {
  value = "a827e32e-a900-4af9-86eb-e0e8df8e8677"
}
output "rhel-7-lts" {
  value = "53fb2950-5dde-4e1f-bf69-9523b24231c4"
}
output "x1-small" {
  value = "85ce3adb-2566-4c30-a990-b3c195531c71"
  #value = "c46be6d1-979d-4489-8ffe-e421a3c83fdd"
  # or better get this out of OS directly
  # value = "${data.openstack_compute_flavor_v2.x1-small.id}"
}
