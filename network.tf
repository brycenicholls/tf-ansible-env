##----------------------------< ansible_net create >----------------------------##
resource "openstack_networking_network_v2" "ansible_net" {
  name           = "ansible_net"
  admin_state_up = "true"
}
##----------------------------< Create a subnet and attach to ansible_net >----------------------------##
resource "openstack_networking_subnet_v2" "ansible_subnet" {
  name       = "ansible_subnet"
  network_id = "${openstack_networking_network_v2.ansible_net.id}"
  cidr       = "10.1.2.0/24"
  ip_version = 4
  dns_nameservers = ["1.1.1.1"]
}
##----------------------------< router create >----------------------------##
resource "openstack_networking_router_v2" "R-ANSIBLE" {
  name                = "R-ANSIBLE"
  admin_state_up      = true
  external_network_id = "${module.ci-env.dc-ext-net-id}"
}
##----------------------------< attach R1 to ansible_net >----------------------------##
resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = "${openstack_networking_router_v2.R-ANSIBLE.id}"
  subnet_id = "${openstack_networking_subnet_v2.ansible_subnet.id}"
}
##----------------------------< create ports and attach to ansible_net >----------------------------##
resource "openstack_networking_port_v2" "port_1" {
  name               = "port_1"
  network_id         = "${openstack_networking_network_v2.ansible_net.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.ansible_secgroup.id}"]
  
  fixed_ip {
    "subnet_id"  = "${openstack_networking_subnet_v2.ansible_subnet.id}"
    "ip_address" = "10.1.2.11"
  }
}
resource "openstack_networking_port_v2" "port_2" {
  name               = "port_2"
  network_id         = "${openstack_networking_network_v2.ansible_net.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.ansible_secgroup.id}"]

  fixed_ip {
    "subnet_id"  = "${openstack_networking_subnet_v2.ansible_subnet.id}"
    "ip_address" = "10.1.2.12"
  }
}
resource "openstack_networking_port_v2" "port_3" {
  name               = "port_3"
  network_id         = "${openstack_networking_network_v2.ansible_net.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.ansible_secgroup.id}"]

  fixed_ip {
    "subnet_id"  = "${openstack_networking_subnet_v2.ansible_subnet.id}"
    "ip_address" = "10.1.2.13"
  }
}
resource "openstack_networking_port_v2" "port_4" {
  name               = "port_4"
  network_id         = "${openstack_networking_network_v2.ansible_net.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.ansible_secgroup.id}"]

  fixed_ip {
    "subnet_id"  = "${openstack_networking_subnet_v2.ansible_subnet.id}"
    "ip_address" = "10.1.2.14"
  }
}
resource "openstack_networking_port_v2" "port_5" {
  name               = "port_5"
  network_id         = "${openstack_networking_network_v2.ansible_net.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.ansible_secgroup.id}"]

  fixed_ip {
    "subnet_id"  = "${openstack_networking_subnet_v2.ansible_subnet.id}"
    "ip_address" = "10.1.2.15"
  }
}
##----------------------------< floating ip create -1 >----------------------------##
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "internet"
}
resource "openstack_compute_floatingip_associate_v2" "floatip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.ansible_controller.id}"
}