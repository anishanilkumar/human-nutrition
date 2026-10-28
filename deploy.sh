#!/bin/sh
# Ship the page to the NixOS server. The vhost lives in ~/projects/infra/nixos_config
# (configuration.nix); this only updates what it serves.
set -eu
cd "$(dirname "$0")"
HOST="${HUMAN_NUTRITION_HOST:-anish@vps.anishsheela.com}"
rsync -av --delete index.html fonts "$HOST:/var/www/human-nutrition.anishsheela.com/"
echo "Deployed: https://human-nutrition.anishsheela.com"
