#!/bin/bash
set -e

./apt-ipfs remove -y zurl
./apt-ipfs remove -y hello

rm -f /var/cache/apt/archives/zurl_1.5.1-1build1_amd64.deb
rm -f /var/cache/apt/archives/apt-ipfs/*
rm -f /var/cache/apt/archives/hello_2.10-1_amd64.deb

#QmdMC1FzBReFajZtXiGNykGhc2jfZtwP51mUGBxFEs847s
#QmNULZdymNqjLrSamFfWE5e3veaJGy5GbdXtF5CmQYp6uj
#QmVFTtggRRRHxdLZrXm8eR8Sw6y6Z12TcF6WPyaWzgvpgY

#ipfs add-link