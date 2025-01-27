#!/usr/bin/env bash
set -ouex pipefail

dnf install -y snapd
ln -s /var/lib/snapd/snap /snap