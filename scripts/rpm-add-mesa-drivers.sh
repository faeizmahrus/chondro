#!/usr/bin/env bash
rpm-ostree override remove mesa-va-drivers --install mesa-va-drivers-freeworld
rpm-ostree install mesa-vdpau-drivers-freeworld