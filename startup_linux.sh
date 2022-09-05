#!/bin/bash

set -xe

echo "$HOME"
HOME="/home/ubuntu"

startup_scripts_folder=".startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$HOME/$startup_scripts_folder" --depth 1 || true

if [ ! -f /etc/init.d/startup-script ]; then
    echo \
"#!/bin/sh

### BEGIN INIT INFO
# Provides:          startup-script
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin

case \$1 in
    start)
        $HOME/$startup_scripts_folder/startup_linux.sh
        ;;
    stop|restart|reload)
        ;;
esac" \
| sudo tee /etc/init.d/startup-script

sudo chmod +x /etc/init.d/startup-script
fi

before_reboot(){
    cd "$HOME/$startup_scripts_folder/linux"
    ./updates.sh
}

after_reboot(){
    ./nvm.sh
}

if [ -f /var/run/rebooting-for-updates ]; then
    after_reboot
    rm /var/run/rebooting-for-updates
    update-rc.d startup-script remove
else
    before_reboot
    sudo touch /var/run/rebooting-for-updates
    update-rc.d startup-script defaults
    sudo reboot now
fi

