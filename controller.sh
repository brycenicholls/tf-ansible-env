#!/bin/bash
yum install -y epel-release
yum -y install ansible python vim
mkdir /home/centos/ansible
chown -hR centos /home/centos/ansible/
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

cat <<EOF >> /etc/hosts
10.1.2.11   ansible_controller
10.1.2.12   node1
10.1.2.13   node2
10.1.2.14   node3
10.1.2.15   node4
EOF

cat <<EOF > /home/centos/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAv0zQfYUpEgmeJhDZ8PPMGu3ddaQugKDSEW5ZDYWs9jrQTYIv
EpxCw131eEg8AQ/MpTj+8wraPYelyrQ9pfkRQkrj7RVDKRkIi1R/is3ZPH0KrOPO
CkK/VoV478um9JXO6YonZ1T/AzmkkhpFiypKXP6yKiJhR6m/QdLRZxwv7+SWN5hg
WE3fRuG/T4VhAUqWlVBi8X0VjZbzzVLx71oHEZkPUvtzrBRCR1jJ+1eDGI/7L3bB
xyssf0L3fFmv97aba1BfGCaKPcDYLC9TA2jmqW4B4FzboyedN6GyUbzjLeON54kU
RK5fKGq+u0mCzFLOPRn+ZO9eNKUzvR2DdNu6EQIDAQABAoIBAFSIfRj6Xsu5tEjd
6XCwSuEbe2Egy+vLJQjO2ks/Zs7n7mRRwrtWkaoDOxWL1fgiIyxfo0mC4i2OY5TP
UO6mwRmqPk3lt2fRyBTJohKUJAq2tqDviXy/Qg3ZrTdJpt0t1eEdS4w94vJp5m8p
bNGyPmoZomE8EAC64ekUX7RQoF5AwC/lCvHHSaDPAbcdPaQsXTVOzR7+tICd0CMr
ghi/VdDkUCIAzZzAU5jCYagI7IwJQIMy+vQituk7fLXTsRuiTBJy3eqncJW6s+Pz
qvmNKj0ILQB1P9L4KdM4PBNhmWPFChz3h2nkgC8skBz3tKLPkP7Qnqs9mop7axfk
1ZNHXgECgYEA8wnJxFYNroJ80FpSWA3MxGwbs+fTXU2dqO0sErjwleF9QIgSt3bE
31HVvgluPzmL7fXLpc6hsCup7cw+Zdv5nKzC9GVqAgt0ndMNIP6PkCB9YtyVAz5C
wq2U23oPH+DRHJw2pkb0mqi/rMZxFOHpNUV/a/3iCTXcfnmiyigNcGUCgYEAyYCk
gchiLQSr6Yd0MfSI1zzmlt8gowpZUji6xJW6Nw43PMY7wwTQzD+2lDKYduLIiZRM
XPf97oBpdnDhhai4Zqh/aU5E6zoeUUXU1tEnGDZ2DGkHfTyDkt8tPAIhWFPf9+yL
iAC7YDARefgruKSBd3YIobba7fVBTdghN4f0Cj0CgYEA6XeBp2WzBuy60buyVnwL
NLVVd2E/neWtilUrfWDDXHecRp1wvWUOgiiu1ztf+MRjM1hnJQR2NjH7r0AAwQCr
rGIZdYTmbMhsYiAYAJYJez56tLmJO/BXWYQ99wgt90WUG5PEu751wwxP9L08a/8I
c/ArE6ZzuL1Q7v4R73jCUDECgYBq6hPfPMhCpKjmhtVzMBFvSsP6pzc06ufLxYfr
iJo+Xg+W8oOBDUwQI3onldTpt5i5zvLZnUehxYavrmMqvQPijGLWKA5PVQ4DB29P
77ezlCn8mbm8jGAvjLT+kw7IQ/ChJmQ+bEz/U2HiengQR1DeZsVbsJ7nBWt590Rg
p4Un7QKBgGtlagpmqSe+DCwAdQvcVLddd4TtWC1FTCaMwUba2qMyeHboKnFwrJ4X
YBkVt33Gg1wZ6ctkERKYBNTrSgnMa8SylDPQ+OuyJV6iktRl+DJTAKasFNyCgOeF
Ccdv/1LiJotaKk8LgIRZUyyBivCEm/0OUtlrSBHl/X9fD+gGaOpm
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
