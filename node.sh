#!/bin/bash

yum -y update
yum -y install epel-release git vim

cat <<EOF >> /etc/hosts
10.1.2.11   ansible_controller
10.1.2.12   node1
10.1.2.13   node2
10.1.2.14   node3
10.1.2.15   node4
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