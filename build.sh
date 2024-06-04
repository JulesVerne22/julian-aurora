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

curl --output-dir "/etc/yum.repos.d/" --remote-name https://copr.fedorainfracloud.org/coprs/atim/lazygit/repo/fedora-40/atim-lazygit-fedora-40.repo

rpm-ostree install lazygit

rpm-ostree install neovim golang luarocks cargo ruby composer julia java-devel tree-sitter-cli fd-find

echo "export WEZTERM_CONFIG_FILE=/usr/share/wezterm/wezterm.lua" >> /etc/profile

# this installs a package from fedora repos
rpm-ostree install screen

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket

ln -sf /usr/share/backgrounds/bluefin/WallPaper_SpringDay_Post.png /usr/share/backgrounds/default.png
ln -sf /usr/share/backgrounds/bluefin/WallPaper_SummerNight_Post.png /usr/share/backgrounds/default-dark.png
ln -sf /usr/share/backgrounds/bluefin/bluefin-spring-dynamic.xml /usr/share/backgrounds/default.xml
