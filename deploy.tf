# Configure the OpenStack Provider
provider "openstack" {}

##----------------------------< instance  ansible_controller create >----------------------------##
resource "openstack_compute_instance_v2" "ansible_controller" {
  name      = "ansible_controller"
  image_id  = "${module.ci-env.centos-latest}"
  flavor_id = "${module.ci-env.x1-small}"
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
  image_id  = "${module.ci-env.centos-latest}"
  flavor_id = "${module.ci-env.x1-small}"

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
  image_id  = "${module.ci-env.centos-latest}"
  flavor_id = "${module.ci-env.x1-small}"

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
  image_id  = "${module.ci-env.centos-latest}"
  flavor_id = "${module.ci-env.x1-small}"

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
  image_id  = "${module.ci-env.centos-latest}"
  flavor_id = "${module.ci-env.x1-small}"

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
