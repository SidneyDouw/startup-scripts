#!/bin/bash

set -xe

md "$HOME/stable_diffusion_web_ui"
cd "$HOME/stable_diffusion_web_ui"

curl -O https://github.com/JoshuaKimsey/Linux-StableDiffusion-Script/blob/main/linux-sd.sh
curl -L -O -u "sidney@magig.de:$PW" https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt

chmod +x linux-sd.sh