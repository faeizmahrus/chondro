#!/usr/bin/env bash
set -ouex pipefail

sed -i '/^\[composefs\]/,/^\[/ s/enabled = no/enabled = yes/' /usr/lib/ostree/prepare-root.conf
cat /usr/lib/ostree/prepare-root.conf