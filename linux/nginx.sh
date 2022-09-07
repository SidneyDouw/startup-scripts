#!/bin/bash

set -xe

PPWD=$(pwd)

# change the working directory to the location of this script
cd "$(dirname "${BASH_SOURCE[0]}")"

# Arguments

dry_run="false"
domain_name=""
proxy_port=8080

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            echo
            echo "Installs, sets up and runs the latest versions of nginx"
            echo 
            echo "Usage:"
            echo
            echo "  -h|--help           Prints this message."
            echo "  -d|--dry-run        Runs the script without installing anything."
            echo "  --domain            Custom domain name, e.g. my-domain.com."
            echo "  --port              Proxy server port number."
            exit
            ;;
        -d|--dry-run)
            dry_run="true"
            shift
            ./util/prepare_dryrun.sh
            ;;
        --domain)
            domain_name=$2
            shift
            shift
            ;;
        --port)
            proxy_port=$2
            shift
            shift
            ;;
        *)
            echo "Unknown option $1"
            exit 1
            ;;
    esac
done

# Install, setup and run Nginx

echo "Installing and setting up Nginx"
if [[ $domain_name ]]; then
    echo "  with domain name $domain_name"
fi
echo "  with proxy server listening at localhost:$proxy_port"

if [[ $dry_run == "true" ]]; then
    exit
fi

apt install nginx -y

echo \
"server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name $domain_name;

    location / {
       proxy_pass http://localhost:$proxy_port;
       proxy_http_version 1.1;
       proxy_set_header Upgrade \$http_upgrade;
       proxy_set_header Connection 'upgrade';
       proxy_set_header Host \$host;
       proxy_cache_bypass \$http_upgrade;
   }
}" \
| tee /etc/nginx/sites-available/default

service nginx restart


# TODO: Setup certbot and certificate 

# apt install snapd
# snap install core
# snap refresh core

# snap install --classic certbot
# ln -s /snap/bin/certbot /usr/bin/certbot

# snap set certbot trust-plugin-with-root=ok
# snap install certbot-dns-route53

# AWS_DEFAULT_REGION=eu-central-1
# AWS_ACCESS_KEY_ID= 
# AWS_SECRET_ACCESS_KEY= 

# certbot -n --agree-tos -m sd@om.tv --dns-route53 -d "henkel-beauty-maco.de" -d "*.henkel-beauty-maco.de" -i nginx

# snap install --classic aws-cli
# aws acm import-certificate \
#     --certificate file:///etc/letsencrypt/live/henkel-beauty-maco.de/cert.pem \
#     --private-key file:///etc/letsencrypt/live/henkel-beauty-maco.de/privkey.pem \
#     --certificate-chain file:///etc/letsencrypt/live/henkel-beauty-maco.de/chain.pem


# certbot --nginx -n --agree-tos -m sd@om.tv -d henkel-beauty-maco.de

# change the working directory to the previous working directory
cd "$PPWD"

