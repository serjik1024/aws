#!/bin/sh
#########################################################################
#      Copyright (C) 2020        Sebastian Francisco Colomar Bauza      #
#      SPDX-License-Identifier:  GPL-2.0-only                           #
#########################################################################
set -x                                                                  ;
#########################################################################
engine=containerd                                                       ;
repo=https://download.docker.com/linux/centos/docker-ce.repo		;
#########################################################################
sudo tee /etc/modules-load.d/${engine}.conf <<EOF
overlay
br_netfilter
EOF
sudo modprobe overlay							;
sudo modprobe br_netfilter						;
#########################################################################
sudo tee /etc/sysctl.d/99-kubernetes-cri.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo sysctl --system							;
#########################################################################
sudo yum update -y                                                      ;
sudo yum install -y yum-utils device-mapper-persistent-data lvm2	;
sudo yum-config-manager --add-repo ${repo}				;
sudo yum update -y                                                      ;
sudo yum install -y ${engine}.io					;
sudo mkdir -p /etc/${engine}						;
containerd config default | sudo tee /etc/containerd/config.toml	;
sudo systemctl restart ${engine}					;
sudo systemctl enable --now ${engine}					;
#########################################################################
