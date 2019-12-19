#!/bin/bash
yum install -y epel-release
yum -y install ansible python vim git
mkdir /home/centos/ansible
chown -hR centos /home/centos/ansible/
git clone https://github.com/brycenicholls/ansible-labs.git /home/centos/ansible/

cat <<EOF >> /home/centos/ansible/inventory
[all]
ansible_controller
node1
node2
node3
node4
[controller]
ansible_controller
[haproxy]
node1
node2
[webservers]
node3
node4
EOF
cat <<EOF >> /home/centos/ansible/ansible.cfg
[defaults]
inventory = ./inventory
remote_user = centos
ask_pass = false
[privilege_escalation]
become = true
become_method = sudo
become_user = root
become_ask_pass = false
EOF
cat <<EOF >> /etc/hosts
10.1.2.11   ansible_controller
10.1.2.12   node1
10.1.2.13   node2
10.1.2.14   node3
10.1.2.15   node4
EOF

cat <<EOF > /home/centos/.ssh/id_rsa
-----END RSA PRIVATE KEY-----
EOF

cat <<EOF > /home/centos/.vimrc
autocmd FileType yaml setlocal ai ts=2 sw=2 et
filetype plugin indent on
set nocompatible
set relativenumber
set cursorline
set showmatch
set incsearch
set hlsearch
set expandtab
EOF

cat <<EOF > /root/.vimrc
autocmd FileType yaml setlocal ai ts=2 sw=2 et
filetype plugin indent on
set nocompatible
set relativenumber
set cursorline
set showmatch
set incsearch
set hlsearch
set expandtab
EOF

chown -hR centos /home/centos/ansible/
