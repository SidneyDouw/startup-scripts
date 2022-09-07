#!/bin/bash

set -xe

mkdir "$HOME/stable_diffusion_web_ui"
cd "$HOME/stable_diffusion_web_ui"

if [[ -z "$PW" ]]; then
    echo "Please provie your huggingface password via the PW variable"
    exit
fi

curl -O https://github.com/JoshuaKimsey/Linux-StableDiffusion-Script/blob/main/linux-sd.sh
curl -L -O -u "sidney@magig.de:$PW" https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt

chmod +x linux-sd.sh