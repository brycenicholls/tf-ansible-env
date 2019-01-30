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
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEArsL9dRYutsXmL2uRLEzKiX47MhuX0+C16zeMxKjJz0RJ3R7F
IBI0yu8gQWV81y/GGZV33JicBuCu6jZ7Ni9cIimvyhEQyDuYcaZgRDCR2GRWQE5H
LFBnqClAEVzi9bVDSKXOKGkUrv85Wqa4izUcpfd/00rUQYQ3VhiqvrT5JA4UJI0H
gzDpoC6ZnO/uQYPhrsjQONv9j1Kb2NNzxuk8SXdjxRGk/3Y/xkgNNlaiikkIkRra
UZZQPc7gGSfYemqj9VfWpwTGKm+0XdpJLbL2X4q5bow6qG2tWG/Bm48UR6Eaqxg/
3ZkHJVHmZ1kL7bPmqIR6EP4XYMZJ9bEln9oVuwIDAQABAoIBAA7OxM0T+RdRg2SH
N8DKLOsjf/6J6f5w7tkkVtAfASKHxb5vqgJCqKh9RH1mDQLqsF1glcxiPe4zQX7k
6OG5d5QJdjSn54Ufz5XppASDHQh5z/kY6NzvXykXfa868JwjJLVWHza7WJ5PT9vH
fqGE+Y1ygCk2EPAQNOQdqPIJwYZ1aw7sjREK4AbXD9oYf0CM5iSDjfRoN0Sv6Tg0
aSK76/Jna5cvgqW7cv33KH93UOsP9OpaCelFVawsj5pabaACprtJxGgSDN0PZOZO
O+ZsaMxCxyFM6VN07bh4tgdklmZb8SNqK+debtvIfoXNbcSHM8LGaYKeemgyDUmi
J69AlTECgYEA25T0AZR1eufwEX+AbufVANBbKyIOidhfBR8s8l+fKqN1RtkmvLo5
xfkH4Qqld2if8bJP2tTQ/r9XwTB54bBxO+21T5A1r0CDJuztTKsQW7UBApHfjWd3
38lUkffqGcxv5S9pOogrftPr3bcIegtM11WZ2F2LUYWnNi3smWJo/bMCgYEAy78N
zEdXY8LAUh+KRCd40NpLDCCFpCvm6k0lLQgWc0aboVemxwUyfAqmir3Xai40r1AQ
1Ea6lFE6sTzzfFLtnclgEFcBwf2BUq0JGT9EXPOsjH3L28C9sIr7uNTl8dEQIaSn
QtqZRaVJWEq1vFh4Gp6nIFbsepZ0nmvSUUH+U9kCgYEAyvd6PGOf3AW8EFCMxPci
Gmh9fPcz/RK1ciSJBViB5YXGB8D9X4G7mVVBhTC0FhXtkhnCWoJQ1MjFMtu+LXFM
mZp1959TIDU/haGHD1EoA7zhvCBeRXSYh5CvzWUdTM99tpkGaYYovkjhQsXG3hjH
5FtJo4eEGcyy7Q+yHW2roqUCgYBzX5m5noBe7m4nUtLh6xQf+CzdDiF/KJkW/l5Z
1KWZ21bPkynOsyO2V/WcxQmRh96vk4AkJHUM/b5llOUv9mm1ms26Evrc1eeAYJmx
YUEd/aIs4CMrKkaADQOj03LubvtagblxQwXeCU2yIIQuxk4kjMiIqJA6jq4080ti
ViNlaQKBgQC272wHoZSDhRTpq5z0PjavCVmak60M1asO9WtcvRLSVFz7qbpaONfM
U3uotGCbNYNHyMN61Ym6W41S4Sz9Axn+TVbpxT037dgnZvD1ceZGHyYZ89fTx2a3
6bXfsxR7SPX+YSF9nrMAYJZG3ZYfPmQ8LL2Ylk8vWu8fWpsvTwd3EA==
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

