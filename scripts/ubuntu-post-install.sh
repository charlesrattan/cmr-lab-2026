#!/bin/bash

# =====================================================

# CMR Lab 2026 - Ubuntu VM Baseline Configuration

# For Proxmox Virtual Machines

# Author: Charles Rattan

# =====================================================

set -e

echo "======================================="
echo "CMR Lab Ubuntu Baseline Configuration"
echo "======================================="

# -----------------------------------------------------

# Update System

# -----------------------------------------------------

echo "[1/8] Updating package repositories..."
sudo apt update

echo "[2/8] Upgrading installed packages..."
sudo apt upgrade -y

# -----------------------------------------------------

# Install Baseline Utilities

# -----------------------------------------------------

echo "[3/8] Installing baseline utilities..."

sudo apt install -y \
curl \
wget \
git \
nano \
vim \
htop \
btop \
net-tools \
unzip \
zip \
dnsutils \
traceroute \
software-properties-common \
ca-certificates \
apt-transport-https

# -----------------------------------------------------

# Install QEMU Guest Agent

# -----------------------------------------------------

echo "[4/8] Installing QEMU Guest Agent..."

sudo apt install -y qemu-guest-agent

sudo systemctl enable qemu-guest-agent
sudo systemctl start qemu-guest-agent

# -----------------------------------------------------

# Configure Timezone

# -----------------------------------------------------

echo "[5/8] Configuring timezone..."

sudo timedatectl set-timezone America/Port_of_Spain

# -----------------------------------------------------

# Configure Firewall

# -----------------------------------------------------

echo "[6/8] Configuring UFW firewall..."

sudo ufw allow OpenSSH
sudo ufw --force enable

# -----------------------------------------------------

# Verify Services

# -----------------------------------------------------

echo "[7/8] Verifying services..."

sudo systemctl status qemu-guest-agent --no-pager

# -----------------------------------------------------

# Display System Information

# -----------------------------------------------------

echo "[8/8] Displaying system information..."

echo ""
echo "Hostname:"
hostnamectl --static

echo ""
echo "IP Addresses:"
ip -4 addr show | grep inet

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "QEMU Guest Agent:"
systemctl is-active qemu-guest-agent

echo ""
echo "======================================="
echo "Baseline Configuration Complete"
echo "======================================="
echo ""
echo "Recommended:"
echo "1. Enable QEMU Guest Agent in Proxmox"
echo "2. Reboot VM"
echo "3. Create Proxmox Snapshot"
echo ""
