#!/bin/bash

set -xe

if [[ -z "$PW" ]]; then
    echo "Please provie your huggingface password via the PW variable"
    exit
fi

mkdir "$HOME/stable_diffusion_web_ui"
cd "$HOME/stable_diffusion_web_ui"

curl -O https://raw.githubusercontent.com/JoshuaKimsey/Linux-StableDiffusion-Script/main/linux-sd.sh

(
    mkdir "Models"
    cd "Models"
    curl -L -O -u "sidney@magig.de:$PW" https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
)

chmod +x linux-sd.sh

./linux-sd.sh