#!/usr/bin/env bash
set -ouex pipefail

dnf install -y google-noto-fonts-all --allowerasing
dnf install -y langpacks\* --allowerasing