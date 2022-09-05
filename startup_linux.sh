#!/bin/bash

set -xe

echo "$HOME"
HOME="/home/ubuntu"

startup_scripts_folder=".startup-scripts"

git clone https://github.com/SidneyDouw/startup-scripts.git "$HOME/$startup_scripts_folder" --depth 1

if [ ! -f /etc/init.d/startup_script ]; then
    echo \
"#!/bin/sh

### BEGIN INIT INFO
# Provides:          startup_script
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin

case \$1 in
    start)
        $HOME/$startup_scripts_folder/startup_linux.sh
        ;;
    stop|restart|reload)
        ;;
esac"
fi

if [ -f /var/run/rebooting-for-updates ]; then
    after_reboot
    rm /var/run/rebooting-for-updates
    update-rc.d myupdate remove
else
    before_reboot
    touch /var/run/rebooting-for-updates
    update-rc.d myupdate defaults
    sudo reboot now
fi

before_reboot(){
    cd "$HOME/.startup-scripts/linux"
    ./updates.sh
}

after_reboot(){
    ./nvm.sh
}