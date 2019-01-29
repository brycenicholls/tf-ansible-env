##----------------------------< Create a security group >----------------------------##
resource "openstack_compute_secgroup_v2" "ansible_secgroup" {
  name        = "ansible_secgroup"
  description = "Allow web traffic inbound"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "${module.ci-env.dc-ingress-1}"
  }
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "${module.ci-env.dc-ingress-2}"
  }
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "${module.ci-env.dc-ingress-3}"
  }

}