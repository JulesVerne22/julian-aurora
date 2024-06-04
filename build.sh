#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1
curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-40/wezfurlong-wezterm-nightly-fedora-40.repo

rpm-ostree install wezterm

rpm-ostree install neovim golang luarocks cargo ruby composer julia java-devel tree-sitter-cli fd-find

mkdir /etc/xdg/nvim && cd /etc/xdg/nvim && git clone --depth 1 https://github.com/JulesVerne22/JulianSmith.nvim.git . && git checkout ostree

npm install -g neovim

# this installs a package from fedora repos
rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
