#This is will install everything for you. 
#
<<comment
TODO:
--Fedora
    -- Fixig so i3lock-color get all the dependencies
    -- TEST the script
    -- I think it working right now
--Opensuse
    -- Tested with opensuse tumbleweed Gnome installation
--Arch
--Ubuntu
comment

if [ $1 == "Fedora" ]; then
    sudo dnf install -y awesome git google-roboto-fonts rofi compton xclip qt5-qtstyleplugins materia-gtk-theme lxappearance papirus-icon-theme spectacle ImageMagick gawk util-linux
    sudo dnf groupinstall -y "Development Tools"
    git clone https://github.com/erlaan/material-awesome.git ~/.config/awesome
    mkdir ~/git
    cd ~/git
    git clone https://github.com/Raymo111/i3lock-color.git
    git clone https://github.com/meskarune/i3lock-fancy.git
    cd ~/git/i3lock-color
    chmod +x install-i3lock-color.sh
    ./install-i3lock-color.sh
    cd ~/git/i3lock-fancy
    sudo make install
    sudo bash -c 'echo "XBG_CURRENT_DESKTOP=Unity" >> /etc/environment'
    sudo bash -c 'echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment'
    echo "Should be done now!"
    exit
elif [ $1 == "Opensuse"]; then
    sudo zypper install awesome rofi compton git-core autoconf gcc make pam-devel pkg-config automake xcb-util-image-devel xcb-util-xrm-devel libev-devel libxkbcommon-devel libxkbcommon-x11-devel cairo-devel libjpeg62-devel libqt5-qtstyleplugins materia-gtk-theme papirus-icon-theme lxappearance
    mkdir ~/git
    cd ~/git
    git clone https://github.com/Raymo111/i3lock-color.git
    git clone https://github.com/meskarune/i3lock-fancy.git
    cd ~/git/i3lock-color
    chmod +x build.sh
    ./build.sh
    chmod +x install-i3lock-color.sh
    ./install-i3lock-color.sh
    cd ~/git/i3lock-fancy
    sudo make install
    cd ..
    git clone https://github.com/erlaan/material-awesome.git ~/.config/awesome
    sudo bash -c 'echo "XBG_CURRENT_DESKTOP=Unity" >> /etc/environment'
    sudo bash -c 'echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment'
    echo "Should be done now"
    exit
else
    echo "You need to run command as ./INSTALL.sh Fedora"
    echo "Or ./INSTALL.sh Opensuse"
fi

