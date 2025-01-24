#!/usr/bin/env bash
set -ouex pipefail

# Remove GNOME classic and bloat extensions
dnf remove -y gnome-classic-session gnome-shell-extension\*