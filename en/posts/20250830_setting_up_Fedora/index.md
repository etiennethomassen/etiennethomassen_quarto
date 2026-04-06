---
title: Setting up Fedora
authors:
  - Etiënne Thomassen
date: 2025-08-30T15:00:00+01:00
update: 2025-0l-09
created_at: 2025-08-30
samenvatting: Setting up Fedora
categories:
 - Linux
 - Fedora
lang: en
---

I migrated to Fedora Linux today, because I was searching for a Gnome distro with up-to-date packages that could replace my aging Pop!_OS install. This post just serves as a reminder to myself what I did to get it to my liking.

## Gnome tweaks and extensions

To be able to tweak Gnome, install gnome-tweaks and gnome-extensions.

    $ sudo dnf install -y gnome-tweaks gnome-extensions-app

Changes I applied:
- Caps Lock behaves as an additional Esc

## Install Nerd Fonts

In order to get nice icons in terminal and vim.

    $ sudo dnf copr enable astrawan/nerd-fonts
    $ sudo dnf install nerd-firacode-fonts

## Install Microsoft Fonts

    # Install supporting packages
    $ sudo dnf install curl cabextract xorg-x11-font-utils fontconfig
    # Install fonts
    $ sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
    # Rebuild the font cache with 
    $ sudo fc-cache -fv
    
[Source](https://discussion.fedoraproject.org/t/how-to-install-ms-fonts/156063/2)

## Enable R Copr repository and install manager

    $ sudo dnf copr enable iucar/cran
    $ sudo dnf install R-CoprManager

R-Studio is in another repo

    $ sudo dnf copr enable iucar/rstudio
    $ sudo dnf install rstudio-desktop

[Entry on CRAN](https://cran.r-project.org/bin/linux/fedora)
[Github repository of cran2copr](https://github.com/cran4linux/cran2copr)

## Applications

I am not including every application I installed, but those I could not install via dnf or as a flatpak

### Zotero

Zotero is a reference manager: [https://www.zotero.org](https://www.zotero.org)

Library needed for Zotero to run

    $ sudo dnf install dbus-glib

Download and untar, then mover to /opt folder.

    $ sudo mv Zotero_linux-x86_64 /opt/zotero
    $ cd /opt/zotero
    $ ./zotero

Add launcher

    $ ./set_launcher_icon
    $ ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

