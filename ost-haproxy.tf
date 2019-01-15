# Configure the OpenStack Provider
provider "openstack" {}

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
  external_network_id = "893a5b59-081a-4e3a-ac50-1e54e262c3fa"
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

resource "openstack_networking_port_v2" "port_6" {
  name               = "port_6"
  network_id         = "${openstack_networking_network_v2.ansible_net.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.ansible_secgroup.id}"]

  fixed_ip {
    "subnet_id"  = "${openstack_networking_subnet_v2.ansible_subnet.id}"
    "ip_address" = "10.1.2.16"
  }
}


##----------------------------< Create a security group >----------------------------##
resource "openstack_compute_secgroup_v2" "ansible_secgroup" {
  name        = "ansible_secgroup"
  description = "Allow web traffic inbound"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "37.26.92.83/32"
  }
    rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "212.159.77.225/32"
  }
    rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "37.26.92.93/32"
  }
      rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "37.26.88.93/32"
  }
  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "10.1.2.0/24"
  }
  rule {
    from_port   = 1
    to_port     = 65535
    ip_protocol = "tcp"
    cidr        = "10.1.2.0/24"
  }
    rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "37.26.88.73/32"
  
}


##----------------------------< instance  ansible_controller create >----------------------------##
resource "openstack_compute_instance_v2" "ansible_controller" {
  name      = "ansible_controller"
  image_id  = "c09aceb5-edad-4392-bc78-197162847dd1"
  flavor_id = "c46be6d1-979d-4489-8ffe-e421a3c83fdd"

  key_pair        = "bryce"
  security_groups = ["${openstack_compute_secgroup_v2.ansible_secgroup.name}"]

  metadata {
    this = "ansible_controller"
  }

  network {
    port = "${openstack_networking_port_v2.port_1.id}"
    
  }
  user_data = "${file("controller.sh")}"
  
}

##----------------------------< node-1 create >----------------------------##
resource "openstack_compute_instance_v2" "node-1" {
  name      = "node-1"
  image_id  = "c09aceb5-edad-4392-bc78-197162847dd1"
  flavor_id = "c46be6d1-979d-4489-8ffe-e421a3c83fdd"

key_pair        = "bryce"
  security_groups = ["${openstack_compute_secgroup_v2.ansible_secgroup.name}"]

  metadata {
    this = "node1"
  }

  network {
    port = "${openstack_networking_port_v2.port_2.id}"
  }
  user_data = "${file("node.sh")}"
}

##----------------------------< node-2 create >----------------------------##
resource "openstack_compute_instance_v2" "node-2" {
  name      = "node-2"
  image_id  = "c09aceb5-edad-4392-bc78-197162847dd1"
  flavor_id = "c46be6d1-979d-4489-8ffe-e421a3c83fdd"

key_pair        = "bryce"
  metadata {
    this = "node2"
  }

  security_groups = ["${openstack_compute_secgroup_v2.ansible_secgroup.name}"]

  network {
    port = "${openstack_networking_port_v2.port_3.id}"
  }
  user_data = "${file("node.sh")}"
}

##----------------------------< node-3 create >----------------------------##
resource "openstack_compute_instance_v2" "node-3" {
  name      = "node-3"
  image_id  = "c09aceb5-edad-4392-bc78-197162847dd1"
  flavor_id = "c46be6d1-979d-4489-8ffe-e421a3c83fdd"

key_pair        = "bryce"
  metadata {
    this = "node3"
  }

  security_groups = ["${openstack_compute_secgroup_v2.ansible_secgroup.name}"]

  network {
    port = "${openstack_networking_port_v2.port_4.id}"
  }
  user_data = "${file("node.sh")}"
}

##----------------------------< node-4 create >----------------------------##
resource "openstack_compute_instance_v2" "node-4" {
  name      = "node-4"
  image_id  = "c09aceb5-edad-4392-bc78-197162847dd1"
  flavor_id = "c46be6d1-979d-4489-8ffe-e421a3c83fdd"

key_pair        = "bryce"
  metadata {
    this = "node4"
  }

  security_groups = ["${openstack_compute_secgroup_v2.ansible_secgroup.name}"]

  network {
    port = "${openstack_networking_port_v2.port_5.id}"
  }
  user_data = "${file("node.sh")}"
}


##----------------------------< floating ip create -1 >----------------------------##
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "internet"
}

resource "openstack_compute_floatingip_associate_v2" "floatip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.ansible_controller.id}"
}